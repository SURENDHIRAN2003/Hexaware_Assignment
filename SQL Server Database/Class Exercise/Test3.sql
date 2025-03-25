create table Trainee(
 Id int identity(100,1) not null,
 name varchar(50),
 skill varchar(50),
 skillid int,
 constraint PK_TSSID primary key(Id,skillid)
)

insert into Trainee values (
'Rahul','SQL C#',1
)

select * from Trainee

delete from Trainee where Id=104