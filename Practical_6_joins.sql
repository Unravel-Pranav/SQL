use hotel;
select * from guests;
select * from room;
describe guests;



#inner join
SELECT * FROM guests
FULL JOIN room
ON guests.guest_id = room.guest_id;




