CREATE DATABASE BookingSystem;
go
use BookingSystem
go
CREATE TABLE Venue (
    venue_id Numeric(3) PRIMARY KEY,
    venue_name VARCHAR(10),
    address VARCHAR(20)
);
CREATE TABLE Event (
    event_id Numeric(3) PRIMARY KEY,
    event_name VARCHAR(20),
    event_date DATE,                           
    event_time TIME,                           
    venue_id Numeric(3),                                       
    total_seats Numeric(3),
    available_seats Numeric(3),
    ticket_price Numeric(4),
    event_type VARCHAR(20),
    booking_id Numeric(5),
	CONSTRAINT chk_event_type CHECK (event_type IN ('Movie', 'Sports', 'Concert'))
);
ALTER TABLE event
ALTER COLUMN total_seats NUMERIC(5);
CREATE TABLE Customer (
    customer_id Numeric(10) PRIMARY KEY,
    customer_name VARCHAR(20) NOT NULL,
    email VARCHAR(15) NOT NULL,
    phone_number Numeric(10),
    booking_id Numeric(5)
);

CREATE TABLE Booking (
    booking_id Numeric(5) PRIMARY KEY,
    customer_id Numeric(10),
    event_id Numeric(3),
    num_tickets numeric(1),
    total_cost DECIMAL(10,2),
    booking_date DATETIME DEFAULT GETDATE()
);
ALTER TABLE Booking
ALTER COLUMN num_tickets NUMERIC(3);
ALTER TABLE Event
ADD CONSTRAINT fk_booking_event FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Event
ADD CONSTRAINT fk_venue FOREIGN KEY (venue_id) REFERENCES Venue(venue_id);

ALTER TABLE Customer
ADD CONSTRAINT fk_booking_customer FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Booking
ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE Booking
ADD CONSTRAINT fk_event FOREIGN KEY (event_id) REFERENCES Event(event_id);

INSERT INTO Venue (venue_id, venue_name, address) VALUES
(1, 'AB', '123 Main St'),
(2, 'BC', '456 Main St'),
(3, 'CD', '789 Main St'),
(4, 'DE', '135 Main St'),
(5, 'EF', '246 Main St'),
(6, 'FG', '357 Main St'),
(7, 'GH', '468 Main St'),
(8, 'HI', '579 Main St'),
(9, 'IJ', '680 Main St'),
(10, 'JK', '791 MainSt');

select * from venue

INSERT INTO Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) VALUES
(11, 'Devara', '2024-10-01', '18:00:00', 1, 1000, 563, 100.00, 'Movie', 101),
(12, 'KL RAhul', '2024-10-02', '20:00:00', 2, 5000, 200, 1500.00, 'Sports', 102),
(13, 'Thaman Concert', '2024-10-03', '19:00:00', 3, 4000, 150, 2500.00, 'Concert', 103),
(14, 'RRR', '2024-10-04', '21:00:00', 4, 1800, 120, 200.00, 'Movie', 104),
(15, 'Music Concert', '2024-10-01', '15:00:00', 5, 90, 80, 500.00, 'Concert', 105),
(16, 'Dhoni CUP', '2024-10-06', '18:30:00', 6, 100, 50, 3000.00, 'Sports', 106),
(17, 'Thupaki', '2024-10-03', '17:00:00', 7, 500, 250, 1200.00, 'Movie', 107),
(18, 'DSP', '2024-10-08', '16:00:00', 8, 300, 30, 4000.00, 'Concert', 108),
(19, 'Bhuvi', '2024-10-05', '19:30:00', 9, 1100, 0, 1800.00, 'Sports', 109),
(20, 'Beast', '2024-10-7', '10:00:00', 10, 700, 7, 300.00, 'Movie', 110);

INSERT INTO Customer (customer_id, customer_name, email, phone_number, booking_id) VALUES
(1001, 'Arjun', 'Arjun@gmail.com', 9234567890,NULL),
(1002, 'Balu', 'balu@gmail.com', 8345678901,NULL),
(1003, 'Charan', 'char@gmail.com', 7456789012,NULL),
(1004, 'Damod', 'damo@gmail.com', 4567890123, NULL),
(1005, 'Eswar', 'esw@gmail.com', 7678901234, NULL),
(1006, 'Fhani', 'fhani@gmail.com', 6712342345, NULL),
(1007, 'Ganesh', 'Gani@gmail.com', 7878953456, NULL),
(1008, 'Harsha', 'har@gmail.com', 8901234567,NULL),
(1009, 'Iswarya', 'isw@gmail.com', 9789456178,NULL),
(1010, 'Jashu', 'jash@gmail.com', 9754455210,NULL);

UPDATE Customer
SET phone_number = 9000567896
WHERE customer_id = 1001;

INSERT INTO Booking (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(101, 1001, NULL, 20,0.00, GETDATE()),
(102, 1002, NULL, 40,60.00, GETDATE()),
(103, 1003, NULL, 10 ,5.00, GETDATE()),
(104, 1004, NULL, 30,60.00, GETDATE()),
(105, 1005, NULL, 50,25.00, GETDATE()),
(106, 1006, NULL, 20,60.00, GETDATE()),
(107, 1007, NULL, 10,12.00, GETDATE()),
(108, 1008, NULL, 35,20.00, GETDATE()),
(109, 1009, NULL, 27,36.00, GETDATE()),
(110, 1010, Null, 43,12.00, GETDATE());

UPDATE Customer
SET booking_id = 101
WHERE customer_id = 1001;

UPDATE Customer
SET booking_id = 102
WHERE customer_id = 1002;

UPDATE Customer
SET booking_id =103
WHERE customer_id = 1003;

UPDATE Customer
SET booking_id = 104
WHERE customer_id = 1004;

UPDATE Customer
SET booking_id = 105
WHERE customer_id = 1005;

UPDATE Customer
SET booking_id =106
WHERE customer_id =1006;

UPDATE Customer
SET booking_id = 107
WHERE customer_id = 1007;

UPDATE Customer
SET booking_id = 108
WHERE customer_id = 1008;

UPDATE Customer
SET booking_id = 109
WHERE customer_id = 1009;

UPDATE Customer
SET booking_id =110
WHERE customer_id =1010;

UPDATE Booking
SET event_id = 11
WHERE booking_id = 101;

UPDATE Booking
SET event_id = 12
WHERE booking_id = 102;

UPDATE Booking
SET event_id = 13
WHERE booking_id = 103;

UPDATE Booking
SET event_id = 14
WHERE booking_id = 104;
UPDATE Booking
SET event_id = 15
WHERE booking_id = 105;

UPDATE Booking
SET event_id = 16
WHERE booking_id = 106;

UPDATE Booking
SET event_id = 17
WHERE booking_id = 107;

UPDATE Booking
SET event_id = 18
WHERE booking_id = 108;

UPDATE Booking
SET event_id = 19
WHERE booking_id = 109;

UPDATE Booking
SET event_id = 20
WHERE booking_id = 110;

