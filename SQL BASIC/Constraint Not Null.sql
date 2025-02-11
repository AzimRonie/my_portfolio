-- Create the flight_reservation table
CREATE TABLE flight_reservation (
    ReservationID INT PRIMARY KEY, -- id pemesanan tiket
    PassengerName VARCHAR(50) NOT NULL, -- nama penumpang
    FlightNumber VARCHAR(10) NOT NULL, -- nomor penerbangan
    DepartureDate TIMESTAMP NOT NULL, -- tanggal dan jam keberangkatan
    departure_airport VARCHAR(50) NOT NULL, -- airport keberangkatan
    ArrivalDate TIMESTAMP NOT NULL, -- tanggal dan jam kedatangan
    arrival_airport VARCHAR(50) NOT NULL, -- airport kedatangan
    SeatNumber VARCHAR(10) NOT NULL, -- nomor tempat duduk
    airline VARCHAR(50) NOT NULL, -- nama maskapai
    payment_method VARCHAR(50) NOT NULL, -- metode pembayaran
    additional_service VARCHAR(50), -- layanan tambahan yang diinginkan (tidak wajib)
    travel_insurance VARCHAR(3) , -- asuransi perjalanan (tidak wajib) , ada atau tidak
    seat_preference VARCHAR(50) , -- preferensi tempat duduk (aisle or window seat)
    frequent_flyer_id VARCHAR(20) -- nomor member untuk frequent flyer
);

