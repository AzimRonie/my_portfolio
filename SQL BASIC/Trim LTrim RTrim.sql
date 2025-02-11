CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    comments VARCHAR(255),
    phone_number VARCHAR(20),
    extra_spaces_column VARCHAR(100)
);

-- Insert Sample Data
INSERT INTO students (full_name, email, comments, phone_number, extra_spaces_column)
VALUES
    ('  John   Doe  ', ' john.doe@example.com ', ' Regular student   ', ' 123-456-7890 ', '   Extra   spaces   '),
    ('Jane   Smith', 'jane.smith@example.com', '  Top   performer ', '123- 456 -7890-', 'Misaligned    '),
    ('   Michael  Brown', ' michael.brown@example.com ', ' Average   performer ', ' 1234567890- ', 'Multiple      spaces   '),
    (' Emily  Johnson   ', 'emily.j@example.com  ', '  Irregular   participation ', NULL, ' Unnecessary trailing  '),
    ('Chris O''Connor ', 'chris.o@example.com', '', '123  456  7890', ' Needs trimming  '),
    ('   ', NULL, ' Missing name and email ', NULL, '    ');

   
-- check data insertion result
select *
from students;


-- 1. Trim Leading and Trailing Spaces-> fungsi TRIM hapuskan extra space diawal dan diakhir text
SELECT
    full_name,
    length(full_name) num_of_char_before_trim,
    TRIM(full_name) AS cleaned_full_name,
    length(TRIM(full_name)) num_of_char_after_trim
FROM students;

select --yang ni lebih spesifik, sama je yg atas
    full_name,
    length(full_name) num_of_char_before_trim,
    TRIM(both '' from full_name) AS cleaned_full_name,
    length(trim(both ' ' from full_name)) num_of_char_after_trim
FROM students;

-- 2. Remove Leading Characters Only
SELECT
    student_id,
    phone_number ,
    LTRIM(phone_number) AS cleaned_phone_number
FROM students;

-- 3. Remove Trailing Characters Only
SELECT
    student_id,
    extra_spaces_column ,
    RTRIM(extra_spaces_column) AS cleaned_column
FROM students;

-- 4: Remove Specific Characters (e.g., - or ) from Phone Numbers
SELECT 
    student_id,
    phone_number,
    TRIM(BOTH ' -' FROM phone_number) AS cleaned_phone_number
FROM students;

drop table students;
