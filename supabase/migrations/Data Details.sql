/*
# CGPA Platform - Student and Grade Seed Data

1. Data Inserted
- 50 CSE students with realistic Indian names and register numbers
- Random grade distributions for each student across 5 semesters
- CGPA history records for completed semesters
- Updated department statistics based on student data

2. Notes
- Grades follow a realistic bell curve distribution
- CGPA is calculated based on assigned grades
- Register numbers follow pattern: 21CS001 - 21CS050
- Batch year: 2021 (students completed 5 semesters as of 2026)
*/

-- Insert 50 CSE students (batch 2021)
INSERT INTO students (id, register_number, student_name, department, batch_year, email) VALUES
(gen_random_uuid(), '21CS001', 'Arjun Sharma', 'CSE', 2021, 'arjun.sharma@university.edu'),
(gen_random_uuid(), '21CS002', 'Priya Patel', 'CSE', 2021, 'priya.patel@university.edu'),
(gen_random_uuid(), '21CS003', 'Rahul Kumar', 'CSE', 2021, 'rahul.kumar@university.edu'),
(gen_random_uuid(), '21CS004', 'Sneha Reddy', 'CSE', 2021, 'sneha.reddy@university.edu'),
(gen_random_uuid(), '21CS005', 'Vikram Singh', 'CSE', 2021, 'vikram.singh@university.edu'),
(gen_random_uuid(), '21CS006', 'Ananya Gupta', 'CSE', 2021, 'ananya.gupta@university.edu'),
(gen_random_uuid(), '21CS007', 'Karthik Nair', 'CSE', 2021, 'karthik.nair@university.edu'),
(gen_random_uuid(), '21CS008', 'Divya Iyer', 'CSE', 2021, 'divya.iyer@university.edu'),
(gen_random_uuid(), '21CS009', 'Aditya Joshi', 'CSE', 2021, 'aditya.joshi@university.edu'),
(gen_random_uuid(), '21CS010', 'Meera Menon', 'CSE', 2021, 'meera.menon@university.edu'),
(gen_random_uuid(), '21CS011', 'Rohan Desai', 'CSE', 2021, 'rohan.desai@university.edu'),
(gen_random_uuid(), '21CS012', 'Kavya Rao', 'CSE', 2021, 'kavya.rao@university.edu'),
(gen_random_uuid(), '21CS013', 'Aravind Krishnan', 'CSE', 2021, 'aravind.krishnan@university.edu'),
(gen_random_uuid(), '21CS014', 'Shreya Mukherjee', 'CSE', 2021, 'shreya.mukherjee@university.edu'),
(gen_random_uuid(), '21CS015', 'Varun Malhotra', 'CSE', 2021, 'varun.malhotra@university.edu'),
(gen_random_uuid(), '21CS016', 'Nisha Agarwal', 'CSE', 2021, 'nisha.agarwal@university.edu'),
(gen_random_uuid(), '21CS017', 'Rajeshwari Bose', 'CSE', 2021, 'rajeshwari.bose@university.edu'),
(gen_random_uuid(), '21CS018', 'Siddharth Kapoor', 'CSE', 2021, 'siddharth.kapoor@university.edu'),
(gen_random_uuid(), '21CS019', 'Tanvi Bhat', 'CSE', 2021, 'tanvi.bhat@university.edu'),
(gen_random_uuid(), '21CS020', 'Yash Choudhury', 'CSE', 2021, 'yash.choudhury@university.edu'),
(gen_random_uuid(), '21CS021', 'Ishita Verma', 'CSE', 2021, 'ishita.verma@university.edu'),
(gen_random_uuid(), '21CS022', 'Aniket Saxena', 'CSE', 2021, 'aniket.saxena@university.edu'),
(gen_random_uuid(), '21CS023', 'Pooja Ranganathan', 'CSE', 2021, 'pooja.ranganathan@university.edu'),
(gen_random_uuid(), '21CS024', 'Harsh Vardhan', 'CSE', 2021, 'harsh.vardhan@university.edu'),
(gen_random_uuid(), '21CS025', 'Neelam Kaur', 'CSE', 2021, 'neelam.kaur@university.edu'),
(gen_random_uuid(), '21CS026', 'Abhishek Mishra', 'CSE', 2021, 'abhishek.mishra@university.edu'),
(gen_random_uuid(), '21CS027', 'Shruti Pandey', 'CSE', 2021, 'shruti.pandey@university.edu'),
(gen_random_uuid(), '21CS028', 'Gaurav Tiwari', 'CSE', 2021, 'gaurav.tiwari@university.edu'),
(gen_random_uuid(), '21CS029', 'Ritu Thakur', 'CSE', 2021, 'ritu.thakur@university.edu'),
(gen_random_uuid(), '21CS030', 'Manish Saini', 'CSE', 2021, 'manish.saini@university.edu'),
(gen_random_uuid(), '21CS031', 'Deepti Chauhan', 'CSE', 2021, 'deepti.chauhan@university.edu'),
(gen_random_uuid(), '21CS032', 'Nikhil Bansal', 'CSE', 2021, 'nikhil.bansal@university.edu'),
(gen_random_uuid(), '21CS033', 'Aishwarya Hegde', 'CSE', 2021, 'aishwarya.hegde@university.edu'),
(gen_random_uuid(), '21CS034', 'Sanjay Pillai', 'CSE', 2021, 'sanjay.pillai@university.edu'),
(gen_random_uuid(), '21CS035', 'Madhuri Shetty', 'CSE', 2021, 'madhuri.shetty@university.edu'),
(gen_random_uuid(), '21CS036', 'Kunal Mehta', 'CSE', 2021, 'kunal.mehta@university.edu'),
(gen_random_uuid(), '21CS037', 'Bhavna Jain', 'CSE', 2021, 'bhavna.jain@university.edu'),
(gen_random_uuid(), '21CS038', 'Chirag Shah', 'CSE', 2021, 'chirag.shah@university.edu'),
(gen_random_uuid(), '21CS039', 'Latika Sharma', 'CSE', 2021, 'latika.sharma@university.edu'),
(gen_random_uuid(), '21CS040', 'Anmol Kaur', 'CSE', 2021, 'anmol.kaur@university.edu'),
(gen_random_uuid(), '21CS041', 'Ritesh Goyal', 'CSE', 2021, 'ritesh.goyal@university.edu'),
(gen_random_uuid(), '21CS042', 'Jyotsna Das', 'CSE', 2021, 'jyotsna.das@university.edu'),
(gen_random_uuid(), '21CS043', 'Pranav Arya', 'CSE', 2021, 'pranav.arya@university.edu'),
(gen_random_uuid(), '21CS044', 'Rashmi Nanda', 'CSE', 2021, 'rashmi.nanda@university.edu'),
(gen_random_uuid(), '21CS045', 'Tejas Rana', 'CSE', 2021, 'tejas.rana@university.edu'),
(gen_random_uuid(), '21CS046', 'Komal Chhabra', 'CSE', 2021, 'komal.chhabra@university.edu'),
(gen_random_uuid(), '21CS047', 'Biren Dasgupta', 'CSE', 2021, 'biren.dasgupta@university.edu'),
(gen_random_uuid(), '21CS048', 'Nandini Sengupta', 'CSE', 2021, 'nandini.sengupta@university.edu'),
(gen_random_uuid(), '21CS049', 'Hitesh Kulkarni', 'CSE', 2021, 'hitesh.kulkarni@university.edu'),
(gen_random_uuid(), '21CS050', 'Renuka Swamy', 'CSE', 2021, 'renuka.swamy@university.edu');

