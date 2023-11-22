--To create User detail table
CREATE TABLE users(
user_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100),
contact VARCHAR(10),
no_of_accounts INTEGER);

--To create Account detail table
CREATE TABLE account_detail(
account_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
user_id INTEGER REFERENCES users(user_id),
account_name VARCHAR(100),
account_balance DECIMAL(12,2));

--To create budget detail table
CREATE TABLE user_budget(
budget_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
user_id INTEGER REFERENCES users(user_id),
estimated_budget DECIMAL(12,2),
date_of_budget DATE);


--To create user expenses table
CREATE TABLE user_expenses(
expenses_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
user_id INTEGER REFERENCES users(user_id),
account_id INTEGER REFERENCES account_detail(account_id),
type_of_expenses VARCHAR(100),
date_of_expenses TIMESTAMP,
used_amount DECIMAL(12,2),
expenses_desc TEXT);

--To create user income table
CREATE TABLE user_income(
income_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
user_id INTEGER REFERENCES users(user_id),
monthly_salary DECIMAL(12,2),
date_of_deposit TIMESTAMP);

--To create user transaction table
CREATE TABLE user_transaction(
transaction_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
user_id INTEGER REFERENCES users(user_id),
account_id INTEGER REFERENCES account_detail(account_id),
transaction_date TIMESTAMP,
transaction_amount DECIMAL(12,2),
category VARCHAR(10));


--To remove generated always as identity from column with help of ALTER Command
ALTER TABLE account_detail ALTER COLUMN account_id  DROP IDENTITY


--To insert data into tables for single row
INSERT into users(first_name,last_name,email,contact,no_of_accounts)
VALUES ('chuck','fisherman','fchuck34@gmail.com','6478882200',2);

--To insert data into multiple rows altogether
INSERT into users(first_name,last_name,email,contact,no_of_accounts)
VALUES ('Veerpal','kaur','kveerpal78@gmail.com','4165512200',2),
('george','bush','ggeorge34@gmail.com','6498862200',3),
('balwinder','singh','bsingh34@gmail.com','6478456320',1),
('kabal','brar','kbrar56@gmail.com','6478874530',2),
('bill','gates','gbill34@gmail.com','6478156473',1),
('gurpreet','singh','gsingh34@gmail.com','6478167439',1),
('sonia','devi','dsonia6789@gmail.com','6476846784',1),
('sam','christopher','csam89543@gmail.com','4167112200',2),
('raman','gill','ramangill67@gmail.com','6478112200',1),
('kulwinder','gill','gkulwinder7864@gmail.com','6474167009',3),
('dheeraj','pandey','pandeyd7801@gmail.com','6478874909',2),
('karam','brar','brar78karam@gmail.com','4167832200',1),
('sukh','rauli','rauli56sukh@gmail.com','6478112288',1)
returning *; --To show inserted data in table upon execution of this insert into command without use of select command


INSERT INTO account_detail(account_id, user_id, account_name,account_balance)
VALUES (1004567, 1, 'savings', 12780.00),
(1004600, 2, 'chequing', 5780.00),
(1004571, 3, 'chequing', 7880.00),
(1004572, 3, 'savings', 9980.00),
(1004580, 4, 'chequing', 6799.40),
(1004581, 4, 'savings', 1780.00),
(1004582, 4, 'momentum savings', 2330.40),
(1004590, 5, 'savings', 3880.00),
(1004585, 6, 'chequing', 4780.40),
(1004586, 6, 'savings', 3672.00),
(1004591, 7, 'chequing', 3343.00),
(1004592, 8, 'savings', 7638.30),
(1004593, 9, 'chequing', 566.36),
(1004610, 10, 'chequing', 300.00),
(1004611, 10, 'savings', 3422.00),
(1004642, 12, 'chequing', 1200.56),
(1004643, 12, 'savings', 7832.15),
(1004644, 12, 'momentum savings', 780.00),
(1004700, 13, 'chequing', 3350.00),
(1004701, 13, 'savings', 870.45),
(1004710, 14, 'chequing', 783.20),
(1004721, 15, 'chequing', 314.00);




INSERT INTO user_expenses (user_id, account_id, type_of_expenses, date_of_expenses,used_amount,expenses_desc)
VALUES (11,1004560, 'hosuing', '2023-10-17 18:49:10',665.00,'Money for rent'),
(11,1004560, 'food', '2023-10-20 18:49:10',211.00,'Money used for food'),
(11,1004560, 'transportation', '2023-10-21 18:49:10',230.00,'Money for transportation'),
(11,1004560, 'personal', '2023-10-27 18:49:10',350.00,'personal and family');



