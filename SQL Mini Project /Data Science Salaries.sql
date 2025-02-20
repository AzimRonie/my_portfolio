--Pengumpulan Data
--mengambil semua data dari dataset.
select * from ds_salaries;

--Pembersihan Data (Data Cleaning)
--cari dan keluarkan baris yang mempunyai nilai gaji yang kosong/null
delete from ds_salaries
where salary_in_usd is null;

--Data Analysis
--Cari gaji purata (salary_in_usd) untuk setiap experience_level.
select experience_level,avg(salary_in_usd) as gaji_purata
from ds_salaries
group by experience_level ;

--Cari gaji maksimum dan minimum untuk setiap job_title.
select job_title,
max(salary_in_usd) as gaji_tertinggi,
min(salary_in_usd) as gaji_terendah
from ds_salaries
group by job_title ;

--Cari jumlah pekerja untuk setiap company_size.
select company_size, 
count(*) as jumlah_pekerja
from ds_salaries
group by company_size;

--cari gaji purata untuk setiap job_title dan experience_level
select job_title, experience_level,
avg(salary) purata_gaji
from ds_salaries
group by job_title , experience_level;

--cari pekerja yang mempunyai remote_ratio lebih daripada 50
select *
from ds_salaries
where remote_ratio > 50;

--cari pekerja yang mempunyai gaji salary_in_usd lebih daripada 100,000 dan bekerja di syarikat L
select *
from ds_salaries
where salary_in_usd = 100000 and company_size='L';

--cari pekerja yang bekerja di negara yang sama dengan tempat tinggal mereka (employee_residence = company_location)
select *
from ds_salaries
where employee_residence = company_location;

--cari pekerja yang mempunyai gaji salary (salary_in_usd ) dalam 10 teratas 
select *
from ds_salaries
order by salary_in_usd desc
limit 10;

--cari pekerja yang mempunyai gaji salary dalam 10 terbawah
select *
from ds_salaries
order by salary_in_usd 
limit 10;

--cari pekerja yang bekerja di syarikat yang terletak di Amerika Syarikat (US)
select *
from ds_salaries
where company_location = 'US';

--cari pekerja yang bekerja di syariakt yang terletak di luar Amerika Syarikat (US)
select *
from ds_salaries
where company_location != 'US';

--cari pekerja yang bekerja di syarikat yang terletak di Eropah (DE, FR, GB, ES, IT, NL, AT, BE, PT, GR)
--in ni equal to =
select *
from ds_salaries
where company_location in ('DE','FR','GB','ES','IT', 'NL', 'AT', 'BE', 'PT', 'GR');

--gunakan window function untuk lihat perbezaan gaji dalam satu jawatan kerja
--nak kira purata gaji untuk setiap jawatan tapi urutan gaji
--kalau guna WF, kita xpayah declare 'Group By'
select job_title,employee_residence, salary_in_usd,salary_currency,
rank() over(partition by job_title order by salary_in_usd desc) as salary_rank
from ds_salaries;
--kalau xletak partition, kedudukan job title tu akan berterabur dan xmengikut kedudukan kumpulan dia
select job_title, employee_residence, salary_in_usd,
avg(salary_in_usd)  over(partition by job_title order by salary_in_usd) as urutan_gaji,
rank()over(partition by job_title order by salary_in_usd) as rank_gaji
from ds_salaries;

--Gunakan CTE untuk kira purata gaji dan pilih pekerja yang gajinya atas purata
--CTE TAK WAJIB JOIN kalau hanya buat calculation atau filter data. CTE PERLU JOIN bila nak gabungkan CTE dengan table lain atau antara beberapa CTE.
with avg_salary as (
select job_title,avg(salary_in_usd) as purata_gaji
from ds_salaries
group by job_title
)
select *
from ds_salaries ds
join avg_salary avg on ds.job_title =avg.job_title 
where ds.salary_in_usd>avg.purata_gaji ;

--dgn CTE
WITH avg_salary AS (
    SELECT job_title, AVG(salary_in_usd) AS avg_salary
    FROM ds_salaries
    GROUP BY job_title
)
SELECT * FROM avg_salary;

--tanpa CTE
SELECT job_title, AVG(salary_in_usd) AS avg_salary
FROM ds_salaries
GROUP BY job_title;

--Gunakan subquery untuk mencari senarai pekerja yang mempunyai gaji lebih tinggi daripada purata keseluruhan
select *
from ds_salaries
where salary_in_usd > (
select avg(salary_in_usd) as purata_gaji
from ds_salaries
)

--check duplicate record
select work_year, experience_level, job_title, salary_currency, count(*) as count
from ds_salaries
group by work_year , experience_level , job_title , salary_currency 
having count(*)>1;

--delete dupliacte record (simpan satu je)
delete from ds_salaries
where work_year not in(
select min(work_year)
from ds_salaries
group by work_year, experience_level, employment_type, job_title, salary);		

--check missing value setiap column
select work_year,
count(*) -count(work_year) as missing_value
from ds_salaries
group by work_year;

--senarai pekerjaan dengan gaji lebih rendah daripada purata gaji keseluruhan
with avg_salary as(
select job_title, avg(salary) as purata_gaji
from ds_salaries
group by job_title 
)
select * from avg_salary;

select * 
from ds_salaries
where salary < 
(select avg(salary) 
from ds_salaries 
);
