--comment
select name from master.sys.databases
select * from TestDB.sys.master_files
--exec sp_databases


--alter database March modify name=TestDB

create Table TestDB.dbo.Student(
Id int IDENTITY Primary KEY,
Name varchar(65) Not Null,
Gender Varchar(20),
Age INT,
Marks int
)

create table Employee(
Id int,
name varchar(max),
mobilenumber bigint,
email varchar(max),
dob date,
license varchar(50),
passport varchar(50)
)

alter table Employee add marriedstatus varchar(10)
select * from Employee