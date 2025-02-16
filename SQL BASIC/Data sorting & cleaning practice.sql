select * 
from complex_data cd;

drop table complex_data ;

--cari berapa ruangan email yang kosong
select
count(*) as tiada_email
from complex_data cd 
where "Email" ='' or cd."Email" is null;

update complex_data 
set "Email"='Tiada Email'
where complex_data."Email" = '' or complex_data."Email" is null;

--Mengesan dan membuang duplikasi 
--cari rekod duplikasi berdasarkan email dan nama
select cd."Email" ,cd."Nama",
count(*) as total_duplikasi
from complex_data cd 
group by "Email", "Nama" 
having count(*)>1;

--Padam rekod duplikasi, hanya simpan ID terkecil
delete from complex_data 
where complex_data."ID"
not in(
select min(cd."ID" )
from complex_data cd 
group by cd."Email" , cd."Nama" 
);

/*Data Cleaning
1. Padam rekod yang duplicate berdasarkan ID*/
delete from complex_data cd
where cd."ID" not in (
select min(complex_data."ID") 
from complex_data
group by complex_data."Email" , complex_data."Nama");--dia tgk kombinasi nama dgn email, id mana yang kecil dia akan kekalkan, kalau id tu data duplicate dgn id lain

--2.isikan nilai kosong dalam kolumn gaji dgn purata gaji
update complex_data cd 
set "Gaji"=(select avg(cd."Gaji" ) from complex_data cd)
where cd."Gaji"  is null;

--3.Pada rekod yang tiada email
delete from complex_data cd where cd."Email"  = ' ' or cd."Email"  is null;

/*data sorting 
1.Susun ikut gaji tertinggi*/
select *
from complex_data cd 
order by "Gaji" desc;

--2.susun ikut negeri, kemudian gaji
select *
from complex_data cd 
order by "Negeri" , "Gaji" desc;

--3.Susun Pelanggan Mengikut Aktiviti (Paling Aktif ke Kurang Aktif)
select *
from complex_data cd 
order by "Jumlah_Hari_Aktif" desc;

--4.Susun Pelanggan VIP Dahulu
--1 dgn 2 tu adalah kedudukan mereka dalam table
select *
from complex_data cd 
order by 
case 
	when "Pelanggan_VIP" ='Ya' then 1
	else 2
end,
"Gaji" desc;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table bekerja;

create table bekerja (
id serial primary key,
nama varchar(50),
jawatan varchar(50),
gaji int,
email varchar(50)
);

insert into bekerja (nama, jawatan, gaji, email)
values
('Ali', 'Manager', 5000, 'ali@email.com'),
('Siti','Designer',4500,''),
('Amin', 'Developer', 6000, NULL),
('Sara', 'Intern', 1200, 'sara@email.com'),
('Ali', 'Manager', 5000, 'ali@email.com'),  -- Duplikasi
('Zaki', 'Technician', 3500, ''),
('Siti', 'Designer', 4500, 'siti@email.com');  -- Sama nama, tapi email berbeza

select * 
from bekerja;

--check email yang kosong
select *
from bekerja
where email='' or email is null;

--Hapuskan data duplikasi 
delete from bekerja
where id not in(
select min(id) --id yang paling kecik akan dikekalkan
from bekerja
group by nama, jawatan, gaji, email
);

--update email
update bekerja
set email='Tiada email'
where email='' or email is null;

--Susun berdasarkan gaji tertinggi ke gaji terendah
select *
from bekerja
order by gaji desc;

--susun berdasarkan nama (A-Z)
select *
from bekerja
order by nama asc;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table pelanggan;

CREATE TABLE pelanggan (
    ID SERIAL PRIMARY KEY,
    Nama VARCHAR(100),
    Umur INT,
    Bandar VARCHAR(100),
    Email VARCHAR(100),
    Baki_Akaun DECIMAL(10,2)
);

