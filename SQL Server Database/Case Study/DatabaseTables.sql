--Case Study - Finance Management System
--create the database
create database FinanceManagementSystem

--create the Users table
create table Users(
user_id int primary key not null,
username varchar(max),
password varchar(max),
email varchar(max)
)

--create table ExpenseCategories
create table ExpenseCategories(
category_id int primary key not null,
category_name varchar(max)
)

--create table Expenses
create table Expenses(
expense_id int primary key not null,
user_id int foreign key references Users(user_id),
amount decimal(10,2),
category_id int foreign key references ExpenseCategories(category_id),
date date,
description varchar(max)
)