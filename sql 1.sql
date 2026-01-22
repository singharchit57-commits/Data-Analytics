-- Q1. Create a New Database and  Table for Employees
create database company_db;
use company_db;
create table employees (
employee_id int primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary int,
hire_date date);

-- Q2. Insert Data into Employees Table
insert into employees (employee_id, first_name, last_name, department, salary, hire_date)
values
(101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-22'),
(103,'Raj','Mehta','IT',90000,'2018-07-11'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');
 select* from employees;
 
 -- Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
 select salary from employees
 order by salary asc;

 -- Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low
select department,salary from employees
order by department asc,salary desc;

-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
select*from employees
where department='IT'
order by hire_date desc;

-- Q6. Create and Populate a Sales Table

create table sales(
sale_id int primary key,
customer_name varchar(50),
amount int,
sale_date date);

insert into sales(sale_id,customer_name,amount,sale_date)
values
(1,'Aditi',1500,'2024-08-01'),
(2,'Rohan',2200,'2024-08-03'),
(3,'Aditi',3500,'2024-09-05'),
(4,'Meena',2700,'2024-09-15'),
(5,'Rohan',4500,'2024-09-25');

-- Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)
select*from sales
order by amount asc;

-- Q8. Show All Sales Made by Customer “Aditi”
select*from sales
where customer_name='Aditi';

-- Q9. What is the Difference Between a Primary Key and a Foreign Key?
-- Primary key : Uniquely identifies a record in its own table.
-- Foreign Key: Links two tables together.

-- Q10. What Are Constraints in SQL and Why Are They Used?
/* NOT NULL: Prevents a column from having empty (NULL) values.
   UNIQUE: Ensures all values in a column are distinct.
   PRIMARY KEY: A combination of NOT NULL and UNIQUE.
   FOREIGN KEY: Links a record to a primary key in another table.
   CHECK: Ensures values meet a specific logical condition.
   DEFAULT: Sets a "fallback" value if no value is provided.*/




 








