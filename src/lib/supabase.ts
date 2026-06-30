import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

// Log for debugging (remove in production)
console.log('Supabase URL:', supabaseUrl ? 'set' : 'missing');
console.log('Supabase Key:', supabaseAnonKey ? 'set' : 'missing');

// Create client even with missing vars (will fail gracefully on API calls)
export const supabase = supabaseUrl && supabaseAnonKey
  ? createClient(supabaseUrl, supabaseAnonKey)
  : createClient('https://placeholder.supabase.co', 'placeholder-key');

export const isSupabaseConfigured = !!(supabaseUrl && supabaseAnonKey);

export type Database = {
  public: {
    Tables: {
      students: {
        Row: {
          id: string;
          register_number: string;
          student_name: string;
          department: string;
          batch_year: number;
        };
        Insert: {
          id?: string;
          register_number: string;
          student_name: string;
          department: string;
          batch_year: number;
        };
        Update: {
          id?: string;
          register_number?: string;
          student_name?: string;
          department?: string;
          batch_year?: number;
        };
      };
      semesters: {
        Row: {
          id: string;
          semester_number: number;
          department: string;
        };
        Insert: {
          id?: string;
          semester_number: number;
          department: string;
        };
        Update: {
          id?: string;
          semester_number?: number;
          department?: string;
        };
      };
      subjects: {
        Row: {
          id: string;
          semester_id: string;
          subject_code: string;
          subject_name: string;
          credits: number;
          is_elective: boolean;
        };
        Insert: {
          id?: string;
          semester_id: string;
          subject_code: string;
          subject_name: string;
          credits: number;
          is_elective?: boolean;
        };
        Update: {
          id?: string;
          semester_id?: string;
          subject_code?: string;
          subject_name?: string;
          credits?: number;
          is_elective?: boolean;
        };
      };
      grades: {
        Row: {
          id: string;
          student_id: string;
          subject_id: string;
          semester_number: number;
          grade: string;
          grade_point: number;
          credits: number;
          is_arrear: boolean;
          created_at: string;
        };
        Insert: {
          id?: string;
          student_id: string;
          subject_id: string;
          semester_number: number;
          grade: string;
          grade_point: number;
          credits: number;
          is_arrear?: boolean;
          created_at?: string;
        };
        Update: {
          id?: string;
          student_id?: string;
          subject_id?: string;
          semester_number?: number;
          grade?: string;
          grade_point?: number;
          credits?: number;
          is_arrear?: boolean;
          created_at?: string;
        };
      };
      cgpa_history: {
        Row: {
          id: string;
          student_id: string;
          semester_number: number;
          sgpa: number;
          cgpa: number;
          created_at: string;
        };
        Insert: {
          id?: string;
          student_id: string;
          semester_number: number;
          sgpa: number;
          cgpa: number;
          created_at?: string;
        };
        Update: {
          id?: string;
          student_id?: string;
          semester_number?: number;
          sgpa?: number;
          cgpa?: number;
          created_at?: string;
        };
      };
      department_statistics: {
        Row: {
          id: string;
          department: string;
          semester_number: number;
          average_sgpa: number;
          average_cgpa: number;
          top_score: number;
          student_count: number;
          updated_at: string;
        };
        Insert: {
          id?: string;
          department: string;
          semester_number: number;
          average_sgpa?: number;
          average_cgpa?: number;
          top_score?: number;
          student_count?: number;
          updated_at?: string;
        };
        Update: {
          id?: string;
          department?: string;
          semester_number?: number;
          average_sgpa?: number;
          average_cgpa?: number;
          top_score?: number;
          student_count?: number;
          updated_at?: string;
        };
      };
    };
    Views: {};
    Functions: {};
    Enums: {};
  };
};
