CREATE TABLE pekerja_staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO pekerja_staff (name, department_id, salary) VALUES
('Ali', 1, 7000),
('Abu', 1, 9000),
('Siti', 2, 12000),
('Ahmad', 2, 10000),
('Farah', 3, 8000),
('Zain', 3, 15000),
('Mira', 3, 9500);

select *
from pekerja_staff;

--cari gaji tertinggi
SELECT MAX(salary) 
FROM pekerja_staff;

--guna subqueries, nak cari siapa yang ada gaji paling tinggi
select name, salary
from pekerja_staff
where salary = 
(
select max(salary)
from pekerja_staff);

--Single-Row Subquery - Cari Pekerja dengan Gaji Tertinggi dalam Setiap Department
--cari siapa paling kaya dalam setiap department.
select name, department_id, salary
from pekerja_staff ps
where salary = (
select max(salary)
from pekerja_staff sp
where ps.department_id=sp.department_id);

--Multi-Row Subquery - Cari Semua Pekerja dalam Department yang Ada Gaji RM10,000 ke Atas
--pekerja mana dalam department yang ada gaji RM10,000 ke atas.
select name, department_id, salary
from pekerja_staff
where department_id in(
select distinct department_id
from pekerja_staff
where salary >=10000
);

--Correlated Subquery - Cari Pekerja yang Gajinya Atas Purata dalam Department
--cari pekerja yang gajinya lebih tinggi dari purata dalam department dia sendiri.
select name, department_id, salary
from pekerja_staff p
where salary > (select avg(salary) from pekerja_staff ps where p.department_id=ps.department_id);

--EXISTS Subquery - Check Sama Ada Department Ada Pekerja
--Nak tahu department mana yang ada pekerja.
--select distinct utk buang duplicate data
select distinct department_id
from pekerja_staff
where exists (
select 1 
from pekerja_staff
);

--not exist subquery - cari department tanpa pekerja
--Nak cari department yang belum ada pekerja.
select distinct department_id
from pekerja_staff 
where department_id not in(
select distinct department_id
from pekerja_staff 
);

--Subquery dalam FROM (Derived Table) - Kira Purata Gaji dalam Setiap Department
--Nak tunjuk purata gaji setiap department dalam bentuk jadual.
select department_id, purata_gaji
from(
select department_id, avg(salary) as purata_gaji
from pekerja_staff 
group by department_id 
) as rumusan_gaji;
 
--Subquery dalam SELECT - Bezakan Gaji Setiap Pekerja dengan Purata
--Nak tunjuk berapa beza gaji pekerja dengan purata gaji department mereka.
select name, department_id, salary,
salary - (
select avg(salary)
from  pekerja_staff
where department_id=ps.department_id) as perbezaan_gaji
from pekerja_staff ps;

--Nested Subquery - Cari Pekerja dengan Gaji Lebih Tinggi dari Semua dalam Department Lain
--Nak cari pekerja dalam department 1 yang gajinya lebih tinggi dari semua pekerja department 2.
select name, salary
from pekerja_staff 
where department_id=1
and salary > all ( -- all bermaksud mesti lebih besar dari semua nilai dalam subquery
select  salary
from pekerja_staff
where department_id=2
);

--update dengan subquery -- naikkan gaji semua pekerja bawah purata.
--Naikkan gaji semua pekerja yang gajinya bawah purata.
update pekerja_staff 
set salary=salary+500
where salary < (select avg(salary) from pekerja_staff);

--DELETE dengan Subquery - Padam Pekerja yang Gaji Bawah 7000
--HR nak padam pekerja yang gajinya bawah RM7,000.
delete from pekerja_staff
where salary< (select avg(salary) from pekerja_staff);