-- Insert 20 rows of data into the flight_reservation table
INSERT INTO flight_reservation (ReservationID, PassengerName, FlightNumber, DepartureDate, departure_airport, ArrivalDate, arrival_airport, SeatNumber, airline, payment_method, additional_service, travel_insurance, seat_preference, frequent_flyer_id)
VALUES
    (1, 'John Doe', 'AA123', '2023-10-15 10:00:00', 'JFK', '2023-10-16 14:30:00', 'LAX', 'A1', 'American Airlines', 'Credit Card', 'Priority Boarding', 'Yes', 'Aisle', 'FF12345'),
    (2, 'Jane Smith', 'DL456', '2023-10-20 08:45:00', 'ATL', '2023-10-21 12:15:00', 'ORD', 'B3', 'Delta Airlines', 'PayPal', 'In-Flight Meal', 'No', 'Window', 'FF98765'),
    (3, 'Michael Johnson', 'UA789', '2023-10-25 14:30:00', 'SFO', '2023-10-26 18:00:00', 'SEA', 'C2', 'United Airlines', 'Debit Card', 'Extra Legroom', 'Yes', 'Aisle', NULL),
    (4, 'Emily Brown', 'AA123', '2023-11-01 09:30:00', 'LAX', '2023-11-02 12:00:00', 'JFK', 'D4', 'American Airlines', 'Credit Card', 'In-Flight Entertainment', 'No', 'Window', 'FF54321'),
    (5, 'David Lee', 'DL456', '2023-11-05 11:15:00', 'ORD', '2023-11-06 15:45:00', 'ATL', 'E5', 'Delta Airlines', 'PayPal', 'Extra Baggage', 'Yes', 'Aisle', 'FF78901'),
    (6, 'Sarah Wilson', 'UA789', '2023-11-10 13:45:00', 'SEA', '2023-11-11 17:30:00', 'SFO', 'F6', 'United Airlines', 'Debit Card', 'Priority Boarding', 'No', 'Window', NULL),
    (7, 'Lisa Taylor', 'AA123', '2023-11-15 07:00:00', 'JFK', '2023-11-16 10:30:00', 'LAX', 'G7', 'American Airlines', 'Credit Card', 'In-Flight Meal', 'Yes', 'Aisle', 'FF24680'),
    (8, 'Robert White', 'DL456', '2023-11-20 15:30:00', 'ATL', '2023-11-21 19:15:00', 'ORD', 'H8', 'Delta Airlines', 'PayPal', 'Extra Legroom', 'No', 'Window', 'FF13579'),
    (9, 'Jessica Davis', 'UA789', '2023-11-25 08:00:00', 'SFO', '2023-11-26 11:45:00', 'SEA', 'I9', 'United Airlines', 'Debit Card', 'In-Flight Entertainment', 'Yes', 'Aisle', 'FF11223'),
    (10, 'Daniel Martinez', 'AA123', '2023-12-01 12:30:00', 'LAX', '2023-12-02 16:15:00', 'JFK', 'J10', 'American Airlines', 'Credit Card', 'Extra Baggage', 'No', 'Window', 'FF99887'),
    (11, 'Olivia Brown', 'DL456', '2023-12-05 17:15:00', 'ORD', '2023-12-06 20:45:00', 'ATL', 'K11', 'Delta Airlines', 'PayPal', 'In-Flight Meal', 'Yes', 'Aisle', 'FF65432'),
    (12, 'William Johnson', 'UA789', '2023-12-10 09:45:00', 'SEA', '2023-12-11 13:30:00', 'SFO', 'L12', 'United Airlines', 'Debit Card', 'Priority Boarding', 'No', 'Window', NULL),
    (13, 'Sophia Smith', 'AA123', '2023-12-15 11:30:00', 'JFK', '2023-12-16 15:00:00', 'LAX', 'M13', 'American Airlines', 'Credit Card', 'In-Flight Entertainment', 'Yes', 'Aisle', 'FF97531'),
    (14, 'James Lee', 'DL456', '2023-12-20 14:00:00', 'ATL', '2023-12-21 17:45:00', 'ORD', 'N14', 'Delta Airlines', 'PayPal', 'Extra Legroom', 'No', 'Window', 'FF65489'),
    (15, 'Ella Wilson', 'UA789', '2023-12-25 08:30:00', 'SFO', '2023-12-26 12:15:00', 'SEA', 'O15', 'United Airlines', 'Debit Card', 'In-Flight Meal', 'Yes', 'Aisle', 'FF88776'),
    (16, 'Liam Davis', 'AA123', '2024-01-01 10:15:00', 'LAX', '2024-01-02 13:45:00', 'JFK', 'P16', 'American Airlines', 'Credit Card', 'Extra Baggage', 'No', 'Window', 'FF45678'),
    (17, 'Ava Martinez', 'DL456', '2024-01-05 14:45:00', 'ORD', '2024-01-06 18:30:00', 'ATL', 'Q17', 'Delta Airlines', 'PayPal', 'Priority Boarding', 'Yes', 'Aisle', 'FF11223'),
    (18, 'Noah Taylor', 'UA789', '2024-01-10 07:00:00', 'SEA', '2024-01-11 10:30:00', 'SFO', 'R18', 'United Airlines', 'Debit Card', 'In-Flight Entertainment', 'No', 'Window', 'FF98765'),
    (19, 'Isabella Wilson', 'AA123', '2024-01-15 15:30:00', 'JFK', '2024-01-16 19:15:00', 'LAX', 'S19', 'American Airlines', 'Credit Card', 'In-Flight Meal', 'Yes', 'Aisle', 'FF54321'),
    (20, 'Mason Brown', 'DL456', '2024-01-20 08:00:00', 'ATL', '2024-01-21 11:45:00', 'ORD', 'T20', 'Delta Airlines', 'PayPal', 'Extra Legroom', 'No', 'Window', 'FF78901');

-- cek hasil create table dan insert
select *
from flight_reservation ;

-- test insert data null

INSERT INTO flight_reservation (ReservationID, PassengerName, FlightNumber, DepartureDate, departure_airport, ArrivalDate, arrival_airport, SeatNumber, airline, payment_method, additional_service, travel_insurance, seat_preference, frequent_flyer_id)
VALUES
    (21, NULL, 'AA123', '2023-10-15 10:00:00', 'JFK', '2023-10-16 14:30:00', 'LAX', 'A1', 'American Airlines', 'Credit Card', 'Priority Boarding', 'Yes', 'Aisle', 'FF12345');
    
-- hapus tabel
drop table flight_reservation ;