--insert data into multiple rows with returning statement to show table data on execution of the query
INSERT INTO user_income(user_id, monthly_salary, date_of_deposit)
VALUES (1,3000.00,'2023-06-15 18:49:10'),
(1,3000.00,'2023-06-15 18:49:10'),
(1,3000.00,'2023-07-15 18:49:10'),
(1,3000.00,'2023-08-15 18:49:10'),
(1,3000.00,'2023-09-15 18:49:10'),
(1,3000.00,'2023-10-15 18:49:10'),
(1,3000.00,'2023-11-15 18:49:10'),
(1,3000.00,'2023-12-15 18:49:10'),
(2,3200.00,'2023-06-15 18:49:10'),
(2,3200.00,'2023-07-15 18:49:10'),
(2,3200.00,'2023-08-15 18:49:10'),
(2,3200.00,'2023-09-15 18:49:10'),
(2,3200.00,'2023-10-15 18:49:10'),
(2,3200.00,'2023-11-15 18:49:10'),
(2,3200.00,'2023-12-15 18:49:10'),
(3,4000.00,'2023-06-15 18:49:10'),
(3,3500.00,'2023-07-15 18:49:10'),
(3,3200.00,'2023-08-15 18:49:10'),
(3,3000.00,'2023-09-15 18:49:10'),
(3,3700.00,'2023-10-15 18:49:10'),
(4,4200.00,'2023-06-15 18:49:10'),
(4,3200.00,'2023-07-15 18:49:10'),
(4,4000.00,'2023-08-15 18:49:10'),
(4,3800.00,'2023-09-15 18:49:10'),
(4,4000.00,'2023-10-15 18:49:10'),
(5,4000.00,'2023-06-15 18:49:10'),
(5,3500.00,'2023-07-15 18:49:10'),
(5,3200.00,'2023-08-15 18:49:10'),
(5,3000.00,'2023-09-15 18:49:10'),
(5,3700.00,'2023-10-15 18:49:10'),
(6,4200.00,'2023-06-15 18:49:10'),
(6,3200.00,'2023-07-15 18:49:10'),
(6,4000.00,'2023-08-15 18:49:10'),
(6,3800.00,'2023-09-15 18:49:10'),
(6,4000.00,'2023-10-15 18:49:10'),
(7,4000.00,'2023-06-15 18:49:10'),
(7,3500.00,'2023-07-15 18:49:10'),
(7,3200.00,'2023-08-15 18:49:10'),
(7,3000.00,'2023-09-15 18:49:10'),
(7,3700.00,'2023-10-15 18:49:10'),
(8,4200.00,'2023-06-15 18:49:10'),
(8,3200.00,'2023-07-15 18:49:10'),
(8,4000.00,'2023-08-15 18:49:10'),
(8,3800.00,'2023-09-15 18:49:10'),
(8,4000.00,'2023-10-15 18:49:10'),
(9,4000.00,'2023-06-15 18:49:10'),
(9,3500.00,'2023-07-15 18:49:10'),
(9,3200.00,'2023-08-15 18:49:10'),
(9,3000.00,'2023-09-15 18:49:10'),
(9,3700.00,'2023-10-15 18:49:10'),
(10,4200.00,'2023-06-15 18:49:10'),
(10,3200.00,'2023-07-15 18:49:10'),
(10,4000.00,'2023-08-15 18:49:10'),
(10,3800.00,'2023-09-15 18:49:10'),
(10,4000.00,'2023-10-15 18:49:10'),
(11,3800.00,'2023-09-15 18:49:10'),
(11,4000.00,'2023-10-15 18:49:10'),
(12,4000.00,'2023-06-15 18:49:10'),
(12,3500.00,'2023-07-15 18:49:10'),
(12,3200.00,'2023-08-15 18:49:10'),
(12,3000.00,'2023-09-15 18:49:10'),
(12,3700.00,'2023-10-15 18:49:10'),
(13,4200.00,'2023-06-15 18:49:10'),
(13,3200.00,'2023-07-15 18:49:10'),
(13,4000.00,'2023-08-15 18:49:10'),
(11,3800.00,'2023-09-15 18:49:10'),
(13,4000.00,'2023-10-15 18:49:10'),
(14,4000.00,'2023-06-15 18:49:10'),
(14,3500.00,'2023-07-15 18:49:10'),
(14,3200.00,'2023-08-15 18:49:10'),
(14,3000.00,'2023-09-15 18:49:10'),
(14,3700.00,'2023-10-15 18:49:10'),
(15,4200.00,'2023-06-15 18:49:10'),
(15,3200.00,'2023-07-15 18:49:10'),
(15,4000.00,'2023-08-15 18:49:10'),
(15,3800.00,'2023-09-15 18:49:10'),
(15,4000.00,'2023-10-15 18:49:10')
returning *;



