drop table pekerja;

CREATE TABLE pekerja (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO pekerja (name, department_id, salary, hire_date) 
VALUES
('Ali', 1, 5000, '2020-01-15'),
('Abu', 1, 6000, '2018-05-23'),
('Aisyah', 1, 7000, '2019-07-10'),
('Bakar', 2, 4000, '2021-06-30'),
('Bobby', 2, 4500, '2022-01-12'),
('Siti', 3, 8000, '2017-11-05'),
('Farah', 3, 8200, '2019-03-28'),
('Zain', 3, 7800, '2020-09-17'),
('Sami', 4, 9000, '2015-07-01'),
('Hassan', 4, 8800, '2016-04-18');

select *
from pekerja;

--Basic syntax
/*WITH nama_cte AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT * FROM nama_cte;*/

--Basic CTE-filter data 
with high_salary as (
select employee_id, name, salary
from pekerja
where salary>6000
)
select*
from high_salary;

--CTE dengan aggregation- Average Salary Per Department
with avg_salary as(
select department_id,avg(salary) as avg_salary
from pekerja
group by department_id
)
select*
from avg_salary ;

--CTE dengan JOIN - Cari Pekerja Gaji atas Purata
with avg_salary as(
select department_id, avg(salary) as avg_salary	
from pekerja
group by department_id 
)
select p.name, p.salary, p.department_id ,a.avg_salary 
from pekerja p
join avg_salary a on p.department_id= a.department_id 
where p.salary > a.avg_salary ;

--Recursive CTE - Kira Tahun Bekerja 
--Recursive CTE digunakan untuk looping dalam SQL, contoh hierarchy data atau kira umur kerja.
with recursive work_year as(
select name, salary,2024-2020 as years_worked
from pekerja
)
select *
from work_year;

--Multi-CTEs - Gabungkan Beberapa CTE dalam Satu Query
with avg_salary as(
select department_id, avg(salary) as purata_gaji
from pekerja
group by department_id 
),
above_avg_salary as(
select p.name, p.salary, p.department_id, a.purata_gaji 
from pekerja p
join avg_salary a on p.department_id =a.department_id 
where p.salary >= a.purata_gaji 
)
select * from above_avg_salary;

--CTE dalam INSERT, UPDATE, DELETE - Update Semua Gaji yang Bawah Purata
WITH avg_salary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM pekerja
    GROUP BY department_id
)
UPDATE pekerja
SET salary = salary + 500
FROM avg_salary
WHERE pekerja.department_id = avg_salary.department_id
AND pekerja.salary < avg_salary.avg_salary;




