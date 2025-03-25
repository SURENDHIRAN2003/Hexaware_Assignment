--Coding Challenge - Car Rental System
--Create the database
create database CarRentalSystem

--Create the table Vehicle
create table Vehicle(
vehicleID int primary key identity,
make varchar(max),
model varchar(max),
year int,
dailyRate decimal(10,2),
status varchar(max),
passengerCapacity int,
engineCapacity int
)

--create the table Customer
create table Customer(
customerID int primary key identity,
firstName varchar(max),
lastName varchar(max),
email varchar(max),
phoneNumber varchar(20)
)

--create the table Lease
create table Lease(
leaseID int primary key identity,
vehicleID int foreign key references Vehicle(vehicleID),
customerID int foreign key references Customer(customerID),
startDate date,
endDate date,
type varchar(20)
)

--create the table Payment
create table Payment(
paymentID int primary key identity,
leaseID int foreign key references Lease(leaseID),
paymentDate date,
amount decimal(10,2)
)

--insert data to the Vehicle table
insert into Vehicle values
('Toyota', 'Camry', 2022, 50.00, 'available', 4, 1450),
('Honda', 'Civic', 2023, 45.00, 'available', 7, 1500),
('Ford', 'Focus', 2022, 48.00, 'notAvailable', 4, 1400),
('Nissan', 'Altima', 2023, 52.00, 'available', 7, 1200),
('Chevrolet', 'Malibu', 2022, 47.00, 'available', 4, 1800),
('Hyundai', 'Sonata', 2023, 49.00, 'notAvailable', 7, 1400),
('BMW', '3 Series', 2023, 60.00, 'available', 7, 2499),
('Mercedes', 'C-Class', 2022, 58.00, 'available', 8, 2599),
('Audi', 'A4', 2022, 55.00, 'notAvailable', 4, 2500),
('Lexus', 'ES', 2023, 54.00, 'available', 4, 2500);

--insert data to the Customet table
insert into Customer values
('John', 'Doe', 'johndoe@example.com', '555-555-5555'),
('Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
('Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
('Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
('David', 'Lee', 'david@example.com', '555-987-6543'),
('Laura', 'Hall', 'laura@example.com', '555-234-5678'),
('Michael', 'Davis', 'michael@example.com', '555-876-5432'),
('Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
('William', 'Taylor', 'william@example.com', '555-321-6547'),
('Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

--insert data to the Lease Table
insert into Lease values
(1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, '2023-05-05', '2023-05-10', 'Daily'),
(4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, '2023-10-10', '2023-10-31', 'Monthly');

--insert data to the Payment Table
insert into Payment values
(1, '2023-01-03', 200.00),
(2, '2023-02-20', 1000.00),
(3, '2023-03-12', 75.00),
(4, '2023-04-25', 900.00),
(5, '2023-05-07', 60.00),
(6, '2023-06-18', 1200.00),
(7, '2023-07-03', 40.00),
(8, '2023-08-14', 1100.00),
(9, '2023-09-09', 80.00),
(10, '2023-10-25', 1500.00);

--1. Update the daily rate for a Mercedes car to 68
Update Vehicle set dailyRate=68.00 where make='Mercedes'

--2. Delete a specific customer and all associated leases and payments
Delete from Payment where leaseId in (Select leaseID from Lease where customerID=10)
Delete from Lease where customerID=10;
Delete from Customer where customerID=10;

--3. Rename the "paymentDate" column in the Payment table to "transactionDate"
Exec sp_rename 'payment.paymentDate', 'transactionDate', 'column';

--4. Find a specific customer by email
Select * from Customer where email='johndoe@example.com'

--5. Get active leases for a specific customer
Select leaseID from Lease where customerID=3 and startDate<= getdate() and endDate>=getdate()

--6. Find all payments made by a customer with a specific phone number
Select p.* from Payment p left join Lease l on p.leaseID=l.leaseID
left join Customer c on c.customerID=l.customerID where phoneNumber='555-789-1234'

--7. Calculate the average daily rate of all available cars
Select avg(dailyRate) as 'Average Daily Rate' from Vehicle where status='available'

--8. Find the car with the highest daily rate
Select * from Vehicle where dailyRate = (select max(dailyRate) from Vehicle);

--9. Retrieve all cars leased by a specific customer
Select v.* from Vehicle v left join Lease l on v.vehicleID = l.vehicleID
where l.customerID = 3;

--10. Find the details of the most recent lease
Select top 1 * from Lease order by startDate desc

--11. List all payments made in the year 2023
Select * from Payment where year(transactionDate)=2023

--12. Retrieve customers who have not made any payments
Select * from Customer where customerID not in 
(Select distinct l.customerID from Lease l left join Payment p on l.leaseID = p.leaseID);

--13. Retrieve Car Details and Their Total Payments
Select V.vehicleID, sum(P.amount) AS totalPayments from Vehicle V join Lease L ON V.vehicleID = L.vehicleID
join Payment P on L.leaseID = P.leaseID group by V.vehicleID;

--14. Calculate Total Payments for Each Customer
Select c.customerID,sum(p.amount) as totalPaid from Customer c join Lease l on l.leaseID=c.customerID
join Payment p on p.leaseID=l.leaseID group by c.customerID

--15. List Car Details for Each Lease
Select leaseID,v.* from Vehicle v join Lease l on l.vehicleID=v.vehicleID

--16. Retrieve Details of Active Leases with Customer and Car Information
Select v.*,c.* from Vehicle v join Lease l on l.vehicleID=v.vehicleID join
Customer c on c.customerID=l.customerID where startDate<= getdate() and endDate>=getdate() 

--17. Find the Customer Who Has Spent the Most on Leases
Select top 1 c.customerID,sum(p.amount) from Customer c join Lease l on c.customerID=l.leaseID
join Payment p on p.leaseID=l.leaseID group by c.customerID order by sum(p.amount) desc

--18. List All Cars with Their Current Lease Information
Select v.*,l.startDate,l.endDate,c.customerId,c.firstName,c.lastName from Vehicle v join Lease l on l.vehicleID=v.vehicleID
join Customer c on c.customerID=l.customerID where startDate<=getdate() and endDate>=getDate()
