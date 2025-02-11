-- Create the employees table
--kalau guna UPDATE, wajib pakai where
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

    
-- update single column
select *
from employees
where id = 1;

UPDATE employees
SET email = 'new.john.doe2@example.com'
WHERE id = 1;

-- update multiple column
select *
from employees
where id = 1 ;

UPDATE employees
SET position = 'Senior Software Engineer',
    employee_grade = 4
WHERE id = 1;

-- conditional update
select *
from employees
where position = 'Backend Developer';

UPDATE employees
SET employee_grade = employee_grade + 1
WHERE position = 'Backend Developer';

-- set default missing data
select *
from employees
where id = 20 ;

UPDATE employees
SET mobile_number = '+62800000000'
WHERE mobile_number IS NULL;

-- bulk update
select *
from employees
where position = 'HR Manager'

UPDATE employees
SET employee_grade = 5
WHERE position = 'HR Manager';

-- clear data
select *
from employees
where position = 'Terminated';

UPDATE employees
SET mobile_number = NULL
WHERE position = 'Terminated';

-- conditional update
select *
from employees
WHERE position IN ('CEO', 'CTO') OR position ILIKE '%Manager%';--ilike ni dia cari perkataan tu ada perkataan manager ke x

UPDATE employees
SET employee_grade = 
CASE
    WHEN position = 'CEO' THEN 6
    WHEN position = 'CTO' THEN 5
    WHEN position ILIKE '%Manager%' THEN 4
    ELSE employee_grade
END;


-- standardize text
UPDATE employees
SET first_name = TRIM(first_name),
    last_name = TRIM(last_name);
   
UPDATE employees
SET first_name = 'Anas';

select *
from employees;


drop table employees;
