-- AIDS (AI & Data Science) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD101', 'Programming in Python', 4, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
UNION ALL SELECT id, 'AD102', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
UNION ALL SELECT id, 'AD103', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
UNION ALL SELECT id, 'AD104', 'Problem Solving Techniques', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
UNION ALL SELECT id, 'AD105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
UNION ALL SELECT id, 'AD1L1', 'Python Programming Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD201', 'Data Structures', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
UNION ALL SELECT id, 'AD202', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
UNION ALL SELECT id, 'AD203', 'Statistics for Data Science', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
UNION ALL SELECT id, 'AD204', 'Database Management Systems', 3, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
UNION ALL SELECT id, 'AD205', 'Digital Logic Design', 3, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
UNION ALL SELECT id, 'AD2L1', 'Data Structures Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD301', 'Machine Learning', 4, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
UNION ALL SELECT id, 'AD302', 'Probability and Random Processes', 4, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
UNION ALL SELECT id, 'AD303', 'Big Data Technologies', 4, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
UNION ALL SELECT id, 'AD304', 'Data Visualization', 3, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
UNION ALL SELECT id, 'AD305', 'Operating Systems', 3, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
UNION ALL SELECT id, 'AD3L1', 'Machine Learning Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD401', 'Deep Learning', 4, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
UNION ALL SELECT id, 'AD402', 'Data Warehousing and Mining', 4, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
UNION ALL SELECT id, 'AD403', 'Computer Vision', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
UNION ALL SELECT id, 'AD404', 'Cloud Computing', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
UNION ALL SELECT id, 'AD405', 'Optimization Techniques', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
UNION ALL SELECT id, 'AD4L1', 'Deep Learning Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD501', 'Natural Language Processing', 4, false FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
UNION ALL SELECT id, 'AD502', 'Reinforcement Learning', 3, false FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
UNION ALL SELECT id, 'AD503', 'Time Series Analysis', 3, false FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
UNION ALL SELECT id, 'AD504', 'Data Ethics and Privacy', 2, false FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
UNION ALL SELECT id, 'AD505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
UNION ALL SELECT id, 'AD5L1', 'NLP and Analytics Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD601', 'Generative AI', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
UNION ALL SELECT id, 'AD602', 'Feature Engineering', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
UNION ALL SELECT id, 'AD603', 'MLOps and Deployment', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
UNION ALL SELECT id, 'AD604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
UNION ALL SELECT id, 'AD605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
UNION ALL SELECT id, 'AD6L1', 'MLOps Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD701', 'Graph Neural Networks', 3, false FROM semesters WHERE semester_number = 7 AND department = 'AIDS'
UNION ALL SELECT id, 'AD702', 'Data-Driven Decision Making', 3, false FROM semesters WHERE semester_number = 7 AND department = 'AIDS'
UNION ALL SELECT id, 'AD703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'AIDS'
UNION ALL SELECT id, 'AD704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'AIDS'
UNION ALL SELECT id, 'AD705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AD801', 'Advanced AI Applications', 3, false FROM semesters WHERE semester_number = 8 AND department = 'AIDS'
UNION ALL SELECT id, 'AD802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'AIDS'
UNION ALL SELECT id, 'AD803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'AIDS'
UNION ALL SELECT id, 'AD804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'AIDS'
UNION ALL SELECT id, 'AD805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'AIDS'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