INSERT INTO pelanggan (Nama, Umur, Bandar, Email, Baki_Akaun)
VALUES
('Ali', 25, 'Kuala Lumpur', 'ali@email.com', 5000.50),
('Siti', 30, 'Johor Bahru', '', 7500.00),
('Amin', 28, 'Penang', NULL, 3000.00),
('Sara', 22, 'Kuala Lumpur', 'sara@email.com', 1500.75),
('Ali', 25, 'Kuala Lumpur', 'ali@email.com', 5000.50),  -- Duplikasi
('Zaki', 35, 'Shah Alam', '', 4200.25),
('Hafiz', 29, 'Kuching', 'hafiz@email.com', 0.00),
('Amin', 28, 'Penang', NULL, 3000.00),  -- Duplikasi
('Amin', 28, 'Penang', 'amin@email.com', 3000.00);  -- Email berbeza!

select *
from pelanggan;

--cari data kosong
select * 
from pelanggan 
where email ='' or email is null;

--Update data kosong dgn placeholder
update pelanggan
set email='Tiada email'
where email='' or email is null;

--kira berapa data kosong (email)
select count(*) as email_kosong
from pelanggan
where email='' or email is null;

--Delete data duplikasi 
delete from pelanggan
where ID not in(
select min(ID)
from pelanggan
group by nama, umur,email
);

--susun mengikut baki akaun tertinggi ke terendah
select *
from pelanggan
order by baki_akaun desc;

--susun mengikut bandar pastu umur
select *
from pelanggan
order by bandar , umur desc;

--kira berapa pelanggan dari setiap bandar
select bandar,
count(*) as jumlah_pelanggan
from pelanggan
group by bandar 
order by jumlah_pelanggan ;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--table 1 : Create table Baru : Transaksi  & produk
drop table produk;
CREATE TABLE produk (
    ID SERIAL PRIMARY KEY,
    Nama_Produk VARCHAR(100),
    Kategori VARCHAR(50),
    Harga DECIMAL(10,2),
    Stok INT
);

INSERT INTO produk (Nama_Produk, Kategori, Harga, Stok) VALUES
('Laptop Dell', 'Elektronik', 3500.00, 10),
('iPhone 15', 'Telefon', 5200.00, 5),
('Monitor 27 inci', 'Elektronik', 1200.00, 15),
('Keyboard Gaming', 'Aksesori', 250.00, 30),
('Tetikus Logitech', 'Aksesori', 150.00, 20),
('AirPods', 'Aksesori', 800.00, 10),
('Samsung S23', 'Telefon', 4800.00, 8);


--table 2: transaksi (Simpan data pembelian pelanggan)
drop table transaksi;
CREATE TABLE transaksi (
    ID SERIAL PRIMARY KEY,
    ID_Produk INT,
    ID_Pelanggan INT,
    Kuantiti INT,
    Tarikh_Transaksi DATE,
    Harga_Total DECIMAL(10,2),
    Status VARCHAR(50),
    FOREIGN KEY (ID_Produk) REFERENCES produk(ID)
);

INSERT INTO transaksi (ID_Produk, ID_Pelanggan, Kuantiti, Tarikh_Transaksi, Harga_Total, Status) VALUES
(1, 101, 1, '2024-02-01', 3500.00, 'Selesai'),
(2, 102, 2, '2024-02-02', 10400.00, 'Selesai'),
(3, 103, 1, '2024-02-03', 1200.00, 'Selesai'),
(4, 104, 3, '2024-02-04', 750.00, 'Pending'),
(5, 105, 1, '2024-02-05', 150.00, 'Selesai'),
(6, 106, 1, '2024-02-06', 800.00, 'Pending'),
(7, 107, 2, '2024-02-07', 9600.00, 'Selesai'),
(1, 108, 1, '2024-02-08', 3500.00, 'Refunded'),
(3, 109, 2, '2024-02-09', 2400.00, 'Selesai');

select *
from produk;

select*
from transaksi;

--cari transaksi yang pending
select *
from transaksi
where status ='Pending';

--Hapuskan transaksi yang 'Refunded'
delete from transaksi
where status = 'Refunded';

