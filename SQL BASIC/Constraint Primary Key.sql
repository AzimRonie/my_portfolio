-- create table dengan constraint PRIMARY KEY
CREATE TABLE customer_complaint (
    ticket_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(50),
    complaint_channel VARCHAR(50),
    ticket_date TIMESTAMP,
    category VARCHAR(100),
    ticket_details TEXT
);

-- insert data
INSERT INTO customer_complaint (ticket_id, product_name, complaint_channel, ticket_date, category, ticket_details)
VALUES
    ('TICKET001', 'Smartphone', 'Email', '2023-10-01 10:15:00', 'Technical Issue', 'My smartphone is not charging properly.'),
    ('TICKET002', 'Laptop', 'Phone', '2023-10-02 14:30:00', 'Software Problem', 'I am having trouble with software updates on my laptop.'),
    ('TICKET003', 'Tablet', 'Chat', '2023-10-03 11:20:00', 'Hardware Issue', 'The screen on my tablet is cracked.'),
    ('TICKET004', 'Smart TV', 'Email', '2023-10-04 09:45:00', 'Connection Problem', 'My smart TV cant connect to the internet.'),
    ('TICKET005', 'Washing Machine', 'Phone', '2023-10-05 16:55:00', 'Appliance Repair', 'My washing machine is making a strange noise.'),
    ('TICKET006', 'Refrigerator', 'Chat', '2023-10-06 13:10:00', 'Appliance Repair', 'The refrigerator is not cooling properly.'),
    ('TICKET007', 'Smartphone', 'Email', '2023-10-07 17:30:00', 'Technical Issue', 'I am experiencing issues with my smartphone camera.'),
    ('TICKET008', 'Laptop', 'Phone', '2023-10-08 12:05:00', 'Hardware Issue', 'The keyboard on my laptop is not working.'),
    ('TICKET009', 'Tablet', 'Chat', '2023-10-09 08:40:00', 'Software Problem', 'I am unable to install new apps on my tablet.'),
    ('TICKET010', 'Smart TV', 'Email', '2023-10-10 15:25:00', 'Connection Problem', 'The smart TV remote is not working properly.');

-- cek hasil insert 
select *
from customer_complaint;

-- cek apakah PRIMARY KEY bersifat UNIQUE
INSERT INTO customer_complaint (ticket_id, product_name, complaint_channel, ticket_date, category, ticket_details)
VALUES
    ('TICKET013', 'Smartphone', 'Email', '2023-10-01 10:15:00', 'Technical Issue', 'My smartphone is not charging properly.')

-- cek apakah PRIMARY KEY bersifat NOT NULL
INSERT INTO customer_complaint (ticket_id, product_name, complaint_channel, ticket_date, category, ticket_details)
VALUES
    ('TICKET012', NULL, 'Email', '2023-10-01 10:15:00', 'Technical Issue', 'My smartphone is not charging properly.')
    
    
-- drop tabel

drop table customer_complaint ;
