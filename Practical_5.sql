use hotel;
create table customer( CID integer auto_increment primary key not null,fname text(20),lname text(20),mob bigint);
INSERT INTO customer (fname, lname, mob) VALUES
('John', 'Doe', 1234567890),
('Jane', 'Smith', 9876543210),
('Alice', 'Johnson', 5555555555),
('Bob', 'Brown', 7777777777),
('Eve', 'Wilson', 8888888888),
('Michael', 'Davis', 9999999999),
('Sarah', 'Miller', 1111111111),
('David', 'Taylor', 2222222222),
('Emily', 'Clark', 3333333333),
('Chris', 'Martin', 4444444444);
select * from customer;

CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_name VARCHAR(50),
  room_number INT,
  check_in_date DATE,
  check_out_date DATE,
  total_price DECIMAL(10, 2)
);

INSERT INTO bookings (guest_name, room_number, check_in_date, check_out_date, total_price) VALUES
('Pranav Pathekar', 101, '2023-10-20', '2023-10-25', 750.00),
('Ritesh Upate', 102, '2023-10-22', '2023-10-27', 900.00),
('Khushi Sahu', 103, '2023-10-25', '2023-10-30', 825.00),
('Pranav Ikahr', 201, '2023-10-19', '2023-10-24', 950.00),
('Shrawani Wagh', 202, '2023-10-21', '2023-10-26', 850.00),
('Pranali Pachkawde', 203, '2023-10-24', '2023-10-29', 875.00),
('Atharva Warade', 301, '2023-10-18', '2023-10-23', 800.00),
('Harshal Tyagi', 302, '2023-10-23', '2023-10-28', 925.00),
('Sneha Ikhar', 303, '2023-10-26', '2023-10-31', 875.00);
select * from bookings;
SELECT ROUND(SUM(total_price)) AS total_price_rounded FROM bookings;
-- Update the total_price column with random decimal values\
SET sql_safe_updates = 0;


UPDATE bookings
SET total_price = ROUND(RAND() * 1000 + RAND() * 100, 2);

-- Display the updated table
SELECT * FROM bookings;

SELECT ROUND(SUM(total_price)) AS total_price_rounded FROM bookings;
SELECT FLOOR(AVG(total_price)) AS average_room_rate_floor FROM bookings;
SELECT MOD(room_number, (SELECT room_number FROM bookings WHERE total_price = (SELECT MAX(total_price) FROM bookings))) AS room_modulus FROM bookings;
SELECT room_number,guest_name
FROM bookings
WHERE MOD(room_number, 2) = 0;

SELECT CEIL(AVG(total_price)) AS average_total_price_ceil FROM bookings;
SELECT ABS(MAX(total_price) - MIN(total_price)) AS price_difference FROM bookings;
SELECT SUM(total_price * EXP(0.05 * 10)) AS total_price_after_growth FROM bookings;

SELECT SUM(total_price * PI()) AS total_price_multiplied_by_pi,guest_name
FROM bookings
WHERE room_number = 102
GROUP BY guest_name;

SELECT SQRT(total_price) AS square_root_total_price
FROM bookings
WHERE room_number = 101;

SELECT POWER(total_price, 3) AS total_price_cubed
FROM bookings
WHERE room_number = 202;

SELECT LOG(total_price) AS natural_log_total_price
FROM bookings
WHERE YEAR(check_out_date) = 2023 AND MONTH(check_out_date) = 10;

SELECT (RAND() * 50) AS random_discount_percentage
FROM bookings
WHERE room_number = 101;

-- DATE AND TIME FUNCTION
SELECT TIMESTAMP(check_in_date) AS checkin_timestamp,guest_name
FROM bookings
WHERE room_number = 101;

SELECT ADDDATE(check_out_date, INTERVAL 3 DAY) AS new_check_out_date,guest_name
FROM bookings
WHERE room_number = 201;

select check_out_date,guest_name from bookings
where guest_name='Pranav Ikahr';

SELECT CURDATE() AS `current_date`;


