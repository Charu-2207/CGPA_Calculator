-- ECE (Electronics and Communication Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
UNION ALL SELECT id, 'EC102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
UNION ALL SELECT id, 'EC103', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
UNION ALL SELECT id, 'EC104', 'Basic Electronics', 4, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
UNION ALL SELECT id, 'EC105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
UNION ALL SELECT id, 'EC1L1', 'Basic Electronics Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
UNION ALL SELECT id, 'EC202', 'Electronic Devices and Circuits', 4, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
UNION ALL SELECT id, 'EC203', 'Circuit Theory', 4, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
UNION ALL SELECT id, 'EC204', 'Programming in C', 3, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
UNION ALL SELECT id, 'EC205', 'Engineering Drawing', 2, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
UNION ALL SELECT id, 'EC2L1', 'Circuits Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC301', 'Signals and Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
UNION ALL SELECT id, 'EC302', 'Digital Electronics', 4, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
UNION ALL SELECT id, 'EC303', 'Electromagnetic Theory', 4, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
UNION ALL SELECT id, 'EC304', 'Probability and Random Processes', 3, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
UNION ALL SELECT id, 'EC305', 'Linear Integrated Circuits', 3, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
UNION ALL SELECT id, 'EC3L1', 'Digital Electronics Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC401', 'Communication Theory', 4, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
UNION ALL SELECT id, 'EC402', 'Digital Signal Processing', 4, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
UNION ALL SELECT id, 'EC403', 'Microprocessors and Microcontrollers', 4, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
UNION ALL SELECT id, 'EC404', 'VLSI Design', 3, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
UNION ALL SELECT id, 'EC405', 'Control Systems', 3, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
UNION ALL SELECT id, 'EC4L1', 'Communication Systems Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC501', 'Wireless Communications', 4, false FROM semesters WHERE semester_number = 5 AND department = 'ECE'
UNION ALL SELECT id, 'EC502', 'Antenna and Wave Propagation', 4, false FROM semesters WHERE semester_number = 5 AND department = 'ECE'
UNION ALL SELECT id, 'EC503', 'Embedded Systems', 3, false FROM semesters WHERE semester_number = 5 AND department = 'ECE'
UNION ALL SELECT id, 'EC504', 'Optical Communication', 3, false FROM semesters WHERE semester_number = 5 AND department = 'ECE'
UNION ALL SELECT id, 'EC505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'ECE'
UNION ALL SELECT id, 'EC5L1', 'VLSI and Embedded Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC601', 'Mobile Communications 5G/6G', 3, false FROM semesters WHERE semester_number = 6 AND department = 'ECE'
UNION ALL SELECT id, 'EC602', 'Image Processing', 3, false FROM semesters WHERE semester_number = 6 AND department = 'ECE'
UNION ALL SELECT id, 'EC603', 'MEMS Technology', 3, false FROM semesters WHERE semester_number = 6 AND department = 'ECE'
UNION ALL SELECT id, 'EC604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'ECE'
UNION ALL SELECT id, 'EC605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'ECE'
UNION ALL SELECT id, 'EC6L1', 'Signal Processing Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC701', 'Radar and Satellite Communication', 3, false FROM semesters WHERE semester_number = 7 AND department = 'ECE'
UNION ALL SELECT id, 'EC702', 'RF Circuit Design', 3, false FROM semesters WHERE semester_number = 7 AND department = 'ECE'
UNION ALL SELECT id, 'EC703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'ECE'
UNION ALL SELECT id, 'EC704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'ECE'
UNION ALL SELECT id, 'EC705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'EC801', 'Photonics and Optical Devices', 3, false FROM semesters WHERE semester_number = 8 AND department = 'ECE'
UNION ALL SELECT id, 'EC802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'ECE'
UNION ALL SELECT id, 'EC803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'ECE'
UNION ALL SELECT id, 'EC804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'ECE'
UNION ALL SELECT id, 'EC805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'ECE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
