import { GRADE_POINTS, type SubjectWithGrade } from '../types';

export function calculateSGPA(subjects: SubjectWithGrade[]): number {
  const gradedSubjects = subjects.filter(s => s.grade && s.grade_point !== undefined);

  if (gradedSubjects.length === 0) return 0;

  const totalPoints = gradedSubjects.reduce((sum, s) => sum + (s.grade_point! * s.credits), 0);
  const totalCredits = gradedSubjects.reduce((sum, s) => sum + s.credits, 0);

  if (totalCredits === 0) return 0;

  return Math.round((totalPoints / totalCredits) * 100) / 100;
}

export function calculateCGPA(allSemesters: { sgpa: number; total_credits: number }[]): number {
  const validSemesters = allSemesters.filter(s => s.sgpa > 0 && s.total_credits > 0);

  if (validSemesters.length === 0) return 0;

  const totalPoints = validSemesters.reduce((sum, s) => sum + (s.sgpa * s.total_credits), 0);
  const totalCredits = validSemesters.reduce((sum, s) => sum + s.total_credits, 0);

  if (totalCredits === 0) return 0;

  return Math.round((totalPoints / totalCredits) * 100) / 100;
}

export function getGradePoint(grade: string): number {
  const points = GRADE_POINTS[grade];
  return points ?? 0;
}

export function getTotalCredits(subjects: SubjectWithGrade[]): number {
  return subjects.reduce((sum, s) => sum + s.credits, 0);
}

export function getEarnedCredits(subjects: SubjectWithGrade[]): number {
  return subjects.filter(s => s.grade && s.grade !== 'RA' && s.grade !== 'AB').reduce((sum, s) => sum + s.credits, 0);
}

export function calculateRankPercentile(studentCgpa: number, avgCgpa: number): number {
  if (studentCgpa <= avgCgpa) return 50;
  const diff = studentCgpa - avgCgpa;
  const percentile = 50 + (diff * 20);
  return Math.min(Math.round(percentile), 99);
}

export function formatCgpa(value: number): string {
  return value.toFixed(2);
}
