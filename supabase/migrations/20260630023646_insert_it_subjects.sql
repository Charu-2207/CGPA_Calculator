-- IT Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT101', 'Programming Fundamentals', 4, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
UNION ALL SELECT id, 'IT102', 'Digital Logic Design', 4, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
UNION ALL SELECT id, 'MA101', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
UNION ALL SELECT id, 'PH101', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
UNION ALL SELECT id, 'EN101', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
UNION ALL SELECT id, 'IT1L1', 'Programming Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT201', 'Data Structures', 4, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
UNION ALL SELECT id, 'IT202', 'Object Oriented Programming', 4, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
UNION ALL SELECT id, 'MA201', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
UNION ALL SELECT id, 'IT203', 'Computer Organization', 3, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
UNION ALL SELECT id, 'IT204', 'Discrete Mathematics', 3, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
UNION ALL SELECT id, 'IT2L1', 'OOP Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT301', 'Database Management Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
UNION ALL SELECT id, 'IT302', 'Computer Networks', 4, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
UNION ALL SELECT id, 'IT303', 'Operating Systems', 4, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
UNION ALL SELECT id, 'MA301', 'Probability and Statistics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
UNION ALL SELECT id, 'IT304', 'Web Technologies', 3, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
UNION ALL SELECT id, 'IT3L1', 'DBMS Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT401', 'Software Engineering', 4, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
UNION ALL SELECT id, 'IT402', 'Design and Analysis of Algorithms', 4, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
UNION ALL SELECT id, 'IT403', 'Internet of Things', 3, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
UNION ALL SELECT id, 'IT404', 'Information Security', 3, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
UNION ALL SELECT id, 'IT405', 'Human Computer Interaction', 3, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
UNION ALL SELECT id, 'IT4L1', 'Networks Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT501', 'Cloud Computing', 4, false FROM semesters WHERE semester_number = 5 AND department = 'IT'
UNION ALL SELECT id, 'IT502', 'Machine Learning', 4, false FROM semesters WHERE semester_number = 5 AND department = 'IT'
UNION ALL SELECT id, 'IT503', 'Mobile Application Development', 3, false FROM semesters WHERE semester_number = 5 AND department = 'IT'
UNION ALL SELECT id, 'IT504', 'Big Data Analytics', 3, false FROM semesters WHERE semester_number = 5 AND department = 'IT'
UNION ALL SELECT id, 'IT505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'IT'
UNION ALL SELECT id, 'IT5L1', 'Cloud and ML Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT601', 'Cyber Security', 4, false FROM semesters WHERE semester_number = 6 AND department = 'IT'
UNION ALL SELECT id, 'IT602', 'DevOps Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'IT'
UNION ALL SELECT id, 'IT603', 'Distributed Systems', 3, false FROM semesters WHERE semester_number = 6 AND department = 'IT'
UNION ALL SELECT id, 'IT604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'IT'
UNION ALL SELECT id, 'IT605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'IT'
UNION ALL SELECT id, 'IT6L1', 'Cyber Security Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT701', 'Deep Learning', 4, false FROM semesters WHERE semester_number = 7 AND department = 'IT'
UNION ALL SELECT id, 'IT702', 'Natural Language Processing', 3, false FROM semesters WHERE semester_number = 7 AND department = 'IT'
UNION ALL SELECT id, 'IT703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'IT'
UNION ALL SELECT id, 'IT704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'IT'
UNION ALL SELECT id, 'IT705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'IT801', 'Blockchain Technology', 3, false FROM semesters WHERE semester_number = 8 AND department = 'IT'
UNION ALL SELECT id, 'IT802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'IT'
UNION ALL SELECT id, 'IT803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'IT'
UNION ALL SELECT id, 'IT804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'IT'
UNION ALL SELECT id, 'IT805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'IT'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
