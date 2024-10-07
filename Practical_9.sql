#Normalization
create database hms;
use hms;
#Not in 1NF
CREATE TABLE HotelReservations (
    ReservationID INT PRIMARY KEY,
    GuestName VARCHAR(255),
    CheckInDate DATE,
    CheckOutDate DATE,
    RoomNumbers VARCHAR(255),
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO HotelReservations (ReservationID,GuestName, CheckInDate, CheckOutDate, RoomNumbers, TotalAmount)
VALUES
( 1,'Pranav Pathekar', '2023-11-06', '2023-11-09', '101,102', 200.00),
(2,'Ritesh Upate', '2023-11-08', '2023-11-12', '201,202', 300.00),
(3,'Pranali Pachkawde', '2023-11-10', '2023-11-14', '301,302', 400.00),
(4,'Martin Guptil', '2023-11-12', '2023-11-16', '401,402', 500.00),
(5,'Bruce Wayne', '2023-11-14', '2023-11-18', '501,502', 600.00);

select * from hotelreservations;

#in 1NF
CREATE TABLE HotelReservations1NF (
    ReservationID INT PRIMARY KEY,
    GuestName VARCHAR(255),
    CheckInDate DATE,
    CheckOutDate DATE,
    RoomNumber INT,
    TotalAmount DECIMAL(10, 2)
);
INSERT INTO HotelReservations1NF ( ReservationID,GuestName, CheckInDate, CheckOutDate, RoomNumber, TotalAmount)
VALUES
(1,'Pranav Pathekar', '2023-11-06', '2023-11-09', 101, 200.00),
(1,'Pranav Pathekar', '2023-11-06', '2023-11-09', 102, 200.00),
(2,'Ritesh Upate', '2023-11-08', '2023-11-12', 201, 300.00),
(2,'Ritesh Upate', '2023-11-08', '2023-11-12', 202, 300.00),
(3,'Pranali Pachkawde', '2023-11-10', '2023-11-14', 301, 400.00),
(3,'Pranali Pachkawde', '2023-11-10', '2023-11-14', 302, 400.00),
(4,'Martin Guptil', '2023-11-12', '2023-11-16', 401, 500.00),
(4,'Martin Guptil', '2023-11-12', '2023-11-16', 402, 500.00),
(5,'Bruce Wayne', '2023-11-14', '2023-11-18', 501, 600.00),
(5,'Bruce Wayne', '2023-11-14', '2023-11-18', 502, 600.00);

ALTER TABLE HotelReservations1NF modify ReservationID INT NOT NULL;
ALTER TABLE HotelReservations1NF DROP PRIMARY KEY;

select * from hotelreservations1NF;

#2NF

CREATE TABLE HotelBookings (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    GuestName VARCHAR(255),
    RoomNumber INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    RoomType VARCHAR(50),
    Rate DECIMAL(10, 2)
);

-- Insert values into the HotelBookings table (not in 2NF)
INSERT INTO HotelBookings (BookingID, GuestID, GuestName, RoomNumber, CheckInDate, CheckOutDate, RoomType, Rate)
VALUES
    (1, 101, 'Pranav Pathekar', 101, '2023-11-10', '2023-11-15', 'Standard', 100.00),
    (2, 102, 'Pranav Ikahr', 102, '2023-11-12', '2023-11-14', 'Deluxe', 150.00),
    (3, 103, 'Ritesh Upate', 103, '2023-11-20', '2023-11-25', 'Standard', 100.00),
    (4, 104, 'Mike Tyson', 102, '2023-11-18', '2023-11-22', 'Deluxe', 150.00),
    (5, 105, 'Ram Sharma', 105, '2023-11-15', '2023-11-19', 'Suite', 200.00);

select * from HotelBookings;

#in 2NF
CREATE TABLE Rooms (
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(50),
    Rate DECIMAL(10, 2)
);

CREATE TABLE HotelBookings2NF (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    GuestName VARCHAR(255),
    RoomNumber INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber)
);

-- Insert values into the Rooms table (2NF)
INSERT INTO Rooms (RoomNumber, RoomType, Rate)
VALUES
    (101, 'Standard', 100.00),
    (102, 'Deluxe', 150.00),
    (103, 'Standard', 100.00),
    (104, 'Deluxe', 150.00),
    (105, 'Suite', 200.00);

-- Insert values into the HotelBookings2NF table (2NF)
INSERT INTO HotelBookings2NF (BookingID, GuestID, GuestName, RoomNumber, CheckInDate, CheckOutDate)
VALUES
    (1, 101, 'Pranav Pathekar', 101, '2023-11-10', '2023-11-15'),
    (2, 102, 'Pranav Ikahr', 102, '2023-11-12', '2023-11-14'),
    (3, 103, 'Ritesh Upate', 103, '2023-11-20', '2023-11-25'),
    (4, 104, 'Mike Tyson', 102, '2023-11-18', '2023-11-22'),
    (5, 105, 'Ram Sharma', 105, '2023-11-15', '2023-11-19');
    
    
