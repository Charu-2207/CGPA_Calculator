/*
# CGPA Academic Analytics Platform - Database Schema

1. New Tables
- `students`: Student profiles with registration details
  - id (uuid, primary key)
  - register_number (text, unique) - student registration number
  - student_name (text) - full name
  - department (text) - e.g., CSE, ECE, MECH
  - batch_year (integer) - admission year
  - email (text, unique) - student email
  - created_at (timestamp)
  
- `semesters`: Semester definitions per department
  - id (uuid, primary key)
  - semester_number (integer) - 1-8
  - department (text) - department code
  
- `subjects`: Subject catalog linked to semesters
  - id (uuid, primary key)
  - semester_id (uuid, foreign key)
  - subject_code (text) - e.g., CS101
  - subject_name (text) - full subject name
  - credits (integer) - credit value
  - is_elective (boolean) - elective flag
  
- `grades`: Student grade records
  - id (uuid, primary key)
  - student_id (uuid, foreign key)
  - subject_id (uuid, foreign key)
  - semester_number (integer)
  - grade (text) - letter grade (O, A+, A, B+, B, C, P, F)
  - grade_point (integer) - numeric value 0-10
  - credits (integer) - credit value at time of grading
  - created_at (timestamp)
  
- `cgpa_history`: Historical CGPA records per semester
  - id (uuid, primary key)
  - student_id (uuid, foreign key)
  - semester_number (integer)
  - sgpa (decimal) - semester GPA
  - cgpa (decimal) - cumulative GPA
  - created_at (timestamp)
  
- `department_statistics`: Department-level analytics
  - id (uuid, primary key)
  - department (text)
  - semester_number (integer)
  - average_sgpa (decimal)
  - average_cgpa (decimal)
  - top_score (decimal)
  - student_count (integer)
  - updated_at (timestamp)

2. Security
- Enable RLS on all tables
- Students can read/write their own data
- Public read access for semesters, subjects, and department_statistics (reference data)
- Authenticated-only write for grades and history

3. Notes
- This is a multi-user app with sign-in required
- Each student sees only their own grades and history
- Reference tables (semesters, subjects, department_statistics) are readable by all authenticated users
- Email confirmation is OFF for easier onboarding
*/

-- Students table
CREATE TABLE IF NOT EXISTS students (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  register_number text UNIQUE NOT NULL,
  student_name text NOT NULL,
  department text NOT NULL,
  batch_year integer NOT NULL,
  email text UNIQUE NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Semesters table (reference data)
CREATE TABLE IF NOT EXISTS semesters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  semester_number integer NOT NULL CHECK (semester_number BETWEEN 1 AND 8),
  department text NOT NULL,
  UNIQUE(semester_number, department)
);

-- Subjects table (reference data)
CREATE TABLE IF NOT EXISTS subjects (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  semester_id uuid REFERENCES semesters(id) ON DELETE CASCADE,
  subject_code text NOT NULL,
  subject_name text NOT NULL,
  credits integer NOT NULL CHECK (credits > 0),
  is_elective boolean DEFAULT false,
  UNIQUE(subject_code, semester_id)
);

-- Grades table (student data)
CREATE TABLE IF NOT EXISTS grades (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id uuid REFERENCES students(id) ON DELETE CASCADE,
  subject_id uuid REFERENCES subjects(id) ON DELETE CASCADE,
  semester_number integer NOT NULL,
  grade text NOT NULL,
  grade_point integer NOT NULL CHECK (grade_point BETWEEN 0 AND 10),
  credits integer NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(student_id, subject_id)
);

-- CGPA History table
CREATE TABLE IF NOT EXISTS cgpa_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id uuid REFERENCES students(id) ON DELETE CASCADE,
  semester_number integer NOT NULL,
  sgpa decimal(4,2) NOT NULL,
  cgpa decimal(4,2) NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(student_id, semester_number)
);

-- Department Statistics table (read-only for students)
CREATE TABLE IF NOT EXISTS department_statistics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  department text NOT NULL,
  semester_number integer NOT NULL,
  average_sgpa decimal(4,2),
  average_cgpa decimal(4,2),
  top_score decimal(4,2),
  student_count integer DEFAULT 0,
  updated_at timestamptz DEFAULT now(),
  UNIQUE(department, semester_number)
);

-- Enable RLS on all tables
ALTER TABLE students ENABLE ROW LEVEL SECURITY;
ALTER TABLE semesters ENABLE ROW LEVEL SECURITY;
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE grades ENABLE ROW LEVEL SECURITY;
ALTER TABLE cgpa_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE department_statistics ENABLE ROW LEVEL SECURITY;

-- Students policies (owner-scoped)
DROP POLICY IF EXISTS "select_own_students" ON students;
CREATE POLICY "select_own_students" ON students FOR SELECT
  TO authenticated USING (auth.uid() = id);

DROP POLICY IF EXISTS "insert_own_students" ON students;
CREATE POLICY "insert_own_students" ON students FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = id);

DROP POLICY IF EXISTS "update_own_students" ON students;
CREATE POLICY "update_own_students" ON students FOR UPDATE
  TO authenticated USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- Semesters policies (public read for authenticated)
DROP POLICY IF EXISTS "read_semesters" ON semesters;
CREATE POLICY "read_semesters" ON semesters FOR SELECT
  TO authenticated USING (true);

-- Subjects policies (public read for authenticated)
DROP POLICY IF EXISTS "read_subjects" ON subjects;
CREATE POLICY "read_subjects" ON subjects FOR SELECT
  TO authenticated USING (true);

-- Grades policies (owner-scoped)
DROP POLICY IF EXISTS "select_own_grades" ON grades;
CREATE POLICY "select_own_grades" ON grades FOR SELECT
  TO authenticated USING (auth.uid() = student_id);

DROP POLICY IF EXISTS "insert_own_grades" ON grades;
CREATE POLICY "insert_own_grades" ON grades FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "update_own_grades" ON grades;
CREATE POLICY "update_own_grades" ON grades FOR UPDATE
  TO authenticated USING (auth.uid() = student_id) WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "delete_own_grades" ON grades;
CREATE POLICY "delete_own_grades" ON grades FOR DELETE
  TO authenticated USING (auth.uid() = student_id);

-- CGPA History policies (owner-scoped)
DROP POLICY IF EXISTS "select_own_cgpa_history" ON cgpa_history;
CREATE POLICY "select_own_cgpa_history" ON cgpa_history FOR SELECT
  TO authenticated USING (auth.uid() = student_id);

DROP POLICY IF EXISTS "insert_own_cgpa_history" ON cgpa_history;
CREATE POLICY "insert_own_cgpa_history" ON cgpa_history FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = student_id);

DROP POLICY IF EXISTS "update_own_cgpa_history" ON cgpa_history;
CREATE POLICY "update_own_cgpa_history" ON cgpa_history FOR UPDATE
  TO authenticated USING (auth.uid() = student_id) WITH CHECK (auth.uid() = student_id);

-- Department Statistics policies (public read for authenticated)
DROP POLICY IF EXISTS "read_department_statistics" ON department_statistics;
CREATE POLICY "read_department_statistics" ON department_statistics FOR SELECT
  TO authenticated USING (true);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_grades_student_id ON grades(student_id);
CREATE INDEX IF NOT EXISTS idx_grades_semester ON grades(semester_number);
CREATE INDEX IF NOT EXISTS idx_subjects_semester_id ON subjects(semester_id);
CREATE INDEX IF NOT EXISTS idx_cgpa_history_student ON cgpa_history(student_id);
CREATE INDEX IF NOT EXISTS idx_students_department ON students(department);