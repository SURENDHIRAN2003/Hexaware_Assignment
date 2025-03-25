create table product(
pid int identity(200,1) primary key not null,
pname varchar(50),
pprice bigint
)

insert into product values('pen',10),
('notebook',50),
('laptop',50000),
('toys',500),
('pencil',10)

select * from product


create table orders(
orid int identity(200,1) primary key not null,
orderdate date,
productid int 
constraint FK_productId foreign key (productId) references product(pid)
)

insert into orders values(Getdate(),(select pid from product where pname='pencil')),
(GETDATE(),201),
(GETDATE(),202),
(GETDATE(),203)

select * from orders

update orders set orid = (select productid from product where pname='toys')
where productid=201
