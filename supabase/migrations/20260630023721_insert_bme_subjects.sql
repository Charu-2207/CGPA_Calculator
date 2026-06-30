-- BME (Biomedical Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
UNION ALL SELECT id, 'BM102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
UNION ALL SELECT id, 'BM103', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
UNION ALL SELECT id, 'BM104', 'Human Anatomy and Physiology', 4, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
UNION ALL SELECT id, 'BM105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
UNION ALL SELECT id, 'BM1L1', 'Physics and Chemistry Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
UNION ALL SELECT id, 'BM202', 'Biomedical Instrumentation', 4, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
UNION ALL SELECT id, 'BM203', 'Biomechanics', 3, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
UNION ALL SELECT id, 'BM204', 'Electric Circuits and Electronics', 4, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
UNION ALL SELECT id, 'BM205', 'Programming in C', 3, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
UNION ALL SELECT id, 'BM2L1', 'Instrumentation Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM301', 'Biophysics and Biochemistry', 4, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
UNION ALL SELECT id, 'BM302', 'Medical Imaging Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
UNION ALL SELECT id, 'BM303', 'Digital Signal Processing', 4, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
UNION ALL SELECT id, 'BM304', 'Probability and Statistics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
UNION ALL SELECT id, 'BM305', 'Microprocessors and Microcontrollers', 3, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
UNION ALL SELECT id, 'BM3L1', 'Signals and Systems Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM401', 'Bioelectronics and Biosensors', 4, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
UNION ALL SELECT id, 'BM402', 'Hospital Equipment Management', 3, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
UNION ALL SELECT id, 'BM403', 'Bio-MEMS and Nanotechnology', 3, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
UNION ALL SELECT id, 'BM404', 'Biomaterials', 4, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
UNION ALL SELECT id, 'BM405', 'Medical Electronics', 3, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
UNION ALL SELECT id, 'BM4L1', 'Bioelectronics Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM501', 'Rehabilitation Engineering', 3, false FROM semesters WHERE semester_number = 5 AND department = 'BME'
UNION ALL SELECT id, 'BM502', 'Telemedicine and Health Informatics', 3, false FROM semesters WHERE semester_number = 5 AND department = 'BME'
UNION ALL SELECT id, 'BM503', 'Prosthetics and Orthotics', 3, false FROM semesters WHERE semester_number = 5 AND department = 'BME'
UNION ALL SELECT id, 'BM504', 'Biomedical Signal Processing', 4, false FROM semesters WHERE semester_number = 5 AND department = 'BME'
UNION ALL SELECT id, 'BM505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'BME'
UNION ALL SELECT id, 'BM5L1', 'Signal Processing Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM601', 'Clinical Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'BME'
UNION ALL SELECT id, 'BM602', 'Neural Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'BME'
UNION ALL SELECT id, 'BM603', 'Radiology and Nuclear Medicine', 3, false FROM semesters WHERE semester_number = 6 AND department = 'BME'
UNION ALL SELECT id, 'BM604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'BME'
UNION ALL SELECT id, 'BM605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'BME'
UNION ALL SELECT id, 'BM6L1', 'Clinical Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM701', 'Artificial Intelligence in Healthcare', 4, false FROM semesters WHERE semester_number = 7 AND department = 'BME'
UNION ALL SELECT id, 'BM702', 'Biomedical Imaging', 3, false FROM semesters WHERE semester_number = 7 AND department = 'BME'
UNION ALL SELECT id, 'BM703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'BME'
UNION ALL SELECT id, 'BM704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'BME'
UNION ALL SELECT id, 'BM705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'BM801', 'Drug Delivery Systems', 3, false FROM semesters WHERE semester_number = 8 AND department = 'BME'
UNION ALL SELECT id, 'BM802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'BME'
UNION ALL SELECT id, 'BM803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'BME'
UNION ALL SELECT id, 'BM804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'BME'
UNION ALL SELECT id, 'BM805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'BME'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