SELECT DATE(check_in_date) AS checkin_date_part,guest_name
FROM bookings
WHERE room_number = 303;

SELECT DAY(check_in_date) AS checkin_day_of_month,guest_name
FROM bookings
WHERE  room_number= 202;


SELECT STR_TO_DATE('20-2-2002', '%Y-%m-%d') AS parsed_checkin_date;

SELECT TIME_TO_SEC(TIMEDIFF(check_out_date, check_in_date)) AS stay_duration_seconds
FROM bookings
WHERE room_number = 202;

SELECT DATEDIFF(check_out_date, check_in_date) AS stay_duration_days,guest_name
FROM bookings
WHERE room_number = 203;

SELECT LAST_DAY(check_out_date) AS last_day_of_month
FROM bookings
WHERE room_number = 103;

SELECT SUM(total_price) AS total_revenue_in_october
FROM bookings
WHERE MONTH(check_in_date) = 10 AND YEAR(check_in_date) = 2023;

SELECT COUNT(*) AS total_bookings_in_2023
FROM bookings
WHERE YEAR(check_in_date) = 2023;

select * from guest;
describe guest;

CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    address TEXT,
    mobile_no BIGINT,
    age INT
);
-- Alter the 'guests' table to change data types
ALTER TABLE guests
MODIFY COLUMN address TEXT,
MODIFY COLUMN mobile_no BIGINT;

INSERT INTO guests (guest_id, fname, lname, address, mobile_no, age)
VALUES
    (1, 'Janvi', 'Joshi', '123 Main St, City, Country',8956412378,30),
    (2, 'Abhi', 'Jain', '456 Elm St, Town, Country', 8964756234, 25),
    (3, 'Mihir', 'Rajput', '789 Oak St, Village, Country',8523146789 , 35),
    (4, 'Emma', 'Stone', '101 Pine St, Suburb, Country',9756893145 , 28),
    (5, 'Pranav', 'Pathekar', '222 Maple St, Hamlet, Country',8588559965 , 21);
    select * from guests;
    
-- string function

SELECT fname, UPPER(fname) AS uppercase FROM guests;
SELECT fname, LOWER(fname) AS lowercase FROM guests;
SELECT  fname, LEFT(address, 10) AS address_left FROM guests;
SELECT fname,RIGHT(address, 10) AS address_right FROM guests;

SELECT * FROM guests WHERE LOCATE('City', address);

SELECT guest_id, fname, mobile_no, REPEAT(mobile_no, 3) AS repeated_mobile FROM guests;
SELECT guest_id, CONCAT(fname, lname, '@gmail.com') AS email_address
FROM guests;

SELECT guest_id, fname, SUBSTRING(address, 1, 20) AS first_20_characters FROM guests;
SELECT guest_id, fname, LENGTH(address) AS address_length FROM guests;

SELECT guest_id, fname, RPAD(fname, 10, '#') AS padded_fname FROM guests;

SELECT guest_id, fname, TRIM(address) AS trimmed_address FROM guests;

SELECT guest_id, fname, REVERSE(lname) AS reversed_last_name
FROM guests;

SELECT fname, lname, SOUNDEX(lname) AS last_name_soundex
FROM guests;

SELECT * FROM guests WHERE lname = 'Joshi';

SELECT guest_id, fname, lname, address
FROM guests
WHERE MATCH(address) AGAINST('Village');

ALTER TABLE guests ADD FULLTEXT(address);
rollback;
select * from guests;

SELECT SOUNDEX(fname) AS Phonetic_Representation 
FROM guests;

SELECT guest_id, fname, REPLACE(address, 'St', 'Street') AS updated_address
FROM guests;

SELECT guest_id, fname, ASCII(LEFT(fname, 1)) AS first_name_ascii
FROM guests;

SELECT guest_id, POSITION('City' IN address) AS city_position
FROM guests
WHERE guest_id=1;

SELECT guest_id, MID(address, 6, 10) AS extracted_address
FROM guests;

































