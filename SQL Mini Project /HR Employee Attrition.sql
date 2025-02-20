/*
Basic SQL: Digunakan untuk query asas macam filter, aggregate, dan sorting.
CTEs: Digunakan bila nak buat query kompleks yang ada langkah pertengahan.
Subqueries: Digunakan dalam WHERE, SELECT, atau FROM untuk dapatkan nilai tambahan.
Window Functions: Digunakan bila nak buat analisis berdasarkan ranking, aggregation dalam partition, atau perbandingan antara row.
*/

select *
from wa_fn_usec;

--Pekerja yang bekerja lebih dari 10 tahun
select *
from wa_fn_usec
where wa_fn_usec."TotalWorkingYears"  > 10;

--pekerja yang bekerja di department "sales" dan berumur 30 tahun dan keatas
select *
from wa_fn_usec 
where wa_fn_usec."Department" = 'Sales' and wa_fn_usec."Age" >=30
order by "Age" ;

--bilangan pekerja dalam setiap department
select  wa_fn_usec."Department" ,
count (wa_fn_usec."EmployeeCount" ) as bilangan_pekerja
from wa_fn_usec 
group by wa_fn_usec."Department" ;

--gaji pekerja mengikut jawatan (Jobrole)
select wa_fn_usec."JobRole",
avg(wa_fn_usec."MonthlyIncome" ) as purata_gaji
from wa_fn_usec 
group by wa_fn_usec."JobRole" ;

--pekerja dgn gaji tertinggi 
select *
from wa_fn_usec wfu 
order by "MonthlyIncome" desc 
limit 1;

--CTE (Common Table Expression)
--cari pekerja yang gaji diatas purata dalam department masing-masing
with avg_salary as ( --create table sementara cte (Ibaratkan table ni dh ada data lengkap tp dia guna data yang wa_fn_usec)
select wfc."Department" , avg(wfc."MonthlyIncome") as purata_gaji--
from wa_fn_usec wfc
group by wfc."Department"
)
select wfc."Age" , wfc."Department" , wfc."MonthlyIncome" , a.purata_gaji 
from wa_fn_usec wfc
join avg_salary a on wfc."Department" =a."Department" 
where wfc."MonthlyRate" > a.purata_gaji ;

--CTE untuk kira purata tahun bekerja mengikut education field:
with avg_work as(
select wfu."EducationField", avg(wfu."TotalWorkingYears") as purata_tahun_bekerja
from wa_fn_usec wfu 
group by "EducationField"
)
select * 
from avg_work;

--Subquries
--Cari pekerja yang mempunyai gaji lebih tinggi dari purata semua pekerja mengikut umur:
select *
from wa_fn_usec wfu 
where wfu."MonthlyIncome" > 
(select avg(wfu."MonthlyIncome")
from wa_fn_usec wfu)
order by "Age" ;

--Cari pekerja yang bekerja di department yang ada lebih dari 50 pekerja:
select *
from wa_fn_usec wfu 
where wfu."Department" in
(select wfu."Department" 
from wa_fn_usec wfu
group by wfu."Department" 
having count(*)>50
);

--Senarai pekerja yang memiliki bilangan syarikat bekerja lebih banyak daripada purata:
select * 
from wa_fn_usec wfu 
where "NumCompaniesWorked" >
(select avg(wfu."NumCompaniesWorked") 
from wa_fn_usec wfu);

--Window Functions
--Rank pekerja berdasarkan MonthlyIncome (ranking gaji tertinggi):
select wfu."Age" , wfu."MonthlyIncome",
rank() over(order by wfu."MonthlyIncome" desc) as income_rank
from wa_fn_usec wfu;

--Dapatkan purata gaji pekerja dalam department yang sama
select wfu."Age" , wfu."MonthlyIncome" , wfu."Department",
avg(wfu."MonthlyIncome") over(partition by wfu."Department") as purata_gaji
from wa_fn_usec wfu;

--Dapatkan pekerja sebelum dan selepas dalam senarai ikut MonthlyIncome:
select wfu."Age" , wfu."MonthlyIncome",
lag(wfu."MonthlyIncome") over(order by wfu."MonthlyIncome") as previous_salary,
lead(wfu."MonthlyIncome") over (order by wfu."MonthlyIncome") as next_salary
from wa_fn_usec wfu ;

--Cumulative sum MonthlyIncome bagi setiap department
select wfu."Age" , wfu."MonthlyIncome" , wfu."Department" ,
sum(wfu."MonthlyIncome") over (partition by wfu."Department" order by wfu."MonthlyIncome" asc) as cumulative_sum
from wa_fn_usec wfu ;

--Cari pekerja yang pengalaman dia (TotalWorkingYears) lebih tinggi dari purata dalam department masing-masing:
select*
from wa_fn_usec wfu1 
where wfu1."TotalWorkingYears" > 
(select avg(wfu."TotalWorkingYears" )
from wa_fn_usec wfu 
where wfu."Department"=wfu1."Department"
);

