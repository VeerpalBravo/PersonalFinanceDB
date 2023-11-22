--Data Query language- Use of SELECT command in PostgreSQL
--To fetch all data from table
 SELECT * FROM users;
 
 --To fetch avaerage salar from view
 SELECT * From salary_view;
 
 --To select specific columns from Table
 SELECT first_name, last_name, no_of_accounts FROM users;

--To concatenate firstname and last name columns as a one column and Full as alias for new generated column											 
SELECT CONCAT((first_name) , ' ' , (last_name) )
AS Full_Name
FROM users;

--To delete column from table
alter table user_transaction drop user_id;

--To count total number of Users having greater than and equal to 4000 monthly salary for October month
SELECT COUNT(*) as No_of_UsersOver4000Salary FROM user_income 
WHERE  monthly_salary>=4000 and EXTRACT('MONTH' FROM date_of_deposit)=10;

--To check users having more than 1 account
SELECT user_id from users where no_of_accounts>1;

--To check account balance and ordered them by user_id users having more than 1 account by joining two columns
SELECT u.user_id , ad.account_balance from users u
join account_detail ad
ON u.user_id=ad.user_id
where u.no_of_accounts>1
order by user_id ;

--To calculate total balance of users even if they have more than 1 account and ordered, grouped them by user_id users 
SELECT SUM(ad.account_balance) AS Total_balance, ad.user_id from users u
join account_detail ad
ON u.user_id=ad.user_id
group by ad.user_id
order by ad.user_id;

--To fetch data where first name starts with  letter k
SELECT * from users where first_name LIKE 'k%'; -- when we use LIKE it matches exact values because it is case-sensitive

/*TO fetch users account balance, user_id and average monthly salary whose avaerage salary is
between 3000 and 3500, and have only one bank account, three tables are used to fetch this data 
CTE is used to calculate average salary*/
WITH avg_monthly_salary AS(
SELECT user_id, AVG(monthly_salary) AS average_salary from user_income
GROUP BY user_id) 
SELECT ams.user_id, u.first_name, ad.account_balance
FROM avg_monthly_salary ams
FULL JOIN users u ON u.user_id=ams.user_id
FULL JOIN account_detail ad ON ad.user_id=u.user_id
WHERE u.no_of_accounts=1 and ams.average_salary BETWEEN 3000 AND 3500;

--To check if account_detail table has unassociated account-id to user_income table
SELECT ui.account_id, ui.monthly_salary, ui.date_of_deposit, ad.account_name, ad.account_balance FROM user_income ui
FULL JOIN account_detail ad ON ad.account_id=ui.account_id
ORDER BY ad.account_name desc

--To fetch account IDs which are not present in user income table
SELECT account_id FROM account_detail WHERE account_id
NOT IN (SELECT account_id FROM user_income)

--To fetch account IDs which are present in user income table
SELECT account_id FROM account_detail WHERE account_id
IN (SELECT account_id FROM user_income)


/*To fetch all users who have first name length less than and equal to minimum length of 
last name from all last names in table*/
SELECT * FROM users 
WHERE length(first_name)<=ALL(SELECT length(last_name) FROM users)

/*To fetch all users who have first name length greater than any length of 
last name from all last names in table*/
SELECT * FROM users 
WHERE length(first_name)>ANY(SELECT length(last_name) FROM users)

/*To find total number of users who had transactions less than 10 because transaction table 
is not directly linked to users*/
SELECT COUNT(*) AS total_no_of_users
FROM account_detail ad 
WHERE EXISTS (
SELECT ut.account_id, ut.transaction_amount FROM user_transaction ut
WHERE ut.account_id=ad.account_id AND transaction_amount<10);

--To return specific number of rows here 10 maximum rows
SELECT * FROM users LIMIT 10;

--To find common type of expenses of all users
SELECT DISTINCT type_of_expenses FROM user_expenses;

/*To return user having maximum balance account and then
filtered only those users who have maximum balance in chequing account*/
SELECT ad.user_id, MAX(ad.account_balance) AS max_balance
FROM account_detail ad
WHERE account_name='chequing'
GROUP BY user_id
ORDER BY max_balance;

--To return rows where users have number of transactions less than 4
SELECT u.user_id,COUNT(transaction_amount) AS total_transactions FROM user_transaction ut
JOIN account_detail ad ON ad.account_id=ut.account_id
JOIN users u ON u.user_id=ad.user_id
GROUP BY u.user_id
HAVING COUNT(transaction_amount)<4;



--To return rows where users have number of transactions less than 4
WITH users_less_than_4transactions AS (
SELECT u.user_id,COUNT(transaction_amount) AS total_transactions FROM user_transaction ut
JOIN account_detail ad ON ad.account_id=ut.account_id
JOIN users u ON u.user_id=ad.user_id
GROUP BY u.user_id
HAVING COUNT(transaction_amount)<4)
SELECT CONCAT((u.first_name),' ',( u.last_name)), ul.total_transactions 
FROM users_less_than_4transactions ul
JOIN users u ON u.user_id=ul.user_id;


