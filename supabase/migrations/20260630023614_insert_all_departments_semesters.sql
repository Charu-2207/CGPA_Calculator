-- Insert semesters for all 9 new departments
INSERT INTO semesters (semester_number, department) VALUES
(1,'IT'),(2,'IT'),(3,'IT'),(4,'IT'),(5,'IT'),(6,'IT'),(7,'IT'),(8,'IT'),
(1,'BME'),(2,'BME'),(3,'BME'),(4,'BME'),(5,'BME'),(6,'BME'),(7,'BME'),(8,'BME'),
(1,'AIDS'),(2,'AIDS'),(3,'AIDS'),(4,'AIDS'),(5,'AIDS'),(6,'AIDS'),(7,'AIDS'),(8,'AIDS'),
(1,'AIML'),(2,'AIML'),(3,'AIML'),(4,'AIML'),(5,'AIML'),(6,'AIML'),(7,'AIML'),(8,'AIML'),
(1,'MDE'),(2,'MDE'),(3,'MDE'),(4,'MDE'),(5,'MDE'),(6,'MDE'),(7,'MDE'),(8,'MDE'),
(1,'EEE'),(2,'EEE'),(3,'EEE'),(4,'EEE'),(5,'EEE'),(6,'EEE'),(7,'EEE'),(8,'EEE'),
(1,'ECE'),(2,'ECE'),(3,'ECE'),(4,'ECE'),(5,'ECE'),(6,'ECE'),(7,'ECE'),(8,'ECE'),
(1,'MECH'),(2,'MECH'),(3,'MECH'),(4,'MECH'),(5,'MECH'),(6,'MECH'),(7,'MECH'),(8,'MECH'),
(1,'CIVIL'),(2,'CIVIL'),(3,'CIVIL'),(4,'CIVIL'),(5,'CIVIL'),(6,'CIVIL'),(7,'CIVIL'),(8,'CIVIL')
ON CONFLICT (semester_number, department) DO NOTHING;
