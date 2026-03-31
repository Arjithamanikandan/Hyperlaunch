-- Students table
CREATE TABLE Students (
    StudentID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Dept VARCHAR2(30),
    DOB DATE,
    Email VARCHAR2(50) UNIQUE,
    PhoneNo VARCHAR2(10)
);

-- Courses table
CREATE TABLE Courses (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50) NOT NULL,
    Credits NUMBER(2) CONSTRAINT chk_credits CHECK (Credits BETWEEN 1 AND 5)
);

-- Faculty table
CREATE TABLE Faculty (
    FacultyID NUMBER PRIMARY KEY,
    FacultyName VARCHAR2(50) NOT NULL,
    Dept VARCHAR2(30),
    Email VARCHAR2(50) UNIQUE
);

-- Enrollments table (many-to-many)
CREATE TABLE Enrollments (
    EnrollID NUMBER PRIMARY KEY,
    StudentID NUMBER REFERENCES Students(StudentID),
    CourseID NUMBER REFERENCES Courses(CourseID),
    Grade CHAR(2)
);

-- Insert students
INSERT INTO Students VALUES (1, 'Amit Sharma', 'Computer Science', TO_DATE('2002-05-12','YYYY-MM-DD'), 'amit@college.edu', '9876543210');
INSERT INTO Students VALUES (2, 'Priya Verma', 'Electronics', TO_DATE('2001-08-23','YYYY-MM-DD'), 'priya@college.edu', '9876543211');
INSERT INTO Students VALUES (3, 'Rahul Mehta', 'Mechanical', TO_DATE('2000-11-05','YYYY-MM-DD'), 'rahul@college.edu', '9876543212');

-- Insert courses
INSERT INTO Courses VALUES (101, 'Databases', 4);
INSERT INTO Courses VALUES (102, 'Algorithms', 3);
INSERT INTO Courses VALUES (103, 'Physics', 5);

-- Insert enrollments
INSERT INTO Enrollments VALUES (1, 1, 101, 'A');
INSERT INTO Enrollments VALUES (2, 2, 102, 'B+');
INSERT INTO Enrollments VALUES (3, 3, 103, 'A-');
INSERT INTO Enrollments VALUES (4, 1, 102, 'B');

-- 1. Student details with functions
SELECT Name, UPPER(Name) AS Upper_Name, LENGTH(Email) AS Email_Length, PhoneNo FROM Students;

-- 2. Aggregates: Average credits and total students
SELECT AVG(Credits) AS Avg_Credits, COUNT(*) AS Total_Students FROM Courses, Students;

-- 3. JOIN: Students with enrolled courses and grades
SELECT s.Name, c.CourseName, e.Grade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID;

-- 4. GROUP BY: Students per department
SELECT Dept, COUNT(*) AS Student_Count 
FROM Students 
GROUP BY Dept 
HAVING COUNT(*) >= 1;

-- 5. CREATE VIEW for student courses
CREATE OR REPLACE VIEW StudentCoursesView AS
SELECT s.Name AS StudentName, c.CourseName, e.Grade
FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- Procedure 1: Update student grade
CREATE OR REPLACE PROCEDURE UpdateGrade(
    p_StudentID IN NUMBER,
    p_CourseID IN NUMBER,
    p_NewGrade IN CHAR
) AS
BEGIN
    UPDATE Enrollments 
    SET Grade = p_NewGrade 
    WHERE StudentID = p_StudentID AND CourseID = p_CourseID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Grade updated successfully.');
END;
/
-- Usage: EXEC UpdateGrade(1, 101, 'A+');

-- Procedure 2: Calculate student GPA (A=4.0, B=3.0, etc.)
CREATE OR REPLACE PROCEDURE CalculateGPA(
    p_StudentID IN NUMBER,
    p_GPA OUT NUMBER
) AS
BEGIN
    SELECT AVG(CASE 
        WHEN Grade = 'A' THEN 4.0 
        WHEN Grade = 'B' THEN 3.0 
        WHEN Grade = 'C' THEN 2.0 
        ELSE 0 
    END) INTO p_GPA
    FROM Enrollments 
    WHERE StudentID = p_StudentID;
END;
/
-- Usage example:
DECLARE
    v_gpa NUMBER;
BEGIN
    CalculateGPA(1, v_gpa);
    DBMS_OUTPUT.PUT_LINE('GPA: ' || v_gpa);
END;
/

