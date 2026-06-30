import type { Database } from '../lib/supabase';

export type Student = Database['public']['Tables']['students']['Row'];
export type StudentInsert = Database['public']['Tables']['students']['Insert'];
export type Semester = Database['public']['Tables']['semesters']['Row'];
export type Subject = Database['public']['Tables']['subjects']['Row'];
export type Grade = Database['public']['Tables']['grades']['Row'];
export type GradeInsert = Database['public']['Tables']['grades']['Insert'];
export type CgpaHistory = Database['public']['Tables']['cgpa_history']['Row'];
export type DepartmentStats = Database['public']['Tables']['department_statistics']['Row'];

export interface SubjectWithGrade extends Subject {
  grade?: string;
  grade_id?: string;
  grade_point?: number;
  is_arrear?: boolean;
  original_semester?: number;
}

export interface SemesterData {
  semester_number: number;
  subjects: SubjectWithGrade[];
  sgpa: number;
  total_credits: number;
  earned_credits: number;
}

export interface CgpaStats {
  cgpa: number;
  total_credits: number;
  earned_credits: number;
  completed_semesters: number;
}

export const GRADE_POINTS: Record<string, number | null> = {
  'O': 10,
  'A+': 9,
  'A': 8,
  'B+': 7,
  'B': 6,
  'C': 5,
  'RA': 0,
  'AB': null,
};

export const GRADES = ['O', 'A+', 'A', 'B+', 'B', 'C', 'RA', 'AB'] as const;
export type GradeType = typeof GRADES[number];
