
create database trig;
use trig;

CREATE TABLE EMPLOYEES
( EMPLOYEE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
HOURLY_PAY NUMERIC(6,2),
SALARY NUMERIC(10,2),
JOB VARCHAR(10)
);

INSERT INTO EMPLOYEES
VALUES (1, 'JOHN', 'KARL', 25.5, 53040.00, 'MANAGER'),
(2, 'JAMES', 'SMITH', 15.00, 31200.00, 'CASHIER'),
(3, 'JACK', 'CLINTON', 12.5, 26000.00, 'COOK');

CREATE TRIGGER BEFORE_HOURLY_PAY_UPDATE
BEFORE UPDATE ON EMPLOYEES
FOR EACH ROW
SET NEW.SALARY = (NEW.HOURLY_PAY * 2080);
SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES
SET HOURLY_PAY = HOURLY_PAY + 1;
SELECT * FROM EMPLOYEES;