-- Insert grades for all students across 5 semesters using set-based approach
-- Semester 1 grades
INSERT INTO grades (student_id, subject_id, semester_number, grade, grade_point, credits)
SELECT 
  s.id as student_id,
  sub.id as subject_id,
  1 as semester_number,
  CASE floor(random() * 100)
    WHEN 0 THEN 'F'
    WHEN 1 THEN 'F'
    WHEN 2 THEN 'F'
    WHEN 3 THEN 'F'
    WHEN 4 THEN 'P'
    WHEN 5 THEN 'P'
    WHEN 6 THEN 'P'
    WHEN 7 THEN 'P'
    WHEN 8 THEN 'C'
    WHEN 9 THEN 'C'
    WHEN 10 THEN 'C'
    WHEN 11 THEN 'C'
    WHEN 12 THEN 'C'
    WHEN 13 THEN 'C'
    WHEN 14 THEN 'C'
    WHEN 15 THEN 'C'
    WHEN 16 THEN 'B'
    WHEN 17 THEN 'B'
    WHEN 18 THEN 'B'
    WHEN 19 THEN 'B'
    WHEN 20 THEN 'B'
    WHEN 21 THEN 'B'
    WHEN 22 THEN 'B'
    WHEN 23 THEN 'B'
    WHEN 24 THEN 'B'
    WHEN 25 THEN 'B'
    WHEN 26 THEN 'B'
    WHEN 27 THEN 'B'
    WHEN 28 THEN 'B'
    WHEN 29 THEN 'B'
    WHEN 30 THEN 'B+'
    WHEN 31 THEN 'B+'
    WHEN 32 THEN 'B+'
    WHEN 33 THEN 'B+'
    WHEN 34 THEN 'B+'
    WHEN 35 THEN 'B+'
    WHEN 36 THEN 'B+'
    WHEN 37 THEN 'B+'
    WHEN 38 THEN 'B+'
    WHEN 39 THEN 'B+'
    WHEN 40 THEN 'B+'
    WHEN 41 THEN 'B+'
    WHEN 42 THEN 'B+'
    WHEN 43 THEN 'B+'
    WHEN 44 THEN 'B+'
    WHEN 45 THEN 'B+'
    WHEN 46 THEN 'B+'
    WHEN 47 THEN 'B+'
    WHEN 48 THEN 'B+'
    WHEN 49 THEN 'B+'
    WHEN 50 THEN 'A'
    WHEN 51 THEN 'A'
    WHEN 52 THEN 'A'
    WHEN 53 THEN 'A'
    WHEN 54 THEN 'A'
    WHEN 55 THEN 'A'
    WHEN 56 THEN 'A'
    WHEN 57 THEN 'A'
    WHEN 58 THEN 'A'
    WHEN 59 THEN 'A'
    WHEN 60 THEN 'A'
    WHEN 61 THEN 'A'
    WHEN 62 THEN 'A'
    WHEN 63 THEN 'A'
    WHEN 64 THEN 'A'
    WHEN 65 THEN 'A'
    WHEN 66 THEN 'A'
    WHEN 67 THEN 'A'
    WHEN 68 THEN 'A'
    WHEN 69 THEN 'A'
    WHEN 70 THEN 'A'
    WHEN 71 THEN 'A'
    WHEN 72 THEN 'A+'
    WHEN 73 THEN 'A+'
    WHEN 74 THEN 'A+'
    WHEN 75 THEN 'A+'
    WHEN 76 THEN 'A+'
    WHEN 77 THEN 'A+'
    WHEN 78 THEN 'A+'
    WHEN 79 THEN 'A+'
    WHEN 80 THEN 'A+'
    WHEN 81 THEN 'A+'
    WHEN 82 THEN 'A+'
    WHEN 83 THEN 'A+'
    WHEN 84 THEN 'A+'
    WHEN 85 THEN 'A+'
    WHEN 86 THEN 'A+'
    WHEN 87 THEN 'A+'
    WHEN 88 THEN 'O'
    WHEN 89 THEN 'O'
    WHEN 90 THEN 'O'
    WHEN 91 THEN 'O'
    WHEN 92 THEN 'O'
    WHEN 93 THEN 'O'
    WHEN 94 THEN 'O'
    WHEN 95 THEN 'O'
    WHEN 96 THEN 'O'
    WHEN 97 THEN 'O'
    WHEN 98 THEN 'O'
    WHEN 99 THEN 'O'
  END as grade,
  CASE floor(random() * 100)
    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0
    WHEN 4 THEN 4 WHEN 5 THEN 4 WHEN 6 THEN 4 WHEN 7 THEN 4
    WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 5 WHEN 12 THEN 5 WHEN 13 THEN 5 WHEN 14 THEN 5 WHEN 15 THEN 5
    WHEN 16 THEN 6 WHEN 17 THEN 6 WHEN 18 THEN 6 WHEN 19 THEN 6 WHEN 20 THEN 6 WHEN 21 THEN 6 WHEN 22 THEN 6 WHEN 23 THEN 6 WHEN 24 THEN 6 WHEN 25 THEN 6 WHEN 26 THEN 6 WHEN 27 THEN 6 WHEN 28 THEN 6 WHEN 29 THEN 6
    WHEN 30 THEN 7 WHEN 31 THEN 7 WHEN 32 THEN 7 WHEN 33 THEN 7 WHEN 34 THEN 7 WHEN 35 THEN 7 WHEN 36 THEN 7 WHEN 37 THEN 7 WHEN 38 THEN 7 WHEN 39 THEN 7 WHEN 40 THEN 7 WHEN 41 THEN 7 WHEN 42 THEN 7 WHEN 43 THEN 7 WHEN 44 THEN 7 WHEN 45 THEN 7 WHEN 46 THEN 7 WHEN 47 THEN 7 WHEN 48 THEN 7 WHEN 49 THEN 7
    WHEN 50 THEN 8 WHEN 51 THEN 8 WHEN 52 THEN 8 WHEN 53 THEN 8 WHEN 54 THEN 8 WHEN 55 THEN 8 WHEN 56 THEN 8 WHEN 57 THEN 8 WHEN 58 THEN 8 WHEN 59 THEN 8 WHEN 60 THEN 8 WHEN 61 THEN 8 WHEN 62 THEN 8 WHEN 63 THEN 8 WHEN 64 THEN 8 WHEN 65 THEN 8 WHEN 66 THEN 8 WHEN 67 THEN 8 WHEN 68 THEN 8 WHEN 69 THEN 8 WHEN 70 THEN 8 WHEN 71 THEN 8 WHEN 72 THEN 8
    WHEN 73 THEN 9 WHEN 74 THEN 9 WHEN 75 THEN 9 WHEN 76 THEN 9 WHEN 77 THEN 9 WHEN 78 THEN 9 WHEN 79 THEN 9 WHEN 80 THEN 9 WHEN 81 THEN 9 WHEN 82 THEN 9 WHEN 83 THEN 9 WHEN 84 THEN 9 WHEN 85 THEN 9 WHEN 86 THEN 9 WHEN 87 THEN 9
    ELSE 10
  END as grade_point,
  sub.credits
