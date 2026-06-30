import { useState, useCallback } from 'react';
import {
  getStudentGrades,
  getCgpaHistory,
  getSubjects,
  upsertCgpaHistory
} from '../services/database';
import type { SemesterData, SubjectWithGrade, CgpaHistory, Grade } from '../types';
import { calculateSGPA, calculateCGPA, getTotalCredits, getEarnedCredits } from '../utils/calculations';

interface UseCgpaDataReturn {
  semesterData: SemesterData[];
  cgpaHistory: CgpaHistory[];
  loading: boolean;
  error: string | null;
  cgpa: number;
  totalCredits: number;
  completedSemesters: number;
  loadData: (studentId: string, department: string) => Promise<void>;
  saveSemesterHistory: (studentId: string, semesterNumber: number) => Promise<void>;
}

export function useCgpaData(): UseCgpaDataReturn {
  const [semesterData, setSemesterData] = useState<SemesterData[]>([]);
  const [cgpaHistory, setCgpaHistory] = useState<CgpaHistory[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const loadData = useCallback(async (studentId: string, department: string) => {
    setLoading(true);
    setError(null);

    try {
      const [grades, history, allSubjects] = await Promise.all([
        getStudentGrades(studentId),
        getCgpaHistory(studentId),
        Promise.all([1, 2, 3, 4, 5, 6, 7, 8].map(sem => getSubjects(sem, department))),
      ]);

      const subjectsBySemester = new Map<number, SubjectWithGrade[]>();
      const gradeMap = new Map(grades.map(g => [g.subject_id, g]));

      // Build a map of all subjects for arrear lookup
      const allSubjectsFlat = allSubjects.flat();
      const subjectMap = new Map(allSubjectsFlat.map(s => [s.id, s]));

      // Process regular subjects for each semester
      allSubjects.forEach((subjects, idx) => {
        const semNum = idx + 1;
        const subjectsWithGrades: SubjectWithGrade[] = subjects.map(subject => {
          const gradeRecord = gradeMap.get(subject.id);
          // Only include grade if it's not an arrear (cleared in this semester)
          const isArrear = gradeRecord?.is_arrear ?? false;
          return {
            ...subject,
            grade: isArrear ? undefined : gradeRecord?.grade,
            grade_id: isArrear ? undefined : gradeRecord?.id,
            grade_point: isArrear ? undefined : gradeRecord?.grade_point,
            is_arrear: false,
          };
        });

        // Add arrear subjects that are being cleared in this semester
        const arrearGrades = grades.filter(g =>
          g.semester_number === semNum && g.is_arrear
        );

        arrearGrades.forEach(arrearGrade => {
          const subject = subjectMap.get(arrearGrade.subject_id);
          if (subject) {
            subjectsWithGrades.push({
              ...subject,
              grade: arrearGrade.grade,
              grade_id: arrearGrade.id,
              grade_point: arrearGrade.grade_point,
              is_arrear: true,
              original_semester: grades.find(g =>
                g.subject_id === arrearGrade.subject_id &&
                !g.is_arrear &&
                (g.grade === 'RA' || g.grade === 'AB')
              )?.semester_number,
            });
          }
        });

        subjectsBySemester.set(semNum, subjectsWithGrades);
      });

      const data: SemesterData[] = [];
      for (let sem = 1; sem <= 8; sem++) {
        const subjects = subjectsBySemester.get(sem) || [];
        const gradedSubjects = subjects.filter(s => s.grade);
        if (gradedSubjects.length > 0) {
          const sgpa = calculateSGPA(subjects);
          const totalCredits = getTotalCredits(subjects);
          const earnedCredits = getEarnedCredits(subjects);
          data.push({
            semester_number: sem,
            subjects,
            sgpa,
            total_credits: totalCredits,
            earned_credits: earnedCredits,
          });
        }
      }

      setSemesterData(data);
      setCgpaHistory(history);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load CGPA data');
    } finally {
      setLoading(false);
    }
  }, []);

  const saveSemesterHistory = useCallback(async (
    studentId: string,
    semesterNumber: number
  ) => {
    const semData = semesterData.find(s => s.semester_number === semesterNumber);
    if (!semData) return;

    const sgpa = semData.sgpa;
    const allSgpa = semesterData
      .filter(s => s.semester_number <= semesterNumber)
      .map(s => ({ sgpa: s.sgpa, total_credits: s.total_credits }));

    const cgpa = calculateCGPA(allSgpa);

    await upsertCgpaHistory(studentId, semesterNumber, sgpa, cgpa);
  }, [semesterData]);

  const cgpa = semesterData.length > 0
    ? calculateCGPA(semesterData.map(s => ({ sgpa: s.sgpa, total_credits: s.total_credits })))
    : 0;

  const totalCredits = semesterData.reduce((sum, s) => sum + s.earned_credits, 0);
  const completedSemesters = semesterData.length;

  return {
    semesterData,
    cgpaHistory,
    loading,
    error,
    cgpa,
    totalCredits,
    completedSemesters,
    loadData,
    saveSemesterHistory,
  };
}