--Update transaksi "Pending" supaya jadi "Selesai" selepas 3 hari
update transaksi
set status='Selesai'
where status = 'Pending' and tarikh_transaksi < current_date - interval '3 days';

--susun produk ikut harga dari mahal ke murah
select *
from produk
order by harga desc;

--susun transaksi ikut tarikh yang terbaru ke lama
select *
from transaksi
order by tarikh_transaksi desc;

--Cari 3 transaksi dengan jumlah tertinggi
select *
from transaksi
order by harga_total desc
limit 3;

--Kira berapa jumlah produk dalam setiap kategori
select kategori, 
count(*) as jumlah_produk
from produk
group by kategori ;

--Kira berapa banyak jualan (total revenue) yang dah dibuat
select sum(harga_total) as Jumlah_jualan
from transaksi
where status ='Selesai';

--Cari produk yang paling banyak dibeli (berdasarkan jumlah kuantiti transaksi)
select id_produk,
sum(kuantiti) as Jumlah_terjual
from transaksi
group by id_produk 
order by jumlah_terjual desc
limit 1;

--Kira jumlah transaksi yang dibuat oleh setiap pelanggan
select id_pelanggan,
count(tarikh_transaksi) as jumlah_transaksi
from transaksi
group by id_pelanggan ;

--Padam produk yang tiada stok
delete from produk where stok = 0;

--Update harga produk yang terlalu murah (bawah RM200) supaya jadi RM200 minimum
update produk
set harga = 200.00
where harga< 200.00;

--Buang transaksi yang duplicate (ID_Pelanggan, ID_Produk, Tarikh_Transaksi sama)
delete from transaksi 
where id not in(
select min(id)
from transaksi
group by id_produk, id_pelanggan, tarikh_transaksi
);

--Cari transaksi dalam bulan ini sahaja
select *
from transaksi
where 
extract(month from tarikh_transaksi) = extract (month from current_date)
and 
extract (year from tarikh_transaksi) = extract (year from current_date);

--Susun pelanggan berdasarkan jumlah belanja tertinggi
select id_produk, 
sum(harga_total) as jumlah_belanja
from transaksi
group by id_produk
order by jumlah_belanja desc;

--JOINS
--Gabungkan transaksi dengan nama produk (union)
select t.ID, p.nama_produk, p.kategori, t.kuantiti, t.tarikh_transaksi, t.status
from transaksi t
join produk p 
on t.id=p.id;

--Cari produk yang paling banyak terjual bersama jumlah unit terjual
select p.nama_produk, sum(t.kuantiti) as total_terjual
from transaksi t
join produk p on t.id=p.id
group by p.nama_produk
order by total_terjual desc 
limit 1;

--WINDOWS FUNCTIONS
--Tentukan ranking produk ikut jumlah unit terjual
select p.nama_produk, sum(t.kuantiti) as total_terjual,
rank() over(order by sum(t.kuantiti) desc) as rank
from transaksi t
join produk p
on t.id=p.id
group by p.nama_produk;

--Kira jumlah jualan bulan ini & banding dengan bulan lepas
--EXTRACT() ialah fungsi dalam SQL yang digunakan untuk mengambil bahagian tertentu daripada tarikh atau masa, contohnya bulan, tahun, hari, jam, minit, saat dan sebagainya.
WITH Sales_Monthly AS (
    SELECT 
        EXTRACT(MONTH FROM Tarikh_Transaksi) AS Bulan, 
        EXTRACT(YEAR FROM Tarikh_Transaksi) AS Tahun, 
        SUM(Harga_Total) AS Jumlah_Jualan
    FROM transaksi
    WHERE Status = 'Selesai'
    GROUP BY Bulan, Tahun
)
SELECT *, 
LAG(Jumlah_Jualan) OVER (ORDER BY Tahun, Bulan) AS Jualan_Bulan_Lepas,
(Jumlah_Jualan - LAG(Jumlah_Jualan) OVER (ORDER BY Tahun, Bulan)) AS Perubahan_Jualan
FROM Sales_Monthly;

