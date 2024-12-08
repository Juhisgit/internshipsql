use internship;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE,
    Email VARCHAR(100)
);
-- Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Credits INT
);

-- Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- Insert into Students
INSERT INTO Students (StudentID, Name, DateOfBirth, Email)
VALUES
(1, 'Alice Johnson', '2001-05-15', 'alice.johnson@example.com'),
(2, 'Bob Brown', '2000-08-22', 'bob.brown@example.com');

-- Insert into Courses
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES
(1, 'Mathematics', 3),
(2, 'Computer Science', 4),
(3, 'History', 2);

-- Insert into Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade)
VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 2, 'A'),
(4, 2, 3, 'B');
SELECT * FROM Students;

-- List courses a specific student is enrolled in
SELECT s.Name, c.CourseName, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.Name = 'Alice Johnson';

-- Add a new course and enroll a student
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (4, 'Physics', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade)
VALUES (5, 1, 4, NULL);

-- Update grade for a student
UPDATE Enrollments
SET Grade = 'A+'
WHERE EnrollmentID = 2;

-- Find students and their grades for a specific course
SELECT s.Name, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
WHERE e.CourseID = 2;