FROM students s
CROSS JOIN subjects sub
JOIN semesters sem ON sub.semester_id = sem.id
WHERE s.department = 'CSE' 
AND sem.semester_number = 1 
AND sem.department = 'CSE'
ON CONFLICT (student_id, subject_id) DO NOTHING;

-- Semester 2 grades
INSERT INTO grades (student_id, subject_id, semester_number, grade, grade_point, credits)
SELECT 
  s.id as student_id,
  sub.id as subject_id,
  2 as semester_number,
  CASE floor(random() * 100)
    WHEN 0 THEN 'F' WHEN 1 THEN 'F' WHEN 2 THEN 'F' WHEN 3 THEN 'F'
    WHEN 4 THEN 'P' WHEN 5 THEN 'P' WHEN 6 THEN 'P' WHEN 7 THEN 'P'
    WHEN 8 THEN 'C' WHEN 9 THEN 'C' WHEN 10 THEN 'C' WHEN 11 THEN 'C' WHEN 12 THEN 'C' WHEN 13 THEN 'C' WHEN 14 THEN 'C' WHEN 15 THEN 'C'
    WHEN 16 THEN 'B' WHEN 17 THEN 'B' WHEN 18 THEN 'B' WHEN 19 THEN 'B' WHEN 20 THEN 'B' WHEN 21 THEN 'B' WHEN 22 THEN 'B' WHEN 23 THEN 'B' WHEN 24 THEN 'B' WHEN 25 THEN 'B' WHEN 26 THEN 'B' WHEN 27 THEN 'B' WHEN 28 THEN 'B' WHEN 29 THEN 'B'
    WHEN 30 THEN 'B+' WHEN 31 THEN 'B+' WHEN 32 THEN 'B+' WHEN 33 THEN 'B+' WHEN 34 THEN 'B+' WHEN 35 THEN 'B+' WHEN 36 THEN 'B+' WHEN 37 THEN 'B+' WHEN 38 THEN 'B+' WHEN 39 THEN 'B+' WHEN 40 THEN 'B+' WHEN 41 THEN 'B+' WHEN 42 THEN 'B+' WHEN 43 THEN 'B+' WHEN 44 THEN 'B+' WHEN 45 THEN 'B+' WHEN 46 THEN 'B+' WHEN 47 THEN 'B+' WHEN 48 THEN 'B+' WHEN 49 THEN 'B+'
    WHEN 50 THEN 'A' WHEN 51 THEN 'A' WHEN 52 THEN 'A' WHEN 53 THEN 'A' WHEN 54 THEN 'A' WHEN 55 THEN 'A' WHEN 56 THEN 'A' WHEN 57 THEN 'A' WHEN 58 THEN 'A' WHEN 59 THEN 'A' WHEN 60 THEN 'A' WHEN 61 THEN 'A' WHEN 62 THEN 'A' WHEN 63 THEN 'A' WHEN 64 THEN 'A' WHEN 65 THEN 'A' WHEN 66 THEN 'A' WHEN 67 THEN 'A' WHEN 68 THEN 'A' WHEN 69 THEN 'A' WHEN 70 THEN 'A' WHEN 71 THEN 'A' WHEN 72 THEN 'A'
    WHEN 73 THEN 'A+' WHEN 74 THEN 'A+' WHEN 75 THEN 'A+' WHEN 76 THEN 'A+' WHEN 77 THEN 'A+' WHEN 78 THEN 'A+' WHEN 79 THEN 'A+' WHEN 80 THEN 'A+' WHEN 81 THEN 'A+' WHEN 82 THEN 'A+' WHEN 83 THEN 'A+' WHEN 84 THEN 'A+' WHEN 85 THEN 'A+' WHEN 86 THEN 'A+' WHEN 87 THEN 'A+'
    ELSE 'O'
  END as grade,
  CASE floor(random() * 100)
    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0
    WHEN 4 THEN 4 WHEN 5 THEN 4 WHEN 6 THEN 4 WHEN 7 THEN 4
    WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 5 WHEN 12 THEN 5 WHEN 13 THEN 5 WHEN 14 THEN 5 WHEN 15 THEN 5
    WHEN 16 THEN 6 WHEN 17 THEN 6 WHEN 18 THEN 6 WHEN 19 THEN 6 WHEN 20 THEN 6 WHEN 21 THEN 6 WHEN 22 THEN 6 WHEN 23 THEN 6 WHEN 24 THEN 6 WHEN 25 THEN 6 WHEN 26 THEN 6 WHEN 27 THEN 6 WHEN 28 THEN 6 WHEN 29 THEN 6
    WHEN 30 THEN 7 WHEN 31 THEN 7 WHEN 32 THEN 7 WHEN 33 THEN 7 WHEN 34 THEN 7 WHEN 35 THEN 7 WHEN 36 THEN 7 WHEN 37 THEN 7 WHEN 38 THEN 7 WHEN 39 THEN 7 WHEN 40 THEN 7 WHEN 41 THEN 7 WHEN 42 THEN 7 WHEN 43 THEN 7 WHEN 44 THEN 7 WHEN 45 THEN 7 WHEN 46 THEN 7 WHEN 47 THEN 7 WHEN 48 THEN 7 WHEN 49 THEN 7
    WHEN 50 THEN 8 WHEN 51 THEN 8 WHEN 52 THEN 8 WHEN 53 THEN 8 WHEN 54 THEN 8 WHEN 55 THEN 8 WHEN 56 THEN 8 WHEN 57 THEN 8 WHEN 58 THEN 8 WHEN 59 THEN 8 WHEN 60 THEN 8 WHEN 61 THEN 8 WHEN 62 THEN 8 WHEN 63 THEN 8 WHEN 64 THEN 8 WHEN 65 THEN 8 WHEN 66 THEN 8 WHEN 67 THEN 8 WHEN 68 THEN 8 WHEN 69 THEN 8 WHEN 70 THEN 8 WHEN 71 THEN 8 WHEN 72 THEN 8
    WHEN 73 THEN 9 WHEN 74 THEN 9 WHEN 75 THEN 9 WHEN 76 THEN 9 WHEN 77 THEN 9 WHEN 78 THEN 9 WHEN 79 THEN 9 WHEN 80 THEN 9 WHEN 81 THEN 9 WHEN 82 THEN 9 WHEN 83 THEN 9 WHEN 84 THEN 9 WHEN 85 THEN 9 WHEN 86 THEN 9 WHEN 87 THEN 9
    ELSE 10
  END as grade_point,
  sub.credits
