-- AIML (Artificial Intelligence & Machine Learning) Department Subjects

-- Semester 1
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM101', 'Programming in Python', 4, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
UNION ALL SELECT id, 'AM102', 'Engineering Mathematics I', 4, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
UNION ALL SELECT id, 'AM103', 'Engineering Physics', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
UNION ALL SELECT id, 'AM104', 'Fundamentals of AI', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
UNION ALL SELECT id, 'AM105', 'Technical English', 3, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
UNION ALL SELECT id, 'AM1L1', 'Python Lab', 2, false FROM semesters WHERE semester_number = 1 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 2
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM201', 'Data Structures and Algorithms', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
UNION ALL SELECT id, 'AM202', 'Engineering Mathematics II', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
UNION ALL SELECT id, 'AM203', 'Probability and Statistics', 4, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
UNION ALL SELECT id, 'AM204', 'Database Systems', 3, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
UNION ALL SELECT id, 'AM205', 'Logic and Reasoning', 3, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
UNION ALL SELECT id, 'AM2L1', 'Algorithms Lab', 2, false FROM semesters WHERE semester_number = 2 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 3
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM301', 'Machine Learning', 4, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
UNION ALL SELECT id, 'AM302', 'Linear Algebra for ML', 4, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
UNION ALL SELECT id, 'AM303', 'Computer Vision Basics', 3, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
UNION ALL SELECT id, 'AM304', 'Knowledge Representation', 3, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
UNION ALL SELECT id, 'AM305', 'Operating Systems', 3, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
UNION ALL SELECT id, 'AM3L1', 'ML Lab', 2, false FROM semesters WHERE semester_number = 3 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 4
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM401', 'Deep Learning', 4, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
UNION ALL SELECT id, 'AM402', 'Natural Language Processing', 4, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
UNION ALL SELECT id, 'AM403', 'Reinforcement Learning', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
UNION ALL SELECT id, 'AM404', 'Cloud and Edge AI', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
UNION ALL SELECT id, 'AM405', 'Optimization for ML', 3, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
UNION ALL SELECT id, 'AM4L1', 'Deep Learning Lab', 2, false FROM semesters WHERE semester_number = 4 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 5
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM501', 'Generative AI and LLMs', 4, false FROM semesters WHERE semester_number = 5 AND department = 'AIML'
UNION ALL SELECT id, 'AM502', 'AI Ethics and Governance', 2, false FROM semesters WHERE semester_number = 5 AND department = 'AIML'
UNION ALL SELECT id, 'AM503', 'MLOps', 3, false FROM semesters WHERE semester_number = 5 AND department = 'AIML'
UNION ALL SELECT id, 'AM504', 'Big Data for AI', 3, false FROM semesters WHERE semester_number = 5 AND department = 'AIML'
UNION ALL SELECT id, 'AM505', 'Elective I', 3, true FROM semesters WHERE semester_number = 5 AND department = 'AIML'
UNION ALL SELECT id, 'AM5L1', 'Generative AI Lab', 2, false FROM semesters WHERE semester_number = 5 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 6
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM601', 'AI for Robotics', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIML'
UNION ALL SELECT id, 'AM602', 'Explainable AI', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIML'
UNION ALL SELECT id, 'AM603', 'Graph Neural Networks', 3, false FROM semesters WHERE semester_number = 6 AND department = 'AIML'
UNION ALL SELECT id, 'AM604', 'Elective II', 3, true FROM semesters WHERE semester_number = 6 AND department = 'AIML'
UNION ALL SELECT id, 'AM605', 'Elective III', 3, true FROM semesters WHERE semester_number = 6 AND department = 'AIML'
UNION ALL SELECT id, 'AM6L1', 'AI Applications Lab', 2, false FROM semesters WHERE semester_number = 6 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 7
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM701', 'Multi-Agent Systems', 3, false FROM semesters WHERE semester_number = 7 AND department = 'AIML'
UNION ALL SELECT id, 'AM702', 'Trustworthy AI', 3, false FROM semesters WHERE semester_number = 7 AND department = 'AIML'
UNION ALL SELECT id, 'AM703', 'Elective IV', 3, true FROM semesters WHERE semester_number = 7 AND department = 'AIML'
UNION ALL SELECT id, 'AM704', 'Elective V', 3, true FROM semesters WHERE semester_number = 7 AND department = 'AIML'
UNION ALL SELECT id, 'AM705', 'Project Work I', 4, false FROM semesters WHERE semester_number = 7 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;

-- Semester 8
INSERT INTO subjects (semester_id, subject_code, subject_name, credits, is_elective)
SELECT id, 'AM801', 'Advanced Deep Learning', 3, false FROM semesters WHERE semester_number = 8 AND department = 'AIML'
UNION ALL SELECT id, 'AM802', 'Elective VI', 3, true FROM semesters WHERE semester_number = 8 AND department = 'AIML'
UNION ALL SELECT id, 'AM803', 'Elective VII', 3, true FROM semesters WHERE semester_number = 8 AND department = 'AIML'
UNION ALL SELECT id, 'AM804', 'Project Work II', 6, false FROM semesters WHERE semester_number = 8 AND department = 'AIML'
UNION ALL SELECT id, 'AM805', 'Industrial Training', 3, false FROM semesters WHERE semester_number = 8 AND department = 'AIML'
ON CONFLICT (subject_code, semester_id) DO NOTHING;
