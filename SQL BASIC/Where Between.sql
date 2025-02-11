drop table employee_data;
-- create table

CREATE TABLE employee_data (
    date_of_birth DATE,
    full_name VARCHAR(100),
    job_role VARCHAR(50),
    salary NUMERIC(10,2),
    join_date DATE,
    last_promotion_date TIMESTAMP
);

-- Insert sample data into the table
INSERT INTO employee_data (date_of_birth, full_name, job_role, salary, join_date, last_promotion_date)
VALUES 
    ('1990-05-15', 'John Smith', 'Manager', 60000.00, '2015-03-20', '2019-07-01 09:00:00'),
    ('1985-10-10', 'Jane Doe', 'Developer', 55000.00, '2018-06-10', '2020-02-15 10:30:00'),
    ('1992-08-25', 'Michael Johnson', 'Sales Executive', 50000.00, '2017-09-15', '2019-12-20 11:45:00'),
    ('1988-04-20', 'Emily Brown', 'HR Manager', 58000.00, '2016-01-05', '2020-01-10 12:00:00'),
    ('1995-12-05', 'David Wilson', 'Analyst', 52000.00, '2019-02-28', '2021-03-05 13:30:00'),
    ('1987-07-12', 'Emma Martinez', 'Designer', 53000.00, '2014-11-10', '2020-10-25 14:45:00'),
    ('1993-03-30', 'Daniel Thompson', 'Engineer', 56000.00, '2018-04-15', '2020-09-01 15:15:00'),
    ('1991-11-20', 'Olivia Garcia', 'Accountant', 57000.00, '2017-07-20', '2020-12-10 16:30:00'),
    ('1989-09-01', 'William Rodriguez', 'Marketing Specialist', 54000.00, '2015-10-25', '2021-01-15 17:00:00'),
    ('1994-06-18', 'Sophia Hernandez', 'Customer Support', 51000.00, '2019-06-30', '2021-02-20 18:15:00'),
    ('1990-02-28', 'James Taylor', 'Project Manager', 59000.00, '2016-08-12', '2020-08-05 19:30:00'),
    ('1986-01-12', 'Ava King', 'Data Analyst', 48000.00, '2013-04-20', '2020-03-15 20:45:00'),
    ('1992-09-15', 'Benjamin Lopez', 'Software Engineer', 62000.00, '2018-09-05', '2021-09-20 21:00:00'),
    ('1985-04-08', 'Isabella Scott', 'Business Analyst', 57000.00, '2014-02-15', '2020-11-30 22:15:00'),
    ('1996-03-25', 'Mason Hill', 'Financial Analyst', 53000.00, '2020-01-10', '2022-02-10 23:30:00'),
    ('1988-12-10', 'Amelia Green', 'HR Coordinator', 54000.00, '2017-03-22', '2020-04-20 00:45:00'),
    ('1993-08-05', 'Logan Adams', 'Marketing Manager', 58000.00, '2019-07-05', '2021-03-01 01:00:00'),
    ('1987-05-20', 'Evelyn Baker', 'Product Manager', 60000.00, '2015-11-30', '2021-05-15 02:15:00'),
    ('1991-01-15', 'Ethan Campbell', 'Sales Manager', 61000.00, '2016-05-18', '2020-07-10 03:30:00'),
    ('1995-10-30', 'Harper Rivera', 'Customer Service Manager', 59000.00, '2020-03-08', '2022-04-20 04:45:00'),
    ('1989-06-25', 'Aiden Ward', 'IT Specialist', 55000.00, '2017-08-20', '2021-08-05 05:15:00'),
    ('1994-02-18', 'Scarlett Torres', 'Recruiter', 52000.00, '2019-10-15', '2021-10-20 06:00:00'),
    ('1990-11-05', 'Lucas Ramirez', 'Technical Support', 51000.00, '2016-12-25', '2020-06-15 07:30:00'),
    ('1986-09-20', 'Chloe Russell', 'Operations Manager', 62000.00, '2014-06-15', '2021-07-01 08:45:00'),
    ('1992-06-10', 'Zoe Peterson', 'System Administrator', 58000.00, '2018-02-28', '2021-11-10 09:00:00'),
    ('1985-03-08', 'Jackson Coleman', 'Network Engineer', 60000.00, '2015-09-10', '2020-09-30 10:15:00'),
    ('1996-01-25', 'Penelope Barnes', 'Customer Success Manager', 57000.00, '2020-04-20', '2022-01-05 11:30:00'),
    ('1988-07-30', 'Levi Howard', 'Business Development Manager', 61000.00, '2017-01-08', '2021-02-15 12:45:00'),
    ('1993-04-15', 'Grace Nelson', 'Quality Assurance', 54000.00, '2019-08-15', '2021-08-20 13:00:00');


select *
from employee_data 
order by full_name;

-- filter data type varchar / text 
select *
from employee_data 
where full_name between 'a' and 'm'
order by full_name;

-- filter data type numeric

select *
from employee_data 
order by salary;

select *
from employee_data
where salary between 48000 and 55000
order by salary;

-- filter data type date
select *
from employee_data 
order by join_date;

select *
from employee_data 
where join_date between '2015-01-01' and '2017-12-31'
order by join_date;

-- filter data type timestamp
select *
from employee_data 
order by last_promotion_date;

select *
from employee_data
where last_promotion_date between '2021-01-01 00:00:00' and '2022-01-01 23:59:59'
order by last_promotion_date;
