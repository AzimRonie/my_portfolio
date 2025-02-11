-- membuat tabel employees
CREATE TABLE employees (
    Employee_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Job_Position VARCHAR(50),
    Unit VARCHAR(50),
    Division VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- memasukkan data ke dalam tabel employees
INSERT INTO Employees (Employee_ID, Full_Name, Job_Position, Unit, Division, Salary)
VALUES
    (1, 'John Smith', 'GM', 'Sales', 'Sales', 75000.00),
    (2, 'Jane Johnson', 'Manager', 'Sales', 'Sales', 60000.00),
    (3, 'Bob Davis', 'Supervisor', 'Sales', 'Sales', 55000.00),
    (4, 'Alice Brown', 'Manager', 'Finance', 'Finance', 72000.00),
    (5, 'Mike Wilson', 'Supervisor', 'Finance', 'Finance', 65000.00),
    (6, 'Emily Lee', 'Staff', 'HR', 'HR', 50000.00),
    (7, 'David Miller', 'Manager', 'IT', 'IT', 65000.00),
    (8, 'Sara Harris', 'Supervisor', 'IT', 'IT', 58000.00),
    (9, 'Tom Clark', 'Staff', 'IT', 'IT', 48000.00),
    (10, 'Lisa Martinez', 'GM', 'Marketing', 'Marketing', 80000.00),
    (11, 'Chris Taylor', 'Manager', 'Marketing', 'Marketing', 67000.00),
    (12, 'Olivia Garcia', 'Staff', 'Finance', 'Finance', 52000.00),
    (13, 'Daniel Lopez', 'GM', 'Finance', 'Finance', 80000.00),
    (14, 'Linda Perez', 'Supervisor', 'HR', 'HR', 60000.00),
    (15, 'Eric Rodriguez', 'Manager', 'Marketing', 'Marketing', 67000.00),
    (16, 'Karen Hall', 'Staff', 'IT', 'IT', 50000.00),
    (17, 'Matthew Anderson', 'Supervisor', 'Sales', 'Sales', 60000.00),
    (18, 'Laura Moore', 'Manager', 'Finance', 'Finance', 67000.00),
    (19, 'Jason Perez', 'Staff', 'HR', 'HR', 49000.00),
    (20, 'Amanda Smith', 'GM', 'Marketing', 'Marketing', 75000.00);

-- cek isi tabel hasil insert   
select *
from employees 
limit 5;

-- melihat ada unit apa saja yang ada di dalam tabel (unique)
select unit department
from employees 
group by unit;

-- menghitung rata-rata gaji pegawai berdasarkan unit kerja (average)
select unit , avg(salary) avg_salary
from employees 
group by unit
order by avg_salary;

-- menghitung rata-rata gaji pegawai berdasarkan unit kerja dan posisi / jabatan
select unit, job_position, avg(salary) avg_salary
from employees 
group by unit, job_position
order by unit;

-- menghitung berapa jumlah karyawan berrdasarkan posisi / jabatan
select job_position, count(*)
from employees 
group by job_position;

-- drop table
drop table employees;
