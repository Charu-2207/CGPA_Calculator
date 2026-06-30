-- MECH (Mechanical Engineering) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
UNION ALL SELECT id, 'ME102', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
UNION ALL SELECT id, 'ME103', 'Engineering Chemistry', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
UNION ALL SELECT id, 'ME104', 'Engineering Drawing', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
UNION ALL SELECT id, 'ME105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
UNION ALL SELECT id, 'ME1L1', 'Workshop Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
UNION ALL SELECT id, 'ME202', 'Engineering Mechanics', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
UNION ALL SELECT id, 'ME203', 'Engineering Thermodynamics', 4, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
UNION ALL SELECT id, 'ME204', 'Basic Electrical and Electronics', 3, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
UNION ALL SELECT id, 'ME205', 'Manufacturing Processes I', 3, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
UNION ALL SELECT id, 'ME2L1', 'Manufacturing Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME301', 'Mechanics of Solids', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
UNION ALL SELECT id, 'ME302', 'Fluid Mechanics and Machinery', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
UNION ALL SELECT id, 'ME303', 'Manufacturing Processes II', 3, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
UNION ALL SELECT id, 'ME304', 'Kinematics of Machinery', 4, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
UNION ALL SELECT id, 'ME305', 'Probability and Statistics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
UNION ALL SELECT id, 'ME3L1', 'Fluid Mechanics Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME401', 'Dynamics of Machinery', 4, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
UNION ALL SELECT id, 'ME402', 'Heat and Mass Transfer', 4, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
UNION ALL SELECT id, 'ME403', 'Machine Design I', 4, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
UNION ALL SELECT id, 'ME404', 'Metrology and Measurements', 3, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
UNION ALL SELECT id, 'ME405', 'Applied Thermodynamics', 3, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
UNION ALL SELECT id, 'ME4L1', 'Heat Transfer Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME501', 'Machine Design II', 4, false FROM semesters WHERE semester_number = 5 AND department = 'MECH'
UNION ALL SELECT id, 'ME502', 'Finite Element Analysis', 4, false FROM semesters WHERE semester_number = 5 AND department = 'MECH'
UNION ALL SELECT id, 'ME503', 'CAD/CAM and Automation', 3, false FROM semesters WHERE semester_number = 5 AND department = 'MECH'
UNION ALL SELECT id, 'ME504', 'Internal Combustion Engines', 3, false FROM semesters WHERE semester_number = 5 AND department = 'MECH'
UNION ALL SELECT id, 'ME505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'MECH'
UNION ALL SELECT id, 'ME5L1', 'CAD Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME601', 'Industrial Engineering and Management', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MECH'
UNION ALL SELECT id, 'ME602', 'Robotics and Automation', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MECH'
UNION ALL SELECT id, 'ME603', 'Refrigeration and Air Conditioning', 3, false FROM semesters WHERE semester_number = 6 AND department = 'MECH'
UNION ALL SELECT id, 'ME604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'MECH'
UNION ALL SELECT id, 'ME605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'MECH'
UNION ALL SELECT id, 'ME6L1', 'Metrology Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME701', 'Additive Manufacturing', 3, false FROM semesters WHERE semester_number = 7 AND department = 'MECH'
UNION ALL SELECT id, 'ME702', 'Composite Materials', 3, false FROM semesters WHERE semester_number = 7 AND department = 'MECH'
UNION ALL SELECT id, 'ME703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'MECH'
UNION ALL SELECT id, 'ME704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'MECH'
UNION ALL SELECT id, 'ME705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'ME801', 'Turbomachinery', 3, false FROM semesters WHERE semester_number = 8 AND department = 'MECH'
UNION ALL SELECT id, 'ME802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'MECH'
UNION ALL SELECT id, 'ME803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'MECH'
UNION ALL SELECT id, 'ME804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'MECH'
UNION ALL SELECT id, 'ME805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'MECH'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
