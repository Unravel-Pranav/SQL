
create table tools(
TID numeric(4) primary key,
name varchar(20),
 Inventory int(4),
 date_entered date not null
);
insert into tools values(1,"Hammer",20,"2022-9-12") , (2,"Screwdriver",24,"2021-04-22"),
(3,"Tape",30,"2023-02-14") , (4,"Pliers",10,"2023-06-23"),
(5,"Handsaw",25,"2019-10-4") , (6,"LockingPliers",4,"2012-05-23"),
(7,"Saw",10,"2005-07-11");
select * from tools;

select * from tools where Inventory < 10;
select * from tools where Inventory > 15;
 select * from tools where Inventory = 10;
 select * from tools where Inventory <= 20; 
  select * from tools where Inventory >= 20; 
  select * from tools where Inventory <>10 ; 
  select * from tools where TID IN (1,3,4);
  select * from tools;
    select * from tools where TID IN (1,3,4);
select * from tools where TID NOT IN (1,4,7); 
select * from tools where name LIKE "_a%"; 
select * from tools where name LIKE "______";
 select * from tools where name LIKE "%g%"; 
  select * from tools where name NOT LIKE "%g%";
  select * from tools where name NOT LIKE "______";
select * from tools where date_entered BETWEEN "2005-01-01" AND "2021-12- 31";
use toolbox;
 select * from tools;
 select * from tools where date_entered BETWEEN "2005-01-01" AND "2021-01-01";
 select * from tools where date_entered NOT BETWEEN "2005-01-01" AND "2021-01-01";
 
 create table tools1(
TID numeric(4) primary key,
name varchar(20),
 Inventory int(4),
 date_entered date not null
);
insert into tools1 values(1,"Hammer",20,"2022-9-12") , (2,"Screwdriver",24,"2021-04-22"),
(3,"Tape",30,"2023-02-14") , (4,"Pliers",10,"2023-06-23"),
(5,"Handsaw",25,"2019-10-4") , (6,"LockingPliers",4,"2012-05-23"),
(7,"Saw",10,"2005-07-11"),(8,"Electric Drill",34,"2021-04-11"),(9," Try Square",50,"2022-07-1"),(10,"Flashlight",45,"2019-04-12");
select * from tools1;
select * from tools UNION select * from tools1;
select * from tools UNION ALL select * from tools1; 
 select * from tools INTERSECT select * from tools1;
 select sum(Inventory) from tools;
 select min(Inventory) from tools;
 select min(Inventory) from  tools;
 select max(Inventory) from  tools;
  select count(TID) from  tools; 
  select avg(Inventory) from tools; 
   select * from tools INTERSECT select * from tools1;
    select names from tools EXCEPT select names from tools1;




