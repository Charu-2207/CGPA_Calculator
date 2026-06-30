import { useState, useCallback } from 'react';
import { getSubjectsForSemester, deleteGrade } from '../services/database';
import type { SubjectWithGrade } from '../types';
import { calculateSGPA, getTotalCredits, getEarnedCredits } from '../utils/calculations';

interface UseSemesterDataReturn {
  subjects: SubjectWithGrade[];
  loading: boolean;
  error: string | null;
  sgpa: number;
  totalCredits: number;
  earnedCredits: number;
  loadSubjects: (semesterNumber: number, department: string, studentId: string) => Promise<void>;
  updateGrade: (subjectId: string, grade: string, credits: number) => Promise<void>;
  removeGrade: (gradeId: string) => Promise<void>;
}

export function useSemesterData(): UseSemesterDataReturn {
  const [subjects, setSubjects] = useState<SubjectWithGrade[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const loadSubjects = useCallback(async (
    semesterNumber: number,
    department: string,
    studentId: string
  ) => {
    setLoading(true);
    setError(null);

    try {
      const data = await getSubjectsForSemester(semesterNumber, department, studentId);
      setSubjects(data);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load subjects');
      setSubjects([]);
    } finally {
      setLoading(false);
    }
  }, []);

  const updateGrade = useCallback(async (
    _subjectId: string,
    grade: string,
    _credits: number
  ) => {
    // Grade is updated directly via SemesterPage component
    // This is a placeholder for potential future enhancements
    const gradePoint = grade === 'O' ? 10 : grade === 'A+' ? 9 : grade === 'A' ? 8 :
                       grade === 'B+' ? 7 : grade === 'B' ? 6 : grade === 'C' ? 5 :
                       grade === 'RA' ? 0 : 0;

    setSubjects(prev => prev.map(s =>
      s.id === _subjectId
        ? {
            ...s,
            grade,
            grade_id: s.grade_id || 'temp',
            grade_point: gradePoint,
          }
        : s
    ));
  }, []);

  const removeGrade = useCallback(async (gradeId: string) => {
    try {
      await deleteGrade(gradeId);
      setSubjects(prev => prev.map(s =>
        s.grade_id === gradeId
          ? { ...s, grade: undefined, grade_id: undefined, grade_point: undefined }
          : s
      ));
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to remove grade');
    }
  }, []);

  const sgpa = calculateSGPA(subjects);
  const totalCredits = getTotalCredits(subjects);
  const earnedCredits = getEarnedCredits(subjects);

  return {
    subjects,
    loading,
    error,
    sgpa,
    totalCredits,
    earnedCredits,
    loadSubjects,
    updateGrade,
    removeGrade,
  };
}
