-- MDE (Mechatronics and Design Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
UNION ALL SELECT id, 'MD102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
UNION ALL SELECT id, 'MD103', 'Engineering Drawing', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
UNION ALL SELECT id, 'MD104', 'Programming in C', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
UNION ALL SELECT id, 'MD105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
UNION ALL SELECT id, 'MD1L1', 'Workshop Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
UNION ALL SELECT id, 'MD202', 'Mechanics of Solids', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
UNION ALL SELECT id, 'MD203', 'Electric Circuits and Machines', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
UNION ALL SELECT id, 'MD204', 'Engineering Thermodynamics', 3, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
UNION ALL SELECT id, 'MD205', 'Manufacturing Processes', 3, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
UNION ALL SELECT id, 'MD2L1', 'Electrical Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD301', 'Sensors and Actuators', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
UNION ALL SELECT id, 'MD302', 'Control Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
UNION ALL SELECT id, 'MD303', 'Machine Design', 3, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
UNION ALL SELECT id, 'MD304', 'Fluid Mechanics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
UNION ALL SELECT id, 'MD305', 'Microcontrollers and Embedded Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
UNION ALL SELECT id, 'MD3L1', 'Control Systems Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD401', 'Robotics and Automation', 4, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
UNION ALL SELECT id, 'MD402', 'CAD/CAM', 4, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
UNION ALL SELECT id, 'MD403', 'Hydraulics and Pneumatics', 3, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
UNION ALL SELECT id, 'MD404', 'Signal Processing', 3, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
UNION ALL SELECT id, 'MD405', 'Industrial IoT', 3, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
UNION ALL SELECT id, 'MD4L1', 'Robotics Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD501', 'Finite Element Analysis', 4, false FROM semesters WHERE semester_number = 5 AND department = 'MDE'
UNION ALL SELECT id, 'MD502', 'CNC Machines and Programming', 3, false FROM semesters WHERE semester_number = 5 AND department = 'MDE'
UNION ALL SELECT id, 'MD503', 'Additive Manufacturing', 3, false FROM semesters WHERE semester_number = 5 AND department = 'MDE'
UNION ALL SELECT id, 'MD504', 'AI for Mechatronics', 3, false FROM semesters WHERE semester_number = 5 AND department = 'MDE'
UNION ALL SELECT id, 'MD505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'MDE'
UNION ALL SELECT id, 'MD5L1', 'FEA Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD601', 'Autonomous Systems', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MDE'
UNION ALL SELECT id, 'MD602', 'Smart Manufacturing', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MDE'
UNION ALL SELECT id, 'MD603', 'Product Lifecycle Management', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MDE'
UNION ALL SELECT id, 'MD604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'MDE'
UNION ALL SELECT id, 'MD605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'MDE'
UNION ALL SELECT id, 'MD6L1', 'Advanced Manufacturing Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD701', 'Digital Twin Technology', 3, false FROM semesters WHERE semester_number = 7 AND department = 'MDE'
UNION ALL SELECT id, 'MD702', 'Vibration and Noise Control', 3, false FROM semesters WHERE semester_number = 7 AND department = 'MDE'
UNION ALL SELECT id, 'MD703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'MDE'
UNION ALL SELECT id, 'MD704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'MDE'
UNION ALL SELECT id, 'MD705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'MD801', 'Industry 4.0 Applications', 3, false FROM semesters WHERE semester_number = 8 AND department = 'MDE'
UNION ALL SELECT id, 'MD802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'MDE'
UNION ALL SELECT id, 'MD803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'MDE'
UNION ALL SELECT id, 'MD804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'MDE'
UNION ALL SELECT id, 'MD805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'MDE'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