FROM students s
CROSS JOIN subjects sub
JOIN semesters sem ON sub.semester_id = sem.id
WHERE s.department = 'CSE' 
AND sem.semester_number = 2 
AND sem.department = 'CSE'
ON CONFLICT (student_id, subject_id) DO NOTHING;

-- Semester 3 grades
INSERT INTO grades (student_id, subject_id, semester_number, grade, grade_point, credits)
SELECT 
  s.id as student_id,
  sub.id as subject_id,
  3 as semester_number,
  CASE floor(random() * 100)
    WHEN 0 THEN 'F' WHEN 1 THEN 'F' WHEN 2 THEN 'F' WHEN 3 THEN 'F'
    WHEN 4 THEN 'P' WHEN 5 THEN 'P' WHEN 6 THEN 'P' WHEN 7 THEN 'P'
    WHEN 8 THEN 'C' WHEN 9 THEN 'C' WHEN 10 THEN 'C' WHEN 11 THEN 'C' WHEN 12 THEN 'C' WHEN 13 THEN 'C' WHEN 14 THEN 'C' WHEN 15 THEN 'C'
    WHEN 16 THEN 'B' WHEN 17 THEN 'B' WHEN 18 THEN 'B' WHEN 19 THEN 'B' WHEN 20 THEN 'B' WHEN 21 THEN 'B' WHEN 22 THEN 'B' WHEN 23 THEN 'B' WHEN 24 THEN 'B' WHEN 25 THEN 'B' WHEN 26 THEN 'B' WHEN 27 THEN 'B' WHEN 28 THEN 'B' WHEN 29 THEN 'B'
    WHEN 30 THEN 'B+' WHEN 31 THEN 'B+' WHEN 32 THEN 'B+' WHEN 33 THEN 'B+' WHEN 34 THEN 'B+' WHEN 35 THEN 'B+' WHEN 36 THEN 'B+' WHEN 37 THEN 'B+' WHEN 38 THEN 'B+' WHEN 39 THEN 'B+' WHEN 40 THEN 'B+' WHEN 41 THEN 'B+' WHEN 42 THEN 'B+' WHEN 43 THEN 'B+' WHEN 44 THEN 'B+' WHEN 45 THEN 'B+' WHEN 46 THEN 'B+' WHEN 47 THEN 'B+' WHEN 48 THEN 'B+' WHEN 49 THEN 'B+'
    WHEN 50 THEN 'A' WHEN 51 THEN 'A' WHEN 52 THEN 'A' WHEN 53 THEN 'A' WHEN 54 THEN 'A' WHEN 55 THEN 'A' WHEN 56 THEN 'A' WHEN 57 THEN 'A' WHEN 58 THEN 'A' WHEN 59 THEN 'A' WHEN 60 THEN 'A' WHEN 61 THEN 'A' WHEN 62 THEN 'A' WHEN 63 THEN 'A' WHEN 64 THEN 'A' WHEN 65 THEN 'A' WHEN 66 THEN 'A' WHEN 67 THEN 'A' WHEN 68 THEN 'A' WHEN 69 THEN 'A' WHEN 70 THEN 'A' WHEN 71 THEN 'A' WHEN 72 THEN 'A'
    WHEN 73 THEN 'A+' WHEN 74 THEN 'A+' WHEN 75 THEN 'A+' WHEN 76 THEN 'A+' WHEN 77 THEN 'A+' WHEN 78 THEN 'A+' WHEN 79 THEN 'A+' WHEN 80 THEN 'A+' WHEN 81 THEN 'A+' WHEN 82 THEN 'A+' WHEN 83 THEN 'A+' WHEN 84 THEN 'A+' WHEN 85 THEN 'A+' WHEN 86 THEN 'A+' WHEN 87 THEN 'A+'
    ELSE 'O'
  END as grade,
  CASE floor(random() * 100)
    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0
    WHEN 4 THEN 4 WHEN 5 THEN 4 WHEN 6 THEN 4 WHEN 7 THEN 4
    WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 5 WHEN 12 THEN 5 WHEN 13 THEN 5 WHEN 14 THEN 5 WHEN 15 THEN 5
    WHEN 16 THEN 6 WHEN 17 THEN 6 WHEN 18 THEN 6 WHEN 19 THEN 6 WHEN 20 THEN 6 WHEN 21 THEN 6 WHEN 22 THEN 6 WHEN 23 THEN 6 WHEN 24 THEN 6 WHEN 25 THEN 6 WHEN 26 THEN 6 WHEN 27 THEN 6 WHEN 28 THEN 6 WHEN 29 THEN 6
    WHEN 30 THEN 7 WHEN 31 THEN 7 WHEN 32 THEN 7 WHEN 33 THEN 7 WHEN 34 THEN 7 WHEN 35 THEN 7 WHEN 36 THEN 7 WHEN 37 THEN 7 WHEN 38 THEN 7 WHEN 39 THEN 7 WHEN 40 THEN 7 WHEN 41 THEN 7 WHEN 42 THEN 7 WHEN 43 THEN 7 WHEN 44 THEN 7 WHEN 45 THEN 7 WHEN 46 THEN 7 WHEN 47 THEN 7 WHEN 48 THEN 7 WHEN 49 THEN 7
    WHEN 50 THEN 8 WHEN 51 THEN 8 WHEN 52 THEN 8 WHEN 53 THEN 8 WHEN 54 THEN 8 WHEN 55 THEN 8 WHEN 56 THEN 8 WHEN 57 THEN 8 WHEN 58 THEN 8 WHEN 59 THEN 8 WHEN 60 THEN 8 WHEN 61 THEN 8 WHEN 62 THEN 8 WHEN 63 THEN 8 WHEN 64 THEN 8 WHEN 65 THEN 8 WHEN 66 THEN 8 WHEN 67 THEN 8 WHEN 68 THEN 8 WHEN 69 THEN 8 WHEN 70 THEN 8 WHEN 71 THEN 8 WHEN 72 THEN 8
    WHEN 73 THEN 9 WHEN 74 THEN 9 WHEN 75 THEN 9 WHEN 76 THEN 9 WHEN 77 THEN 9 WHEN 78 THEN 9 WHEN 79 THEN 9 WHEN 80 THEN 9 WHEN 81 THEN 9 WHEN 82 THEN 9 WHEN 83 THEN 9 WHEN 84 THEN 9 WHEN 85 THEN 9 WHEN 86 THEN 9 WHEN 87 THEN 9
    ELSE 10
  END as grade_point,
  sub.credits
