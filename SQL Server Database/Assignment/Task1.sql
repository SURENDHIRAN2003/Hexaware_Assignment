-- Task 1:Database Design

--1. Create the Database

create database TicketBookingSystem

--2. Create Tables for the database
--Venue Table
create table Venue(
venue_id int Primary key not null,
venue_name varchar(max) not null,
address varchar(max) not null
);

--Event Table
create table Event(
event_id int primary key identity,
event_name varchar(max),
event_date date,
event_time time,
venue_id int foreign key references Venue(venue_id),
total_seats int,
available_seats int,
ticket_price decimal(10,2),
event_type varchar(max) check(event_type in('Movie','Sports','Concert'))
);

--Customer Table
create table Customer(
customer_id int primary key identity,
customer_name varchar(max),
email varchar(max),
phone_number bigint
);

--Booking Table
create table Booking(
booking_id int primary key identity,
customer_id int foreign key references Customer(customer_id),
event_id int foreign key references Event(event_id),
num_tickets int,
total_cost int,
booking_date date
);

--Add booking_Id to the table Event
Alter table Event 
add booking_id int foreign key references Booking(booking_id);

--Add booking_id to the table Customer
Alter table Customer
add booking_id int foreign key references Booking(booking_id);

Select * from Venue
Select * from Event
Select * from Customer
Select * from Booking







