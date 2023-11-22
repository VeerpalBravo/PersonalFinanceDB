# PersonalFinanceDB
This database is created to manage personal finances. It has 6 tables and as follows:
1) users: It contains user's id, firstname, lastname, contact, email and associated number of accounts
2) account_detail: It has relation with users by using user_id as foreign key. Its attributes are account_id, account_name, account_balance
3) user_income: In this table user_id and account_id are foreign keys, income-id is Primary key, date_ofdeposit, monthly_salary
4) user_budget: This table is to store monthly budget for expenses for user.
5) user_transaction: It contains all information for user's transactions from account.It has direct relation with account_detail table and user's information can be fetched by using join with account-table and users table
6) user_expenses: To store expenses detail of user. It has attributes as type_of_expense, desc_of_expenses, account_id, user_id, date_of_expenses, used_amount, expenses_id
    