FROM students s
CROSS JOIN subjects sub
JOIN semesters sem ON sub.semester_id = sem.id
WHERE s.department = 'CSE' 
AND sem.semester_number = 3 
AND sem.department = 'CSE'
ON CONFLICT (student_id, subject_id) DO NOTHING;

-- Semester 4 grades
INSERT INTO grades (student_id, subject_id, semester_number, grade, grade_point, credits)
SELECT 
  s.id as student_id,
  sub.id as subject_id,
  4 as semester_number,
  CASE floor(random() * 100)
    WHEN 0 THEN 'F' WHEN 1 THEN 'F' WHEN 2 THEN 'F' WHEN 3 THEN 'F'
    WHEN 4 THEN 'P' WHEN 5 THEN 'P' WHEN 6 THEN 'P' WHEN 7 THEN 'P'
    WHEN 8 THEN 'C' WHEN 9 THEN 'C' WHEN 10 THEN 'C' WHEN 11 THEN 'C' WHEN 12 THEN 'C' WHEN 13 THEN 'C' WHEN 14 THEN 'C' WHEN 15 THEN 'C'
    WHEN 16 THEN 'B' WHEN 17 THEN 'B' WHEN 18 THEN 'B' WHEN 19 THEN 'B' WHEN 20 THEN 'B' WHEN 21 THEN 'B' WHEN 22 THEN 'B' WHEN 23 THEN 'B' WHEN 24 THEN 'B' WHEN 25 THEN 'B' WHEN 26 THEN 'B' WHEN 27 THEN 'B' WHEN 28 THEN 'B' WHEN 29 THEN 'B'
    WHEN 30 THEN 'B+' WHEN 31 THEN 'B+' WHEN 32 THEN 'B+' WHEN 33 THEN 'B+' WHEN 34 THEN 'B+' WHEN 35 THEN 'B+' WHEN 36 THEN 'B+' WHEN 37 THEN 'B+' WHEN 38 THEN 'B+' WHEN 39 THEN 'B+' WHEN 40 THEN 'B+' WHEN 41 THEN 'B+' WHEN 42 THEN 'B+' WHEN 43 THEN 'B+' WHEN 44 THEN 'B+' WHEN 45 THEN 'B+' WHEN 46 THEN 'B+' WHEN 47 THEN 'B+' WHEN 48 THEN 'B+' WHEN 49 THEN 'B+'
    WHEN 50 THEN 'A' WHEN 51 THEN 'A' WHEN 52 THEN 'A' WHEN 53 THEN 'A' WHEN 54 THEN 'A' WHEN 55 THEN 'A' WHEN 56 THEN 'A' WHEN 57 THEN 'A' WHEN 58 THEN 'A' WHEN 59 THEN 'A' WHEN 60 THEN 'A' WHEN 61 THEN 'A' WHEN 62 THEN 'A' WHEN 63 THEN 'A' WHEN 64 THEN 'A' WHEN 65 THEN 'A' WHEN 66 THEN 'A' WHEN 67 THEN 'A' WHEN 68 THEN 'A' WHEN 69 THEN 'A' WHEN 70 THEN 'A' WHEN 71 THEN 'A' WHEN 72 THEN 'A'
    WHEN 73 THEN 'A+' WHEN 74 THEN 'A+' WHEN 75 THEN 'A+' WHEN 76 THEN 'A+' WHEN 77 THEN 'A+' WHEN 78 THEN 'A+' WHEN 79 THEN 'A+' WHEN 80 THEN 'A+' WHEN 81 THEN 'A+' WHEN 82 THEN 'A+' WHEN 83 THEN 'A+' WHEN 84 THEN 'A+' WHEN 85 THEN 'A+' WHEN 86 THEN 'A+' WHEN 87 THEN 'A+'
    ELSE 'O'
  END as grade,
  CASE floor(random() * 100)
    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0
    WHEN 4 THEN 4 WHEN 5 THEN 4 WHEN 6 THEN 4 WHEN 7 THEN 4
    WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 5 WHEN 12 THEN 5 WHEN 13 THEN 5 WHEN 14 THEN 5 WHEN 15 THEN 5
    WHEN 16 THEN 6 WHEN 17 THEN 6 WHEN 18 THEN 6 WHEN 19 THEN 6 WHEN 20 THEN 6 WHEN 21 THEN 6 WHEN 22 THEN 6 WHEN 23 THEN 6 WHEN 24 THEN 6 WHEN 25 THEN 6 WHEN 26 THEN 6 WHEN 27 THEN 6 WHEN 28 THEN 6 WHEN 29 THEN 6
    WHEN 30 THEN 7 WHEN 31 THEN 7 WHEN 32 THEN 7 WHEN 33 THEN 7 WHEN 34 THEN 7 WHEN 35 THEN 7 WHEN 36 THEN 7 WHEN 37 THEN 7 WHEN 38 THEN 7 WHEN 39 THEN 7 WHEN 40 THEN 7 WHEN 41 THEN 7 WHEN 42 THEN 7 WHEN 43 THEN 7 WHEN 44 THEN 7 WHEN 45 THEN 7 WHEN 46 THEN 7 WHEN 47 THEN 7 WHEN 48 THEN 7 WHEN 49 THEN 7
    WHEN 50 THEN 8 WHEN 51 THEN 8 WHEN 52 THEN 8 WHEN 53 THEN 8 WHEN 54 THEN 8 WHEN 55 THEN 8 WHEN 56 THEN 8 WHEN 57 THEN 8 WHEN 58 THEN 8 WHEN 59 THEN 8 WHEN 60 THEN 8 WHEN 61 THEN 8 WHEN 62 THEN 8 WHEN 63 THEN 8 WHEN 64 THEN 8 WHEN 65 THEN 8 WHEN 66 THEN 8 WHEN 67 THEN 8 WHEN 68 THEN 8 WHEN 69 THEN 8 WHEN 70 THEN 8 WHEN 71 THEN 8 WHEN 72 THEN 8
    WHEN 73 THEN 9 WHEN 74 THEN 9 WHEN 75 THEN 9 WHEN 76 THEN 9 WHEN 77 THEN 9 WHEN 78 THEN 9 WHEN 79 THEN 9 WHEN 80 THEN 9 WHEN 81 THEN 9 WHEN 82 THEN 9 WHEN 83 THEN 9 WHEN 84 THEN 9 WHEN 85 THEN 9 WHEN 86 THEN 9 WHEN 87 THEN 9
    ELSE 10
  END as grade_point,
  sub.credits
