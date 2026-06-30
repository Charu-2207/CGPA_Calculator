-- CIVIL (Civil Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV103', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV104', 'Engineering Drawing', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV1L1', 'Survey Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV202', 'Engineering Mechanics', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV203', 'Building Materials and Construction', 4, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV204', 'Fluid Mechanics', 3, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV205', 'Surveying I', 3, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV2L1', 'Surveying Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV301', 'Strength of Materials', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV302', 'Hydraulics and Hydraulic Machines', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV303', 'Surveying II', 3, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV304', 'Soil Mechanics', 4, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV305', 'Probability and Statistics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV3L1', 'Hydraulics Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV401', 'Structural Analysis I', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV402', 'Reinforced Concrete Design', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV403', 'Foundation Engineering', 4, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV404', 'Transportation Engineering I', 3, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV405', 'Environmental Engineering I', 3, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV4L1', 'Concrete Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV501', 'Structural Analysis II', 4, false FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV502', 'Steel Structures Design', 4, false FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV503', 'Transportation Engineering II', 3, false FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV504', 'Environmental Engineering II', 3, false FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV5L1', 'Structural Analysis Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV601', 'Construction Management', 3, false FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV602', 'Water Resources Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV603', 'Remote Sensing and GIS', 3, false FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV6L1', 'GIS Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV701', 'Earthquake Engineering', 3, false FROM semesters WHERE semester_number = 7 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV702', 'Smart Infrastructure and IoT', 3, false FROM semesters WHERE semester_number = 7 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'CV801', 'Advanced Concrete Technology', 3, false FROM semesters WHERE semester_number = 8 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'CIVIL'
UNION ALL SELECT id, 'CV805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'CIVIL'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
