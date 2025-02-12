select* from employee e ;

--kira lelaki yang umur 20 keatas
SELECT * 
from employee e 
where e."Gender" ='Male' and e."Age" >=20
Order by e."Age";

--kira emplyee yang duk delhi dan ada bachelors
select *
from employee e 
where e."City" ='New Delhi' and e."Education" ='Bachelors'
order by e."Age" ;

--mengira jumlah berapa orang lelaki
SELECT 
count(e."Gender")
from employee e 
where e."Gender" ='Male';

--mengira berapa jumlah perempuan
select
count(e."Gender")
from employee e
where e."Gender" ='Female';

--Status orang (guna kes when)
select
"Education",
"City",
"Age",
case 
	when "JoiningYear">=2015 then 'Orang lama'
	else 'Orang baru'
end as Status
from employee;

--tambah column
alter table employee 
add Status varchar(255);

--drop column
alter table employee drop column status;

--Task
--Kira jumlah pekerja dalam dataset
select 
count(*) as TotalEmployee
from employee e ;

--Dapatkan semua pekerja yang berkerja di Pune
select *
from employee e 
where e."City" = 'Pune';

--total yang berkerja di Pune
select 
count(*) as Perkerja_Pune
from employee e 
where e."City" = 'Pune';

--melihat senarai apa yang ada dalam education
select "Education"
from employee e 
group by e."Education" ;

--kira bilangan senarai pemegang phd, master, bachelor
select "Education",
count (*)
from employee e 
group by e."Education" ;

--melihat senarai tempat apa yang ada dalam city
select "City" as tempat
from employee e
group by e."City";

--Senaraikan pekerja yang berumur 30 tahun
select *
from employee e 
where e."Age"> 30
order by e."Education";

--Senaraikan bilangan pekerja lelaki dan perempuan
select e."Gender",
count(*) as total
from employee e 
group by e."Gender";

--Kira purata pengalaman pekerja dalam domain masing2
select 
avg(e."ExperienceInCurrentDomain" ) as Experience 
from employee e ;

--Dapatkan semua pekerja yang berumur antara 25 hingga 30 tahun
select e."Age",
count(*) as total
from employee e 
where e."Age" between 25 and 30
group by "Age" ;

--Senaraikan pekerja yang mempunyai pengalaman lebih dari 5 tahun dalam domain mereka
select *
from employee e 
where e."ExperienceInCurrentDomain" > 5
order by e."ExperienceInCurrentDomain";

--kira totalnya
select e."ExperienceInCurrentDomain" ,
count(*) as total
from employee e
group by e."ExperienceInCurrentDomain" ;

--Dapatkan pekerja yang bekerja di 'New Delhi' dan mempunyai 'PHD'
select *
from employee e 
where e."City" ='New Delhi' and e."Education" ='PHD';

--kira totalnya
select
count(*) total
from employee e 
where e."City" ='New Delhi' and e."Education" ='PHD';

--kira umur yang paling muda dan yang paling tua
select 
min(e."Age") as paling_muda,
max(e."Age") as paling_tua
from employee e ; 

--Dapatkan 5 pekerja paling muda dalam syarikat
select *
from employee e 
order by "Age" 
limit 5;

--Dapatkan pekerja paling pengalaman
select *
from employee e 
order by "ExperienceInCurrentDomain" desc
limit 10;

--Kira jumlah pekerja dalam setiap bandar tetapi hanya paparkan bandar yang mempunyai lebih dari 300 pekerja
select e."City",
count(*) as jumlah_pekerja
from employee e 
group by e."City" having count(*)>300;

--Tentukan kategori umur pekerja (Muda: <30, Dewasa: 30-40, Berumur: >40)
select e."Age", 
case 
	when e."Age" <30 then 'Muda'
	when e."Age"  between 30 and 40 then 'Dewasa'
	else 'Berumur'
end as usia_pekerja
from employee e 