FROM students s
CROSS JOIN subjects sub
JOIN semesters sem ON sub.semester_id = sem.id
WHERE s.department = 'CSE' 
AND sem.semester_number = 4 
AND sem.department = 'CSE'
ON CONFLICT (student_id, subject_id) DO NOTHING;

-- Semester 5 grades
INSERT INTO grades (student_id, subject_id, semester_number, grade, grade_point, credits)
SELECT 
  s.id as student_id,
  sub.id as subject_id,
  5 as semester_number,
  CASE floor(random() * 100)
    WHEN 0 THEN 'F' WHEN 1 THEN 'F' WHEN 2 THEN 'F' WHEN 3 THEN 'F'
    WHEN 4 THEN 'P' WHEN 5 THEN 'P' WHEN 6 THEN 'P' WHEN 7 THEN 'P'
    WHEN 8 THEN 'C' WHEN 9 THEN 'C' WHEN 10 THEN 'C' WHEN 11 THEN 'C' WHEN 12 THEN 'C' WHEN 13 THEN 'C' WHEN 14 THEN 'C' WHEN 15 THEN 'C'
    WHEN 16 THEN 'B' WHEN 17 THEN 'B' WHEN 18 THEN 'B' WHEN 19 THEN 'B' WHEN 20 THEN 'B' WHEN 21 THEN 'B' WHEN 22 THEN 'B' WHEN 23 THEN 'B' WHEN 24 THEN 'B' WHEN 25 THEN 'B' WHEN 26 THEN 'B' WHEN 27 THEN 'B' WHEN 28 THEN 'B' WHEN 29 THEN 'B'
    WHEN 30 THEN 'B+' WHEN 31 THEN 'B+' WHEN 32 THEN 'B+' WHEN 33 THEN 'B+' WHEN 34 THEN 'B+' WHEN 35 THEN 'B+' WHEN 36 THEN 'B+' WHEN 37 THEN 'B+' WHEN 38 THEN 'B+' WHEN 39 THEN 'B+' WHEN 40 THEN 'B+' WHEN 41 THEN 'B+' WHEN 42 THEN 'B+' WHEN 43 THEN 'B+' WHEN 44 THEN 'B+' WHEN 45 THEN 'B+' WHEN 46 THEN 'B+' WHEN 47 THEN 'B+' WHEN 48 THEN 'B+' WHEN 49 THEN 'B+'
    WHEN 50 THEN 'A' WHEN 51 THEN 'A' WHEN 52 THEN 'A' WHEN 53 THEN 'A' WHEN 54 THEN 'A' WHEN 55 THEN 'A' WHEN 56 THEN 'A' WHEN 57 THEN 'A' WHEN 58 THEN 'A' WHEN 59 THEN 'A' WHEN 60 THEN 'A' WHEN 61 THEN 'A' WHEN 62 THEN 'A' WHEN 63 THEN 'A' WHEN 64 THEN 'A' WHEN 65 THEN 'A' WHEN 66 THEN 'A' WHEN 67 THEN 'A' WHEN 68 THEN 'A' WHEN 69 THEN 'A' WHEN 70 THEN 'A' WHEN 71 THEN 'A' WHEN 72 THEN 'A'
    WHEN 73 THEN 'A+' WHEN 74 THEN 'A+' WHEN 75 THEN 'A+' WHEN 76 THEN 'A+' WHEN 77 THEN 'A+' WHEN 78 THEN 'A+' WHEN 79 THEN 'A+' WHEN 80 THEN 'A+' WHEN 81 THEN 'A+' WHEN 82 THEN 'A+' WHEN 83 THEN 'A+' WHEN 84 THEN 'A+' WHEN 85 THEN 'A+' WHEN 86 THEN 'A+' WHEN 87 THEN 'A+'
    ELSE 'O'
  END as grade,
  CASE floor(random() * 100)
    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0
    WHEN 4 THEN 4 WHEN 5 THEN 4 WHEN 6 THEN 4 WHEN 7 THEN 4
    WHEN 8 THEN 5 WHEN 9 THEN 5 WHEN 10 THEN 5 WHEN 11 THEN 5 WHEN 12 THEN 5 WHEN 13 THEN 5 WHEN 14 THEN 5 WHEN 15 THEN 5
    WHEN 16 THEN 6 WHEN 17 THEN 6 WHEN 18 THEN 6 WHEN 19 THEN 6 WHEN 20 THEN 6 WHEN 21 THEN 6 WHEN 22 THEN 6 WHEN 23 THEN 6 WHEN 24 THEN 6 WHEN 25 THEN 6 WHEN 26 THEN 6 WHEN 27 THEN 6 WHEN 28 THEN 6 WHEN 29 THEN 6
    WHEN 30 THEN 7 WHEN 31 THEN 7 WHEN 32 THEN 7 WHEN 33 THEN 7 WHEN 34 THEN 7 WHEN 35 THEN 7 WHEN 36 THEN 7 WHEN 37 THEN 7 WHEN 38 THEN 7 WHEN 39 THEN 7 WHEN 40 THEN 7 WHEN 41 THEN 7 WHEN 42 THEN 7 WHEN 43 THEN 7 WHEN 44 THEN 7 WHEN 45 THEN 7 WHEN 46 THEN 7 WHEN 47 THEN 7 WHEN 48 THEN 7 WHEN 49 THEN 7
    WHEN 50 THEN 8 WHEN 51 THEN 8 WHEN 52 THEN 8 WHEN 53 THEN 8 WHEN 54 THEN 8 WHEN 55 THEN 8 WHEN 56 THEN 8 WHEN 57 THEN 8 WHEN 58 THEN 8 WHEN 59 THEN 8 WHEN 60 THEN 8 WHEN 61 THEN 8 WHEN 62 THEN 8 WHEN 63 THEN 8 WHEN 64 THEN 8 WHEN 65 THEN 8 WHEN 66 THEN 8 WHEN 67 THEN 8 WHEN 68 THEN 8 WHEN 69 THEN 8 WHEN 70 THEN 8 WHEN 71 THEN 8 WHEN 72 THEN 8
    WHEN 73 THEN 9 WHEN 74 THEN 9 WHEN 75 THEN 9 WHEN 76 THEN 9 WHEN 77 THEN 9 WHEN 78 THEN 9 WHEN 79 THEN 9 WHEN 80 THEN 9 WHEN 81 THEN 9 WHEN 82 THEN 9 WHEN 83 THEN 9 WHEN 84 THEN 9 WHEN 85 THEN 9 WHEN 86 THEN 9 WHEN 87 THEN 9
    ELSE 10
  END as grade_point,
  sub.credits
