use hotel;
select * from guests;
describe guests;

#create a view

CREATE VIEW guest_details
AS SELECT  fname,lname,mobile_no
FROM guests;

#displaying a view
SELECT * FROM guest_details;

INSERT INTO guests
VALUES (6 ,'Ritesh', 'Upate','yorku jax', 9344567890 ,19);

delete from guests
where guest_id=6;

# alter
ALTER VIEW guest_details
AS SELECT   guest_id,fname,lname,mobile_no
FROM guests;
SELECT * FROM guest_details;

# update 

UPDATE guest_details
SET fname ='Ritesh'
where guest_id =1 ;
SELECT * FROM guest_details;

INSERT INTO guest_details
VALUES(6,'ino', 'ross' ,988079299);


SHOW FULL TABLES 
WHERE table_type = 'VIEW';

DELETE from guest_details
WHERE guest_id =6;
SELECT * FROM guest_details;


