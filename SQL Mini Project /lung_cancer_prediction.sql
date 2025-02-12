--senaraikan semua data dari dataset
select *
from lung_cancer_prediction ;

--dapatkan jumlah pesakit dari berlainan jantina
select lcp."Gender",
count(*) as total_patient
from lung_cancer_prediction lcp 
group by "Gender" ;

--kira purata umur pesakit
select
avg(lcp."Age" ) as age_avg
from lung_cancer_prediction lcp ;

--Senaraikan 10 pesakit tertua
select *
from lung_cancer_prediction lcp 
order by "Age" desc
limit 10;

--Bilangan pesakit yang merupakan perokok sekarang
select 
count(*) as jumlah_yang_aktif
from lung_cancer_prediction lcp 
where lcp."Smoking_Status" = 'Current Smoker';

--Bilangan pesakit yang mempunyai sejarah keluarga dengan kanser 
select 
count(*) as sejarah_keluarga
from lung_cancer_prediction lcp 
where lcp."Family_History" = 'Yes';

--senaraikan negara dengan pesakit tertinggi
select lung_cancer_prediction."Country" ,
count(*) total_patient
from lung_cancer_prediction
group by lung_cancer_prediction."Country" 
order by total_patient desc;

--bilangan pesakit didalam dan diluar bandar
select lcp."Rural_or_Urban",
count(*) as Bandar_luarbandar
from lung_cancer_prediction lcp 
group by "Rural_or_Urban" ;

--Dapatkan peratus pesakit yang mendapat akses rawatan penuh 
select
(count(*) filter(where lcp."Treatment_Access"='Full')*100/count(*)) as rawatan_penuh
from lung_cancer_prediction lcp;

--Kira pesakit mengikut tahap pencemaran udara yang terdedah tinggi
select
lcp."Air_Pollution_Exposure" ,
count(*) as total_patient
from lung_cancer_prediction lcp 
group by "Air_Pollution_Exposure" ;

--Dapatkan kadar purata risiko kematian berdasarkan status merokok
select lcp."Smoking_Status" , avg(lcp."Mortality_Risk") as risiko_kematian
from lung_cancer_prediction lcp 
group by "Smoking_Status" ;

--Senaraikan 5 negara dengan purata umur pesakit tertinggi 
select
lcp."Country" ,
avg(lcp."Age") as purata_umur
from lung_cancer_prediction lcp
group by "Country" 
order by purata_umur desc;

--Senaraikan jumlah pesakit yang mempunyai kelewatan dalam diagnosis
select count(lcp."Delay_in_Diagnosis") as jumlah_pesakit
from lung_cancer_prediction lcp 
where lcp."Delay_in_Diagnosis" ='Yes';

--Dapatkan jumlah pesakit yang mempunyai perlindungan insuran
select count(lcp."Insurance_Coverage" ) as jumlah_pesakit
from lung_cancer_prediction lcp 
where lcp."Insurance_Coverage" ='Yes';

--Bilangan pesakit yang mempunyai akses kepada ujian klinikal
select count(lcp."Clinical_Trial_Access" ) as jumlah_pesakit
from lung_cancer_prediction lcp 
where lcp."Clinical_Trial_Access" = 'Yes';

--Senaraikan 5 negara dengan jumlah pesakit paling sedikit
select 
lcp."Country" ,
count(*) as total_patient
from lung_cancer_prediction lcp 
group by "Country" 
order by total_patient asc
limit 5;

--Bilangan pesakit berdasarkan jenis kanser
select 
lcp."Cancer_Type" ,
count(*) as total_patient
from lung_cancer_prediction lcp
group by "Cancer_Type" ;

--Kira peratusan pesakit yang tinggal di bandar dan luar bandar
select
lcp."Rural_or_Urban",
(count(*)*100.0/ (select count(*) from lung_cancer_prediction)) as percentage
from lung_cancer_prediction lcp 
group by "Rural_or_Urban" ;

--Dapatkan purata umur pesakit yang mengalami kelewatan diagnosis mengikut jantina
select 
lcp."Gender",
avg(lcp."Age") as purata_umur
from lung_cancer_prediction lcp 
where lcp."Delay_in_Diagnosis" = 'Yes'
group by "Gender" ;

--Kira jumlah pesakit yang mengalami kelewatan diagnosis dan juga mempunyai sejarah keluarga dengan kanser
select 
count(*) as jumlah_pesakit
from lung_cancer_prediction lcp 
where lcp."Delay_in_Diagnosis"='Yes' and lcp."Family_History"='Yes';

--Senaraikan 3 negara dengan kadar risiko kematian tertinggi berdasarkan purata Mortality_Risk
select
lcp."Country" ,
avg(lcp."Mortality_Risk") as kadar_risiko_kematian
from lung_cancer_prediction lcp 
group by "Country" 
limit 3;

--Bandingkan jumlah pesakit yang mempunyai akses ujian klinikal antara kawasan bandar dan luar bandar
select
lcp."Rural_or_Urban" ,
count(*) as jumlah_pesakit
from lung_cancer_prediction lcp
where lcp."Clinical_Trial_Access" ='Yes'
group by "Rural_or_Urban";