FROM students s
CROSS JOIN subjects sub
JOIN semesters sem ON sub.semester_id = sem.id
WHERE s.department = 'CSE' 
AND sem.semester_number = 5 
AND sem.department = 'CSE'
ON CONFLICT (student_id, subject_id) DO NOTHING;

-- Calculate and insert CGPA history for all students
DO $$
DECLARE
  student_rec RECORD;
  sem_num INTEGER;
  sem_points DECIMAL(10,2);
  sem_credits DECIMAL(10,2);
  calc_sgpa DECIMAL(4,2);
  calc_cgpa DECIMAL(4,2);
  cum_points DECIMAL(10,2);
  cum_credits DECIMAL(10,2);
BEGIN
  FOR student_rec IN SELECT id FROM students WHERE department = 'CSE' LOOP
    cum_points := 0;
    cum_credits := 0;
    
    FOR sem_num IN 1..5 LOOP
      -- Calculate SGPA for this semester
      SELECT COALESCE(SUM(g.grade_point * g.credits), 0), COALESCE(SUM(g.credits), 0)
      INTO sem_points, sem_credits
      FROM grades g
      WHERE g.student_id = student_rec.id AND g.semester_number = sem_num;
      
      IF sem_credits > 0 THEN
        calc_sgpa := ROUND((sem_points / sem_credits)::numeric, 2);
      ELSE
        calc_sgpa := 0;
      END IF;
      
      cum_points := cum_points + sem_points;
      cum_credits := cum_credits + sem_credits;
      
      IF cum_credits > 0 THEN
        calc_cgpa := ROUND((cum_points / cum_credits)::numeric, 2);
      ELSE
        calc_cgpa := 0;
      END IF;
      
      -- Insert history record
      IF calc_sgpa > 0 THEN
        INSERT INTO cgpa_history (student_id, semester_number, sgpa, cgpa)
        VALUES (student_rec.id, sem_num, calc_sgpa, calc_cgpa)
        ON CONFLICT (student_id, semester_number) DO UPDATE
        SET sgpa = calc_sgpa, cgpa = calc_cgpa;
      END IF;
    END LOOP;
  END LOOP;
END $$;

-- Update department statistics based on actual data
UPDATE department_statistics ds
SET 
  average_sgpa = (
    SELECT ROUND(AVG(ch.sgpa)::numeric, 2)
    FROM cgpa_history ch
    WHERE ch.semester_number = ds.semester_number
  ),
  average_cgpa = (
    SELECT ROUND(AVG(ch.cgpa)::numeric, 2)
    FROM cgpa_history ch
    WHERE ch.semester_number = ds.semester_number
  ),
  top_score = COALESCE((
    SELECT MAX(ch.sgpa)
    FROM cgpa_history ch
    WHERE ch.semester_number = ds.semester_number
  ), 9.50),
  student_count = (
    SELECT COUNT(DISTINCT student_id) FROM cgpa_history WHERE semester_number = ds.semester_number
  ),
  updated_at = now()
WHERE ds.department = 'CSE';