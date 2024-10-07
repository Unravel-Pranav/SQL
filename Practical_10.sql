use tranc;
CREATE TABLE hotel (
    id INT PRIMARY KEY,
    hotel_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_range DECIMAL(10, 2)
);

INSERT INTO hotel (id, hotel_name, location, price_range)
VALUES
    (5, 'Hotel Scube', 'Kerala', 900.00);
select * from hotel;
DELETE FROM hotel
WHERE id=5; 
Commit; 

update hotel
set location='Pune'
where id=4; 
commit; 

Select * from hotel; 
Commit; 

DELETE FROM hotel
WHERE id=5; 

Delimiter // 
create procedure h() 
begin 
 select hotel_name, location from hotel; 
 end// 
 Delimiter ;  


SET SQL_SAFE_UPDATES = 0;