-- EEE (Electrical and Electronics Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
UNION ALL SELECT id, 'EE102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
UNION ALL SELECT id, 'EE103', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
UNION ALL SELECT id, 'EE104', 'Basic Electrical Engineering', 4, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
UNION ALL SELECT id, 'EE105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
UNION ALL SELECT id, 'EE1L1', 'Basic Electrical Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
UNION ALL SELECT id, 'EE202', 'Circuit Theory', 4, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
UNION ALL SELECT id, 'EE203', 'Electronic Devices and Circuits', 4, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
UNION ALL SELECT id, 'EE204', 'Engineering Drawing', 2, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
UNION ALL SELECT id, 'EE205', 'Programming in C', 3, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
UNION ALL SELECT id, 'EE2L1', 'Electronic Circuits Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE301', 'Electrical Machines I', 4, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
UNION ALL SELECT id, 'EE302', 'Electromagnetic Fields', 4, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
UNION ALL SELECT id, 'EE303', 'Signals and Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
UNION ALL SELECT id, 'EE304', 'Probability and Statistics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
UNION ALL SELECT id, 'EE305', 'Digital Electronics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
UNION ALL SELECT id, 'EE3L1', 'Electrical Machines Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE401', 'Electrical Machines II', 4, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
UNION ALL SELECT id, 'EE402', 'Power Systems I', 4, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
UNION ALL SELECT id, 'EE403', 'Control Systems', 4, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
UNION ALL SELECT id, 'EE404', 'Microprocessors and Microcontrollers', 3, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
UNION ALL SELECT id, 'EE405', 'Measurements and Instrumentation', 3, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
UNION ALL SELECT id, 'EE4L1', 'Power Systems Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE501', 'Power Electronics', 4, false FROM semesters WHERE semester_number = 5 AND department = 'EEE'
UNION ALL SELECT id, 'EE502', 'Power Systems II', 4, false FROM semesters WHERE semester_number = 5 AND department = 'EEE'
UNION ALL SELECT id, 'EE503', 'Drives and Control', 3, false FROM semesters WHERE semester_number = 5 AND department = 'EEE'
UNION ALL SELECT id, 'EE504', 'Renewable Energy Systems', 3, false FROM semesters WHERE semester_number = 5 AND department = 'EEE'
UNION ALL SELECT id, 'EE505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'EEE'
UNION ALL SELECT id, 'EE5L1', 'Power Electronics Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE601', 'High Voltage Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'EEE'
UNION ALL SELECT id, 'EE602', 'Smart Grid Technology', 3, false FROM semesters WHERE semester_number = 6 AND department = 'EEE'
UNION ALL SELECT id, 'EE603', 'Protection and Switchgear', 3, false FROM semesters WHERE semester_number = 6 AND department = 'EEE'
UNION ALL SELECT id, 'EE604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'EEE'
UNION ALL SELECT id, 'EE605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'EEE'
UNION ALL SELECT id, 'EE6L1', 'High Voltage Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE701', 'Electric Vehicles and Charging Systems', 3, false FROM semesters WHERE semester_number = 7 AND department = 'EEE'
UNION ALL SELECT id, 'EE702', 'Power Quality and FACTS', 3, false FROM semesters WHERE semester_number = 7 AND department = 'EEE'
UNION ALL SELECT id, 'EE703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'EEE'
UNION ALL SELECT id, 'EE704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'EEE'
UNION ALL SELECT id, 'EE705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EE801', 'Advanced Power Systems', 3, false FROM semesters WHERE semester_number = 8 AND department = 'EEE'
UNION ALL SELECT id, 'EE802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'EEE'
UNION ALL SELECT id, 'EE803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'EEE'
UNION ALL SELECT id, 'EE804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'EEE'
UNION ALL SELECT id, 'EE805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'EEE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
