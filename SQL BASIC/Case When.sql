-- Creating the Students table
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    ExamScore INT
);

-- Inserting sample data using INSERT INTO statement
INSERT INTO Students (StudentID, StudentName, ExamScore)
VALUES
    (1, 'Alice', 85),
    (2, 'Bob', 80),
    (3, 'Charlie', 75),
    (4, 'David', 70),
    (5, 'Eva', 65),
   	(6, 'Saniya', 60),
    (7, 'Acnologia', 55),
    (8, 'Zeno', 50);

-- case when statement example

select
    StudentID,
    StudentName,
    ExamScore,
    case
        when ExamScore >= 55 then 'Pass'
        else 'Fail'
    end as ExamStatus,
    case 
	    when examscore >= 85 then 'A'
	    when examscore >= 80 then 'A-'
	    when examscore >= 75 then 'B+'
	    when examscore >= 70 then 'B'
	    when examscore >= 65 then 'B-'
	    when examscore >= 60 then 'C+'
	    when examscore >= 55 then 'C'
	    else 'F'
    end as grades
from Students;

-- drop unused table
drop table students ;

