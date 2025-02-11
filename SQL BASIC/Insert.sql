CREATE TABLE mahasiswa (
    id_mahasiswa serial PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(50),
    angkatan INT NOT NULL
);

select *
from mahasiswa;


-- basic syntax

insert into table_name (column1, column2, column3, ....)
values (values1, values2, values3,....)

-- INSERT satu baris
INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, angkatan)
VALUES (1, 'Budi Santoso', 'Teknik Informatika', 2022);

select *
from mahasiswa;

-- INSERT value / nilai ke semua kolom tanpa menyebut nama kolom
INSERT INTO mahasiswa
VALUES (2, 'Siti Aminah', 'Sistem Informasi', 2021);

-- insert value tidak untuk semua kolom (anggap saja jurusannya kosong)
INSERT INTO mahasiswa (id_mahasiswa, nama, angkatan)
VALUES (3, 'Slamet Budianto',  2022);

-- insert value yang menghasilkan error ?
INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, angkatan)
VALUES (4, 'Papirus Sativa',  'Teknik Pangan', 2024);


-- insert value untuk banyak baris sekaligus
INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, angkatan)
VALUES 
    (5, 'Dewi Tridharma', 'Teknik Mesin', 2023),
    (6, 'Rian Piccolo', 'Teknik Elektro', 2021),
    (7, 'Putri Maharani', 'Kedokteran', 2023);

select * from mahasiswa;
-- drop table jika table sudah tidak digunakan
drop table mahasiswa;
