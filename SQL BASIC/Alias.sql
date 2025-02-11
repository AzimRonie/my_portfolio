--menulis alias mengunakan AS
select 
title as tajuk,
rental_rate as harga_sewa
from film;

--menulias alias tanpa mengunakan AS
select 
title tajuk,
rental_rate harga_sewa
from film;

--menulis judul kolom alias mengunakan " "
select 
title "Tajuk filem",
rental_rate "Harga sewa"
from film;

--mengunakan alias untuk nama table
select
f.film_id,
f.title, 
f.release_year,
f.rental_rate,
c."name"
from film f 
join film_category fc 
on f.film_id= fc.film_id
join category c 
on fc.category_id = c.category_id ;

--mengunakan alias untuk nama kolom
select
f.film_id as id_film,
f.title as judul_film,
f.release_year as tahun_dikeluarkan,
f.rental_rate as harga_sewa,
c."name" as kategori_film
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id ;

--mengunakan alias bersama fungsi agregat (SUM, MIN, MAX, AVG, COUNT)
select
sum (amount) total_pendapatan,
count (*) jumlah_transkaksi,
min (amount) pembayaran_minimum,
max (amount) pembayaran_maksimum,
avg (amount) pembayaran_purata
from payment p ;

--mengunakan alias pada joins
select
f.film_id,
f.title,
f.release_year,
f.rental_rate,
c."name"
from film f 
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id; 

--mengunakan alias pada subquery
select *
from (select *
from film f 
join film_category fc 
on f.film_id = fc.film_id
join category c 
on fc.category_id = c.category_id
where f.length >=60) as film_data_60

