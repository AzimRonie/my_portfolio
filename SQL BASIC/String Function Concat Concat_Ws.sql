--fungsi concat, concat_ws dia nak gabung string je sebenarnya, xdak apa la sngt
-- CONCAT sederhana

select CONCAT('Anas',' ','Wicaksono',' ','wkkwwkkw');


-- Create Users table
CREATE TABLE registration (
    user_id INT PRIMARY KEY,
    salutation VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country_code VARCHAR(2),
    address VARCHAR(255),
    post_code VARCHAR(10),
    state_name VARCHAR(50),
    phone_number VARCHAR(15),
    country_phone_code VARCHAR(5)
);

-- Insert sample data into the Users table
INSERT INTO registration (user_id, salutation, first_name, last_name, country_code, address, post_code, state_name, phone_number, country_phone_code) VALUES
(1, 'Mr.', 'Budi', 'Santoso', 'ID', 'Jl. Sudirman No. 123', '10110', 'Jakarta', '81234567890', '+62'),
(2, 'Ms.', 'Linda', 'Wijaya', 'ID', 'Jl. Kebon Sirih No. 45', '10120', 'Jakarta', '87654321098', '+62'),
(3, 'Mr.', 'Ahmad', 'Ibrahim', 'ID', 'Jl. Gajah Mada No. 67', '60271', 'Surabaya', '81112233445', '+62'),
(4, 'Ms.', 'Siti', 'Nurlela', 'ID', 'Jl. Pahlawan No. 89', '65145', 'Malang', '82334455667', '+62'),
(5, 'Mr.', 'Dewi', 'Kusuma', 'ID', 'Jl. Diponegoro No. 101', '56126', 'Yogyakarta', '81998877665', '+62'),
(6, 'Ms.', 'Agus', 'Hermawan', 'ID', 'Jl. A. Yani No. 33', '40112', 'Bandung', '87711223344', '+62'),
(7, 'Mr.', 'Rina', 'Wulandari', 'ID', 'Jl. Gatot Subroto No. 55', '80232', 'Denpasar', '81776655443', '+62'),
(8, 'Ms.', 'Eko', 'Saputra', 'ID', 'Jl. Cempaka Putih No. 21', '50132', 'Semarang', '89998877655', '+62'),
(9, 'Mr.', 'Nina', 'Suryadi', 'ID', 'Jl. Pemuda No. 77', '80115', 'Bali', '87788996633', '+62'),
(10, 'Ms.', 'Hendri', 'Gunawan', 'ID', 'Jl. Merdeka No. 123', '60175', 'Surakarta', '81234567890', '+62');


-- cek hasil insert
select *
from registration;

-- concat for salutation + first_name + last_name
select concat(salutation,' ',first_name,' ',last_name) as full_name
from registration;

-- concat_ws for complete address
select concat_ws(', ',address, state_name, post_code, country_code) as full_address
from registration;

-- concat free text + kolom
select concat('Pelanggan bernama ',first_name,' ',last_name,' ', 'tinggal di Kota ',state_name)
from registration;

-- concat country_phone_code + phone_number
select concat(country_phone_code,phone_number) as mobile_number
from registration;

-- drop table
drop table registration;
