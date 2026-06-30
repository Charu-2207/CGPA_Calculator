import { supabase } from '../lib/supabase';
import type { Student, Subject, Grade, CgpaHistory, DepartmentStats, SubjectWithGrade } from '../types';
import { getGradePoint } from '../utils/calculations';

export async function getStudentByRegisterNumber(registerNumber: string): Promise<Student | null> {
  const { data, error } = await supabase
    .from('students')
    .select('*')
    .eq('register_number', registerNumber)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getStudentById(id: string): Promise<Student | null> {
  const { data, error } = await supabase
    .from('students')
    .select('*')
    .eq('id', id)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function createStudent(student: {
  id: string;
  register_number: string;
  student_name: string;
  department: string;
  batch_year: number;
}): Promise<Student> {
  const { data, error } = await supabase
    .from('students')
    .insert(student)
    .select()
    .single();

  if (error) throw error;
  return data;
}

export async function getSemesters(department: string): Promise<number[]> {
  const { data, error } = await supabase
    .from('semesters')
    .select('semester_number')
    .eq('department', department)
    .order('semester_number');

  if (error) throw error;
  return data.map(s => s.semester_number);
}

export async function getSubjects(semesterNumber: number, department: string): Promise<Subject[]> {
  const { data: semester } = await supabase
    .from('semesters')
    .select('id')
    .eq('semester_number', semesterNumber)
    .eq('department', department)
    .maybeSingle();

  if (!semester) return [];

  const { data, error } = await supabase
    .from('subjects')
    .select('*')
    .eq('semester_id', semester.id)
    .order('subject_code');

  if (error) throw error;
  return data;
}

export async function getStudentGrades(studentId: string): Promise<Grade[]> {
  const { data, error } = await supabase
    .from('grades')
    .select('*')
    .eq('student_id', studentId);

  if (error) throw error;
  return data;
}

export async function getArrearSubjects(
  studentId: string,
  currentSemester: number,
  department: string
): Promise<SubjectWithGrade[]> {
  // Get all grades with RA or AB (arrear grades) from previous semesters
  const { data: arrearGrades, error } = await supabase
    .from('grades')
    .select('*')
    .eq('student_id', studentId)
    .in('grade', ['RA', 'AB'])
    .lt('semester_number', currentSemester);

  if (error) throw error;

  // Get subject details for each arrear
  const arrearsWithSubjects: SubjectWithGrade[] = [];

  for (const arrearGrade of arrearGrades || []) {
    // Check if this arrear has been cleared in a later semester
    const { data: clearedGrade } = await supabase
      .from('grades')
      .select('id')
      .eq('student_id', studentId)
      .eq('subject_id', arrearGrade.subject_id)
      .not('grade', 'in', '("RA","AB")')
      .gt('semester_number', arrearGrade.semester_number)
      .maybeSingle();

    // If not cleared, it's still an active arrear
    if (!clearedGrade) {
      const subject = await getSubjectById(arrearGrade.subject_id);
      if (subject) {
        arrearsWithSubjects.push({
          ...subject,
          grade: arrearGrade.grade,
          grade_id: arrearGrade.id,
          grade_point: arrearGrade.grade_point,
          is_arrear: true,
          original_semester: arrearGrade.semester_number,
        });
      }
    }
  }

  return arrearsWithSubjects;
}

export async function getSubjectById(subjectId: string): Promise<Subject | null> {
  const { data, error } = await supabase
    .from('subjects')
    .select('*')
    .eq('id', subjectId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getSubjectsForSemester(
  semesterNumber: number,
  department: string,
  studentId: string
): Promise<SubjectWithGrade[]> {
  const [subjects, grades] = await Promise.all([
    getSubjects(semesterNumber, department),
    getStudentGrades(studentId),
  ]);

  const gradeMap = new Map(grades.map(g => [g.subject_id, g]));

  return subjects.map(subject => ({
    ...subject,
    grade: gradeMap.get(subject.id)?.grade,
    grade_id: gradeMap.get(subject.id)?.id,
    grade_point: gradeMap.get(subject.id)?.grade_point,
  }));
}

export async function upsertGrade(
  studentId: string,
  subjectId: string,
  semesterNumber: number,
  grade: string,
  credits: number,
  isArrear: boolean = false
): Promise<Grade> {
  const gradePoint = getGradePoint(grade);

  const existingGrade = await supabase
    .from('grades')
    .select('id')
    .eq('student_id', studentId)
    .eq('subject_id', subjectId)
    .eq('semester_number', semesterNumber)
    .maybeSingle();

  if (existingGrade.data) {
    const { data, error } = await supabase
      .from('grades')
      .update({ grade, grade_point: gradePoint, credits, is_arrear: isArrear })
      .eq('id', existingGrade.data.id)
      .select()
      .single();

    if (error) throw error;
    return data;
  } else {
    const { data, error } = await supabase
      .from('grades')
      .insert({
        student_id: studentId,
        subject_id: subjectId,
        semester_number: semesterNumber,
        grade,
        grade_point: gradePoint,
        credits,
        is_arrear: isArrear,
      })
      .select()
      .single();

    if (error) throw error;
    return data;
  }
}

export async function deleteGrade(gradeId: string): Promise<void> {
  const { error } = await supabase
    .from('grades')
    .delete()
    .eq('id', gradeId);

  if (error) throw error;
}

export async function getCgpaHistory(studentId: string): Promise<CgpaHistory[]> {
  const { data, error } = await supabase
    .from('cgpa_history')
    .select('*')
    .eq('student_id', studentId)
    .order('semester_number');

  if (error) throw error;
  return data;
}

export async function upsertCgpaHistory(
  studentId: string,
  semesterNumber: number,
  sgpa: number,
  cgpa: number
): Promise<CgpaHistory> {
  const { data, error } = await supabase
    .from('cgpa_history')
    .upsert(
      { student_id: studentId, semester_number: semesterNumber, sgpa, cgpa },
      { onConflict: 'student_id,semester_number' }
    )
    .select()
    .single();

  if (error) throw error;
  return data;
}

export async function getDepartmentStats(department: string): Promise<DepartmentStats[]> {
  const { data, error } = await supabase
    .from('department_statistics')
    .select('*')
    .eq('department', department)
    .order('semester_number');

  if (error) throw error;
  return data;
}

export async function addCustomSubject(
  semesterNumber: number,
  department: string,
  subjectCode: string,
  subjectName: string,
  credits: number,
  isElective: boolean
): Promise<Subject> {
  const { data: semester } = await supabase
    .from('semesters')
    .select('id')
    .eq('semester_number', semesterNumber)
    .eq('department', department)
    .maybeSingle();

  if (!semester) throw new Error('Semester not found');

  const { data, error } = await supabase
    .from('subjects')
    .insert({
      semester_id: semester.id,
      subject_code: subjectCode,
      subject_name: subjectName,
      credits,
      is_elective: isElective,
    })
    .select()
    .single();

  if (error) throw error;
  return data;
}
