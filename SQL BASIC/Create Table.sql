-- membuat tabel bernama StudentProfile
--Create table table_name(
--column1 datatype
--column2 datatype
--)
CREATE TABLE profil_siswa (
    no_siswa INT PRIMARY KEY, -- no induk siswa, berperan sebagai primary key, sifatnya unik dan tidak boleh kosong
    nama_lengkap VARCHAR(50), -- nama depan, varchar hingga 50 karakter
    tanggal_lahir DATE, -- tanggal lahir
    jenis_kelamin CHAR(1), -- jenis kelamin 'L' untuk laki-laki , 'P' untuk perempuan
    email VARCHAR(100) UNIQUE, -- alamat email, varchar hingga 100 karakter, unik
    no_telp VARCHAR(15), -- no hp, varchar hingga 15 digit
    alamat TEXT, -- alamat, text, bebas 
    indeks_prestasi_kumulatif DECIMAL(3, 2), -- bisa menyimpan 3 digit, range GPA antara 0.00 s.d. 4.00 
    waktu_pendaftaran TIMESTAMP, -- format yyyy-mm-dd hh:mm:ss , untuk MySQL menggunakan data type DATETIME
    is_active BOOLEAN -- true or false , untuk melabeli murid tersebut aktif atau tidak
);

-- menginsert data ke dalam tabel StudentProfile 

INSERT INTO profil_siswa (
	no_siswa,
	nama_lengkap,
	tanggal_lahir,
	jenis_kelamin,
	email,
	no_telp,
	alamat,
	indeks_prestasi_kumulatif,
	waktu_pendaftaran,
	is_active)
VALUES
    (1, 'Abd Azim', '1993-12-25','L','matcencen@gmail.com','08111222333','jalan aneka satwa','3.99','2023-09-09 00:00:00','TRUE'),
    (2, 'Mat Jubo', '1993-12-25','L','matjubo@gmail.com','081112223432','jalan aneka satwa','3.99','2023-09-09 00:00:00','TRUE'),
    (3, 'Jerih', '1993-12-25','L','jerih@gmail.com','08111225869','jalan aneka satwa','3.99','2023-09-09 00:00:00','TRUE')
    
-- cek hasil insert 
   
select *
from profil_siswa ;

-- DROP TABLE jika sudah tidak diperlukan
drop table profil_siswa ;