select * from Rooms;
select * from HotelBookings2NF;

#3NF not

CREATE TABLE ReservationsGuests (
    ReservationID INT PRIMARY KEY,
    GuestID INT,
    RoomNumber INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    GuestName VARCHAR(255),
    GuestCountry VARCHAR(50),
    GuestCity VARCHAR(50)
);

-- Insert values into the initial combined table (not in 3NF)
INSERT INTO ReservationsGuests (ReservationID, GuestID, RoomNumber, CheckInDate, CheckOutDate, GuestName, GuestCountry, GuestCity)
VALUES
    (1, 101, 201, '2023-11-10', '2023-11-15', 'John Doe', 'USA', 'New York'),
    (2, 102, 202, '2023-11-12', '2023-11-14', 'Jane Smith', 'Canada', 'Toronto'),
    (3, 103, 203, '2023-11-20', '2023-11-25', 'Alice Johnson', 'UK', 'London'),
    (4, 104, 204, '2023-11-18', '2023-11-22', 'Mike Wilson', 'France', 'Paris'),
    (5, 105, 205, '2023-11-15', '2023-11-19', 'Sarah Lee', 'Germany', 'Berlin');
    
    select * from ReservationsGuests;
    #in 3NF
    
    CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    GuestID INT,
    RoomNumber INT,
    CheckInDate DATE,
    CheckOutDate DATE
);

-- Insert values into the Reservations table
INSERT INTO Reservations (ReservationID, GuestID, RoomNumber, CheckInDate, CheckOutDate)
VALUES
    (1, 101, 201, '2023-11-10', '2023-11-15'),
    (2, 102, 202, '2023-11-12', '2023-11-14'),
    (3, 103, 203, '2023-11-20', '2023-11-25'),
    (4, 104, 204, '2023-11-18', '2023-11-22'),
    (5, 105, 205, '2023-11-15', '2023-11-19');

select * from Reservations;

CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    GuestName VARCHAR(255)
);
-- Insert values into the Guests table
INSERT INTO Guests (GuestID, GuestName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Alice Johnson'),
    (104, 'Mike Wilson'),
    (105, 'Sarah Lee');

select * from Guests;

CREATE TABLE GuestLocations (
    GuestID INT PRIMARY KEY,
    GuestCountry VARCHAR(50),
    GuestCity VARCHAR(50)
);
-- Insert values into the GuestLocations table
INSERT INTO GuestLocations (GuestID, GuestCountry, GuestCity)
VALUES
    (101, 'USA', 'New York'),
    (102, 'Canada', 'Toronto'),
    (103, 'UK', 'London'),
    (104, 'France', 'Paris'),
    (105, 'Germany', 'Berlin');
    
    
select * from GuestLocations;


#Not in BCNF
-- Create the allotment table
CREATE TABLE allotment (
    guest_id INT,
    payment_type VARCHAR(50),
    room_type VARCHAR(50),
    room_no INT,
    floor INT
);

-- Insert values into the allotment table based on functional dependencies with duplicates
INSERT INTO allotment (guest_id, payment_type, room_type, room_no, floor)
VALUES
    (101, 'Credit Card', 'Deluxe', 201, 2),
    (102, 'Cash', 'Standard', 777, 1),
    (101, 'Credit Card', 'Suite', 301, 3),
    (101, 'Credit Card', 'Standard', 777, 1), 
    (101, 'Credit Card', 'Deluxe', 201, 2), 
    (102, 'Cash', 'Suite', 301, 3),
    (102, 'Cash', 'Deluxe', 201, 2), 
    (104, 'UPI', 'Standard', 777, 1), 
    (104, 'UPI', 'King', 201, 3), 
    (104, 'UPI', 'Suite', 301, 3); 
    
    select * from allotment;
    drop table allotment;
    
    #in bcnf
    CREATE TABLE Payment (
    guest_id INT PRIMARY KEY,
    payment_type VARCHAR(50)
);

-- Insert values into the Payment table from the original allotment table
INSERT INTO Payment (guest_id, payment_type)
SELECT DISTINCT guest_id, payment_type FROM allotment;

   select * from Payment;
   
CREATE TABLE RoomDetails (
    room_type VARCHAR(50),
    room_no INT,
    floor INT,
    PRIMARY KEY (room_type, room_no, floor)
);

-- Insert values into the RoomDetails table from the original allotment table
INSERT INTO RoomDetails (room_type, room_no, floor)
SELECT room_type, room_no, floor
FROM (
    SELECT
        room_type,
        room_no,
        floor,
        ROW_NUMBER() OVER (PARTITION BY room_type, room_no, floor ORDER BY room_type, room_no, floor) AS rn
    FROM allotment
) AS temp
WHERE rn = 1;

  select * from RoomDetails;
CREATE TABLE RoomMapping (
    guest_id INT,
    floor INT
);
-- Insert values into the RoomMapping table from the original allotment table
INSERT INTO RoomMapping (guest_id, floor)
SELECT  guest_id, floor FROM allotment;

drop table RoomMapping;
select distinct * from RoomMapping;

 
    








