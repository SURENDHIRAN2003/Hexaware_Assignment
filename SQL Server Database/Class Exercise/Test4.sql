create Table Trainees(
Id int identity(200,1) primary key,
name varchar(50)
)

create table Skill(
Id int identity(100,1) primary key not null,
name varchar(50),
skid int not null
constraint FK_Trainees foreign key(skid) references Trainees(Id)
)

-- Insert into Trainees table
INSERT INTO Trainees (name) VALUES ('Suren');

-- Check Trainees table
SELECT * FROM Trainees;

-- Insert into Skill table (use valid skid)
INSERT INTO Skill (name, skid) VALUES ('C#', 200);

-- Check Skill table
SELECT * FROM Skill;

delete from Skill where id=200

delete from Trainees where Id=200;

update Skill set name='C#' where Id=100;
select * from Employee where name like 'i%'

select * from Employee where Id=100 or Id=101

select * from Employee order by id asc offset 2 rows fetch next 2 rows only

select count(Id) as NoOfEmployees from Employee
select min(Id) from Employee

select sum(Id)  from Employee group by license having license like 'A%'