INSERT INTO user_budget(user_id, estimated_budget, date_of_budget)
VALUES (1,2200.00,'2023-06-15'),
(1,1200.00,'2023-07-15'),
(1,2900.00,'2023-08-15'),
(1,2800.00,'2023-09-15'),
(1,2000.00,'2023-10-15'),
(2,1800.00,'2023-09-15'),
(2,2500.00,'2023-10-15'),
(3,3000.00,'2023-06-15'),
(3,2500.00,'2023-07-15'),
(3,2200.00,'2023-08-15'),
(3,1900.00,'2023-09-15'),
(3,1700.00,'2023-10-15'),
(4,2200.00,'2023-06-15'),
(4,2200.00,'2023-07-15'),
(4,2500.00,'2023-08-15'),
(4,2500.00,'2023-09-15'),
(4,2500.00,'2023-10-15'),
(5,2500.00,'2023-06-15'),
(5,1500.00,'2023-07-15'),
(5,2200.00,'2023-08-15'),
(5,2000.00,'2023-09-15'),
(5,2000.00,'2023-10-15'),
(6,2700.00,'2023-06-15'),
(6,2000.00,'2023-07-15'),
(6,2500.00,'2023-08-15'),
(6,2000.00,'2023-09-15'),
(6,2500.00,'2023-10-15'),
(7,2700.00,'2023-06-15'),
(7,2000.00,'2023-07-15'),
(7,2500.00,'2023-08-15'),
(7,2000.00,'2023-09-15'),
(7,2500.00,'2023-10-15'),
(8,2700.00,'2023-06-15'),
(8,2000.00,'2023-07-15'),
(8,2500.00,'2023-08-15'),
(8,2000.00,'2023-09-15'),
(8,2500.00,'2023-10-15'),
(9,2700.00,'2023-06-15'),
(9,2000.00,'2023-07-15'),
(9,2500.00,'2023-08-15'),
(9,2000.00,'2023-09-15'),
(9,2500.00,'2023-10-15'),
(10,2200.00,'2023-06-15'),
(10,1200.00,'2023-07-15'),
(10,2900.00,'2023-08-15'),
(10,2800.00,'2023-09-15'),
(10,2000.00,'2023-10-15'),
(11,1800.00,'2023-09-15'),
(11,2500.00,'2023-10-15'),
(12,3000.00,'2023-06-15'),
(12,2500.00,'2023-07-15'),
(12,2200.00,'2023-08-15'),
(12,1900.00,'2023-09-15'),
(12,1700.00,'2023-10-15'),
(13,2200.00,'2023-06-15'),
(13,2200.00,'2023-07-15'),
(13,2500.00,'2023-08-15'),
(11,2500.00,'2023-09-15'),
(13,2500.00,'2023-10-15'),
(14,2500.00,'2023-06-15'),
(14,1500.00,'2023-07-15'),
(14,2200.00,'2023-08-15'),
(14,2000.00,'2023-09-15'),
(14,2000.00,'2023-10-15'),
(15,2700.00,'2023-06-15'),
(15,2000.00,'2023-07-15'),
(15,2500.00,'2023-08-15'),
(15,2000.00,'2023-09-15'),
(15,2500.00,'2023-10-15')
returning *;


