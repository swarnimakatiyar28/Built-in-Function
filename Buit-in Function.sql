DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'Aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'Priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'Rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'Neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'Ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'Arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'Simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'Vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'Kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'Rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');

select * from CourseEnrollments ;

select upper(CONCAT(FirstName, ' ', LastName)) AS FullName from CourseEnrollments ;

select concat((left(FirstName, 1)),
substring(FirstName, 2))
 from CourseEnrollments ;
 
 select concat(upper(left(coursename, 3)),
 '_',
 studentid)
 as studentcode from CourseEnrollments ;


select firstname,
reverse(firstname) as reversename,
char_length(firstname) as namelength from CourseEnrollments ;


select firstname,
locate('a',firstname)
from CourseEnrollments ; 

select firstname,upper(replace(firstName, 'a', 'o')) as newName from CourseEnrollments ;

select firstname, LPAD(firstname, 12, '0') as paddedname from CourseEnrollments ;

select concat(right(coursename, 2),'_',
left(firstname, 2)
)as courselabe1 from  CourseEnrollments ;

SELECT
    FirstName,
    LastName,
    CONCAT(
        UPPER(SUBSTRING(FirstName, 1, 3)),
        LOWER(RIGHT(LastName, 2))
    ) AS StudentCode
FROM CourseEnrollments;

SELECT
    Fee,
    ROUND(Fee, 1) AS RoundOneDecimal,
    ROUND(Fee, 0) AS RoundWholeNumber
FROM CourseEnrollments;

SELECT
    Fee,
    CEIL(Fee) AS RoundedUp,
    FLOOR(Fee) AS RoundedDown
FROM CourseEnrollments;

SELECT
    Fee,
    MOD(Fee, 500) AS Remainder
FROM CourseEnrollments;

SELECT
    Fee,
    ABS(Fee - 10000) AS AbsoluteDifference
FROM CourseEnrollments;

SELECT
    Fee,
    ROUND(Fee * 1.18, 2) AS UpdatedFee
FROM CourseEnrollments;


SELECT
    Fee,
    FORMAT(Fee, 2) AS FormattedFee
FROM CourseEnrollments;

SELECT
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear,
    MONTHNAME(EnrollmentDate) AS MonthName,
    DAYNAME(EnrollmentDate) AS DayName
FROM CourseEnrollments;


SELECT
    EnrollmentDate,
    DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS FormattedEnrollmentDate,
    DATE_FORMAT(CompletionDate, '%M %d, %Y') AS FormattedCompletionDate
FROM CourseEnrollments;

SELECT
    EnrollmentDate,
    CompletionDate,
    TIMESTAMPDIFF(DAY, EnrollmentDate, CompletionDate) AS TotalDays
FROM CourseEnrollments;

SELECT
    EnrollmentDate,
    DATE_ADD(
        DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH),
        INTERVAL 10 DAY
    ) AS NewDate
FROM CourseEnrollments;



SELECT
    CompletionDate,
    DATE_ADD(CompletionDate, INTERVAL -7 DAY) AS PreviousDate
FROM CourseEnrollments;



SELECT
    EnrollmentDate,
    CompletionDate,
    TIMESTAMPDIFF(MONTH, EnrollmentDate, CompletionDate) AS TotalMonths
FROM CourseEnrollments;


SELECT
    EnrollmentDate,
    DATE_ADD(
        DATE_ADD(
            DATE_ADD(EnrollmentDate, INTERVAL 1 YEAR),
            INTERVAL 2 MONTH
        ),
        INTERVAL 5 DAY
    ) AS UpdatedDate
FROM CourseEnrollments;



SELECT
    EnrollmentDate,
    DAYNAME(EnrollmentDate) AS EnrollmentDay,
    CompletionDate,
    DAYNAME(CompletionDate) AS CompletionDay
FROM CourseEnrollments;


SELECT
    EnrollmentDate,
    CURDATE() AS CurrentDate,
    TIMESTAMPDIFF(DAY, EnrollmentDate, CURDATE()) AS DaysUntilToday
FROM CourseEnrollments;
 
 
SELECT
    DATE_FORMAT(CompletionDate, '%d/%m/%Y') AS OriginalCompletionDate,
    DATE_FORMAT(
        DATE_ADD(CompletionDate, INTERVAL 15 DAY),
        '%d/%m/%Y'
    ) AS NewCompletionDate
FROM CourseEnrollments;