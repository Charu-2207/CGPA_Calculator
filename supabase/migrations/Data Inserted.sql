/*
# CGPA Platform - Seed Data

1. Data Inserted
- 8 semesters for CSE department (semester 1-8)
- 6 subjects per semester (48 total subjects)
- Realistic CS curriculum subjects
- Elective subjects marked appropriately

2. Notes
- Students and grades will be created through the app by users
- Department statistics will be computed dynamically
*/

-- Insert semesters for CSE department
INSERT INTO semesters (semester_number, department) VALUES
(1, 'CSE'),
(2, 'CSE'),
(3, 'CSE'),
(4, 'CSE'),
(5, 'CSE'),
(6, 'CSE'),
(7, 'CSE'),
(8, 'CSE')
ON CONFLICT (semester_number, department) DO NOTHING;

-- Insert subjects for Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS101', 'Programming in C', 4, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
UNION ALL
SELECT id, 'CS102', 'Digital Logic Design', 4, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
UNION ALL
SELECT id, 'MA101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
UNION ALL
SELECT id, 'PH101', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
UNION ALL
SELECT id, 'EN101', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
UNION ALL
SELECT id, 'CS1L1', 'C Programming Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS201', 'Data Structures', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
UNION ALL
SELECT id, 'CS202', 'Object Oriented Programming', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
UNION ALL
SELECT id, 'MA201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
UNION ALL
SELECT id, 'CY101', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
UNION ALL
SELECT id, 'CS203', 'Computer Organization', 3, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
UNION ALL
SELECT id, 'CS2L1', 'Data Structures Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS301', 'Database Management Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
UNION ALL
SELECT id, 'CS302', 'Operating Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
UNION ALL
SELECT id, 'CS303', 'Discrete Mathematics', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
UNION ALL
SELECT id, 'CS304', 'Computer Networks', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
UNION ALL
SELECT id, 'CS305', 'Software Engineering', 3, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
UNION ALL
SELECT id, 'CS3L1', 'DBMS Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS401', 'Design and Analysis of Algorithms', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
UNION ALL
SELECT id, 'CS402', 'Theory of Computation', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
UNION ALL
SELECT id, 'CS403', 'Microprocessors and Microcontrollers', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
UNION ALL
SELECT id, 'CS404', 'Probability and Statistics', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
UNION ALL
SELECT id, 'CS405', 'Web Technologies', 3, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
UNION ALL
SELECT id, 'CS4L1', 'Algorithms Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS501', 'Artificial Intelligence', 4, false FROM semesters WHERE semester_number = 5 AND department = 'CSE'
UNION ALL
SELECT id, 'CS502', 'Compiler Design', 4, false FROM semesters WHERE semester_number = 5 AND department = 'CSE'
UNION ALL
SELECT id, 'CS503', 'Machine Learning', 4, false FROM semesters WHERE semester_number = 5 AND department = 'CSE'
UNION ALL
SELECT id, 'CS504', 'Computer Graphics', 3, false FROM semesters WHERE semester_number = 5 AND department = 'CSE'
UNION ALL
SELECT id, 'ELE501', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'CSE'
UNION ALL
SELECT id, 'CS5L1', 'AI/ML Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS601', 'Deep Learning', 4, false FROM semesters WHERE semester_number = 6 AND department = 'CSE'
UNION ALL
SELECT id, 'CS602', 'Distributed Systems', 4, false FROM semesters WHERE semester_number = 6 AND department = 'CSE'
UNION ALL
SELECT id, 'CS603', 'Cloud Computing', 4, false FROM semesters WHERE semester_number = 6 AND department = 'CSE'
UNION ALL
SELECT id, 'CS604', 'Information Security', 3, false FROM semesters WHERE semester_number = 6 AND department = 'CSE'
UNION ALL
SELECT id, 'ELE601', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'CSE'
UNION ALL
SELECT id, 'CS6L1', 'Project Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS701', 'Natural Language Processing', 4, false FROM semesters WHERE semester_number = 7 AND department = 'CSE'
UNION ALL
SELECT id, 'CS702', 'Computer Vision', 4, false FROM semesters WHERE semester_number = 7 AND department = 'CSE'
UNION ALL
SELECT id, 'CS703', 'Big Data Analytics', 4, false FROM semesters WHERE semester_number = 7 AND department = 'CSE'
UNION ALL
SELECT id, 'ELE701', 'Elective III', 3, true FROM semesters WHERE semester_number = 7 AND department = 'CSE'
UNION ALL
SELECT id, 'ELE702', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'CSE'
UNION ALL
SELECT id, 'CS7L1', 'Mini Project', 4, false FROM semesters WHERE semester_number = 7 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert subjects for Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CS801', 'Internet of Things', 4, false FROM semesters WHERE semester_number = 8 AND department = 'CSE'
UNION ALL
SELECT id, 'CS802', 'Blockchain Technology', 4, false FROM semesters WHERE semester_number = 8 AND department = 'CSE'
UNION ALL
SELECT id, 'ELE801', 'Elective V', 3, true FROM semesters WHERE semester_number = 8 AND department = 'CSE'
UNION ALL
SELECT id, 'CS8PS', 'Final Project Phase I', 6, false FROM semesters WHERE semester_number = 8 AND department = 'CSE'
UNION ALL
SELECT id, 'CS8SI', 'Industry Seminar', 2, false FROM semesters WHERE semester_number = 8 AND department = 'CSE'
UNION ALL
SELECT id, 'CS8IN', 'Internship', 4, false FROM semesters WHERE semester_number = 8 AND department = 'CSE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Insert sample department statistics for CSE
INSERT INTO department_statistics (department, semester_number, average_sgpa, average_cgpa, top_score, student_count)
VALUES
('CSE', 1, 7.85, 7.85, 9.52, 120),
('CSE', 2, 7.92, 7.88, 9.48, 118),
('CSE', 3, 7.78, 7.85, 9.41, 116),
('CSE', 4, 8.02, 7.89, 9.55, 115),
('CSE', 5, 7.65, 7.84, 9.38, 112),
('CSE', 6, 7.88, 7.85, 9.42, 110),
('CSE', 7, 8.12, 7.88, 9.61, 108),
('CSE', 8, 8.05, 7.89, 9.55, 105)
ON CONFLICT (department, semester_number) DO NOTHING;