INSERT INTO user_transaction (user_id, account_id, transaction_date,transaction_amount,category)
VALUES (11,1004560, '2023-10-09 18:49:10',200.00,'Credit'),
(11,1004560, '2023-10-10 18:49:10',31.00,'Debit'),
(11,1004560, '2023-10-21 18:49:10',20.00,'Debit'),
(11,1004560, '2023-10-29 18:49:10',50.00,'Debit'),
(1,1004567, '2023-10-17 18:49:10',50.00,'Debit'),
(1,1004567, '2023-10-20 18:49:10',30.00,'Debit'),
(1,1004567, '2023-10-21 18:49:10',10.00,'Debit'),
(1,1004567, '2023-10-27 18:49:10',23.00,'Debit'),
(2,1004600, '2023-10-17 18:49:10',45.00,'Debit'),
(2,1004600,'2023-10-20 18:49:10',300.00,'Credit'),
(2,1004600,  '2023-10-21 18:49:10',20.00,'Debit'),
(2,1004600,  '2023-10-27 18:49:10',11.00,'Debit'),
(3,1004572, '2023-10-17 18:49:10',15.00,'Debit'),
(3,1004571, '2023-10-20 18:49:10',20.00,'Debit'),
(3,1004571, '2023-10-21 18:49:10',150.00,'Debit'),
(3,1004571,  '2023-10-27 18:49:10',1000.00,'Credit'),
(4,1004580,  '2023-10-17 18:49:10',100.00,'Debit'),
(4,1004580,  '2023-10-20 18:49:10',37.00,'Debit'),
(4,1004581,  '2023-10-21 18:49:10',27.00,'Debit'),
(4,1004580,  '2023-10-27 18:49:10',60.00,'Debit'),
(5,1004590, '2023-10-17 18:49:10',450.00,'Credit'),
(5,1004590,'2023-10-20 18:49:10',300.00,'Credit'),
(5,1004590, '2023-10-21 18:49:10',300.00,'Debit'),
(5,1004590, '2023-10-27 18:49:10',30.00,'Debit'),
(6,1004585,  '2023-10-17 18:49:10',52.30,'Debit'),
(6,1004585,  '2023-10-20 18:49:10',2.00,'Debit'),
(6,1004585,  '2023-10-21 18:49:10',1.50,'Debit'),
(6,1004585 ,'2023-10-27 18:49:10',50.00,'Debit'),
(7,1004591,  '2023-10-17 18:49:10',50.00,'Debit'),
(7,1004591,  '2023-10-20 18:49:10',40.00,'Debit'),
(7,1004591,  '2023-10-21 18:49:10',25.00,'Credit'),
(7,1004590, '2023-10-27 18:49:10',22.00,'Debit'),
(8,1004592,  '2023-10-17 18:49:10',45.00,'Debit'),
(8,1004592, '2023-10-20 18:49:10',30.00,'Debit'),
(8,1004592,  '2023-10-21 18:49:10',75.00,'Debit'),
(8,1004592, '2023-10-27 18:49:10',10.00,'Debit'),
(9,1004593, '2023-10-17 18:49:10',800.00,'Credit'),
(9,1004593,  '2023-10-20 18:49:10',2.00,'Debit'),
(9,1004593,  '2023-10-21 18:49:10',15.00,'Debit'),
(9,1004593,  '2023-10-27 18:49:10',35.00,'Debit'),
(10,1004610,  '2023-10-17 18:49:10',45.00,'Debit'),
(10,1004610,  '2023-10-20 18:49:10',30.00,'Debit'),
(10,1004611,  '2023-10-21 18:49:10',5.00,'Credit'),
(10,1004611,  '2023-10-27 18:49:10',3.00,'Debit'),
(12,1004642,  '2023-10-17 18:49:10',50.00,'Debit'),
(12,1004642,  '2023-10-20 18:49:10',20.00,'Debit'),
(12,1004643,  '2023-10-21 18:49:10',15.00,'Debit'),
(12,1004643 , '2023-10-27 18:49:10',5.00,'Debit'),
(13,1004700,  '2023-10-17 18:49:10',500.00,'Debit'),
(13,1004700,  '2023-10-27 18:49:10',800.00,'Credit'),
(14,1004710, '2023-10-17 18:49:10',1.50,'Debit'),
(14,1004710, '2023-10-21 18:49:10',7.00,'Debit'),
(14,1004710, '2023-10-27 18:49:10',1.99,'Debit'),
(15,1004721,  '2023-10-17 18:49:10',80.00,'Debit'),
(15,1004721,  '2023-10-27 18:49:10',81.00,'Debit')
 returning * ;
 
 
 --To Alter Tables:
 --To remove generated always as identity from column with help of ALTER Command
ALTER TABLE account_detail ALTER COLUMN account_id  DROP IDENTITY

--To add new column in table
ALTER TABLE user_income ADD COLUMN account_id INTEGER REFERENCES account_detail(account_id);

--To update Table rows:
--To update multiple rows in table
UPDATE user_income SET account_id = 1004610 WHERE user_id=10;
UPDATE user_income SET account_id = 1004560 WHERE user_id=11;
UPDATE user_income SET account_id = 1004642 WHERE user_id=12;
UPDATE user_income SET account_id = 1004700 WHERE user_id=13;
UPDATE user_income SET account_id = 1004710 WHERE user_id=14;
UPDATE user_income SET account_id = 1004721 WHERE user_id=15;

--To create view of users having monthly salary more than 3200
CREATE VIEW salary_view AS
  SELECT user_id, AVG(monthly_salary)
  FROM user_income
  WHERE monthly_salary > 3200
  GROUP BY user_id;






