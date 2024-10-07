use hotel;
select * from bookings;
describe bookings;
INSERT INTO bookings (guest_name, room_number, check_in_date, check_out_date, total_price)
VALUES
    ('Pranav Pathekar', 101, '2023-11-10', '2023-11-15', 750.00),
    ('Ritesh Upate', 202, '2023-11-12', '2023-11-17', 900.00),
    ('Pranali Pachkawde', 303, '2023-11-15', '2023-11-20', 850.00),
    ('Shrawani Wagh', 404, '2023-11-18', '2023-11-23', 950.00),
    ('Pranav Ikhar', 505, '2023-11-21', '2023-11-26', 800.00);

#Single row subquery

SELECT guest_name, room_number, total_price
FROM bookings
WHERE room_number = (SELECT MAX(room_number) FROM bookings);

# MULTIPLE ROW

SELECT guest_name
FROM bookings
WHERE room_number IN (
    SELECT room_number
    FROM bookings
    WHERE room_number = 505
);


#multiple column

SELECT guest_name, total_price
FROM bookings
WHERE check_out_date - check_in_date >= 3
AND total_price > (SELECT AVG(total_price) FROM bookings
WHERE
total_price >800 
);



insert into bookings values(15,'Raman Singh',505,'2023-11-21','2023-11-26',800);

#correlated subquery
SELECT guest_name
FROM bookings
WHERE total_price > (
    SELECT total_price
    FROM bookings
    WHERE guest_name = 'Pranav Ikhar'
);
