drop table employees;

-- Create the employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    mobile_number VARCHAR(15),
    position VARCHAR(50),
    employee_grade INT CHECK(employee_grade BETWEEN 1 AND 6)
);

-- Insert sample data into the employees table
INSERT INTO employees (first_name, last_name, email, mobile_number, position, employee_grade)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '0812345678', 'Software Engineer', 3),
    ('Jane', 'Smith', 'jane.smith@example.com', '0898765432', 'Data Scientist', 4),
    ('Michael', 'Brown', 'michael.brown@example.com', '0811223344', 'Product Manager', 5),
    ('Emily', 'Johnson', 'emily.johnson@example.com', '0899887766', 'HR Specialist', 2),
    ('Chris', 'O''Connor', 'chris.oconnor@example.com', '0833445566', 'DevOps Engineer', 3),
    ('Sophia', 'Miller', 'sophia.miller@example.com', '0876543210', 'UX Designer', 3),
    ('Daniel', 'Williams', 'daniel.williams@example.com', NULL, 'Finance Analyst', 4), -- Missing phone number
    ('Olivia', 'Davis', 'olivia.davis@example.com', '081122334455', 'Marketing Manager', 5),
    ('James', 'Wilson', 'james.wilson@example.com', '082233445566', 'Sales Executive', 2),
    ('Isabella', 'Garcia', 'isabella.garcia@example.com', '083344556677', 'Quality Assurance', 3),
    ('Liam', 'Martinez', 'liam.martinez@example.com', '084455667788', 'Frontend Developer', 3),
    ('Charlotte', 'Hernandez', 'charlotte.hernandez@example.com', '085566778899', 'Backend Developer', 3),
    ('Benjamin', 'Lopez', 'benjamin.lopez@example.com', '086677889900', 'Full Stack Developer', 4),
    ('Mia', 'Gonzalez', 'mia.gonzalez@example.com', '087788990011', 'Data Engineer', 4),
    ('William', 'Moore', 'william.moore@example.com', '088899001122', 'Team Lead', 5),
    ('Amelia', 'Taylor', 'amelia.taylor@example.com', '089900112233', 'HR Manager', 4),
    ('Elijah', 'Anderson', 'elijah.anderson@example.com', '080011223344', 'CTO', 6),
    ('Harper', 'Thomas', 'harper.thomas@example.com', '08112233445566', 'CEO', 6),
    ('Alexander', 'Jackson', 'alexander.jackson@example.com', '08223344556677', 'Operations Manager', 5),
    ('Ava', 'White', 'ava.white@example.com', NULL, 'Terminated', NULL); -- Employee terminated

   
-- find the length of employees name
   
SELECT 
    id,
    first_name,
    last_name,
    LENGTH(first_name) AS first_name_length,
    LENGTH(last_name) AS last_name_length
FROM employees;

-- validate mobile phone number (valid if the number of digits between 10-13)

SELECT 
    id,
    first_name,
    last_name,
    mobile_number,
    LENGTH(mobile_number) AS mobile_length
FROM employees
WHERE LENGTH(mobile_number) BETWEEN 10 AND 13;

SELECT 
    id,
    first_name,
    last_name,
    mobile_number,
    length(mobile_number),
 	case 
	 	WHEN mobile_number IS NULL THEN 'missing number'
        WHEN LENGTH(mobile_number) < 9 OR LENGTH(mobile_number) > 13 THEN 'invalid number'
        ELSE 'valid'
    END AS phone_number_validity
FROM employees;


-- find the position with short name
SELECT 
    id,
    first_name,
    last_name,
    position,
    LENGTH(position) AS position_length
FROM employees
WHERE LENGTH(position) < 10;


-- categorize employees name
SELECT 
    id,
    first_name,
    CASE 
        WHEN LENGTH(first_name) <= 5 THEN 'Short'
        WHEN LENGTH(first_name) BETWEEN 6 AND 10 THEN 'Medium'
        ELSE 'Long'
    END AS name_length_category
FROM employees;


-- total employees name length
SELECT 
    id,
    first_name,
    last_name,
    LENGTH(first_name) + LENGTH(last_name) AS total_name_length
FROM employees;


-- filter employees based on email address length
SELECT 
    id,
    first_name,
    last_name,
    email,
    LENGTH(email) AS email_length
FROM employees
WHERE LENGTH(email) > 20
order by length(email) ;

-- combine with trim

SELECT 
    id,
    TRIM(first_name) AS trimmed_first_name,
    LENGTH(TRIM(first_name)) AS trimmed_first_name_length,
    TRIM(last_name) AS trimmed_last_name,
    LENGTH(TRIM(last_name)) AS trimmed_last_name_length
FROM employees;


-- detect missing value
SELECT 
    id,
    first_name,
    mobile_number
FROM employees
WHERE LENGTH(TRIM(first_name)) = 0 OR LENGTH(TRIM(mobile_number)) = 0;


-- calculate average length

SELECT 
    AVG(LENGTH(mobile_number)) AS avg_mobile_number_length
FROM employees;

-- 
SELECT 
    id,
    first_name,
    last_name,
    position,
    LENGTH(position) AS position_length
FROM employees
ORDER BY LENGTH(position) DESC
LIMIT 10;
	
