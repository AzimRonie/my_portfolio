-- Create the TabelPendaftaranSekolah (SchoolRegistration) table with constraints
CREATE TABLE PendaftaranSekolah (
    no_registrasi SERIAL PRIMARY KEY,
    NamaSiswa VARCHAR(50) NOT NULL,
    JenisKelamin VARCHAR(10) NOT NULL CHECK (JenisKelamin IN ('Laki-laki', 'Perempuan')), -- L / P
    TanggalLahir DATE NOT NULL,
    Alamat VARCHAR(100) NOT NULL,
    NilaiUjian FLOAT NOT NULL CHECK (NilaiUjian >= 0 AND NilaiUjian <= 100)
);

-- Insert 10 rows of fake data into the TabelPendaftaranSekolah table
INSERT INTO PendaftaranSekolah (NamaSiswa, JenisKelamin, TanggalLahir, Alamat, NilaiUjian)
VALUES
    ('Andi', 'Laki-laki', '2010-03-15', 'Jl. Merdeka No. 123', 87.5),
    ('Siti', 'Perempuan', '2011-05-20', 'Jl. Cendrawasih No. 45', 92.0),
    ('Rudi', 'Laki-laki', '2009-11-10', 'Jl. Pahlawan No. 67', 78.5),
    ('Lina', 'Perempuan', '2010-08-25', 'Jl. Diponegoro No. 89', 94.5),
    ('Budi', 'Laki-laki', '2011-02-18', 'Jl. Kartini No. 12', 85.0),
    ('Rina', 'Perempuan', '2009-09-05', 'Jl. Sudirman No. 56', 91.5),
    ('Adi', 'Laki-laki', '2010-07-12', 'Jl. Gajah Mada No. 34', 89.0),
    ('Dewi', 'Perempuan', '2011-04-03', 'Jl. Veteran No. 78', 93.5),
    ('Eko', 'Laki-laki', '2009-12-28', 'Jl. Imam Bonjol No. 56', 77.0),
    ('Linda', 'Perempuan', '2010-06-07', 'Jl. Panglima Sudirman No. 23', 100);

-- cek hasil insert   
select *
from pendaftaransekolah
order by namasiswa;

-- hapus tabel
drop table pendaftaransekolah ;
