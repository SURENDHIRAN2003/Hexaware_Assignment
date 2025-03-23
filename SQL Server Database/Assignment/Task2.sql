--Task 2

--1.Insert atleat 10 records for each table each
--Venue Data
insert into Venue (venue_id, venue_name, address) values
(1, 'M. A. Chidambaram Stadium', 'Chepauk, Chennai, Tamil Nadu'),
(2, 'Jawaharlal Nehru Indoor Stadium', 'Periyamet, Chennai, Tamil Nadu'),
(3, 'Coimbatore Nehru Stadium', 'Gopalapuram, Coimbatore, Tamil Nadu'),
(4, 'Madurai Race Course Stadium', 'Race Course Road, Madurai, Tamil Nadu'),
(5, 'Tiruchirappalli Anna Stadium', 'Cantonment, Tiruchirappalli, Tamil Nadu'),
(6, 'CODISSIA Trade Fair Complex', 'Peelamedu, Coimbatore, Tamil Nadu'),
(7, 'Kamarajar Arangam', 'Teynampet, Chennai, Tamil Nadu'),
(8, 'Raja Muthiah Hall', 'Egmore, Chennai, Tamil Nadu'),
(9, 'Kumarasamy Hall', 'Salem, Tamil Nadu'),
(10, 'VGP Universal Kingdom', 'ECR, Chennai, Tamil Nadu');

--Event Data
insert into Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) values
('IPL Match', '2025-05-28', '19:00:00', 1, 5000000, 45000, 1500.00, 'Sports'),
('Tamil Film Music Concert', '2025-06-15', '18:30:00', 2, 600000, 58000, 2500.00, 'Concert'),
('Comedy Night with Tamil Stand-up Stars', '2025-04-20', '20:00:00', 3, 300000, 25000, 1200.00, 'Movie'),
('Madurai Jallikattu Championship', '2025-07-10', '17:00:00', 4, 800000, 70000, 1000.00, 'Sports'),
('Carnatic Classical Night', '2025-06-30', '19:30:00', 6, 250000, 24000, 1800.00, 'Concert'),
('Tamil Film Awards Night', '2025-08-05', '19:00:00', 5, 350000, 30000, 2000.00, 'Movie'),
('Rock Band Night - Chennai Edition', '2025-09-12', '20:00:00', 7, 400000, 35000, 2200.00, 'Concert'),
('Kabaddi Premier League', '2025-10-18', '18:00:00', 8, 450000, 40000, 1300.00, 'Sports'),
('Kollywood Film Premiere', '2025-11-25', '21:00:00', 9, 200000, 18000, 1700.00, 'Movie'),
('New Year Countdown Concert', '2025-12-31', '22:00:00', 10, 700000, 65000, 3000.00, 'Concert');

--Customer Data
insert into Customer (customer_name, email, phone_number) values
('Arun Kumar', 'arun.kumar@gmail.com', 9876543210),
('Divya Rajendran', 'divya.raj@gmail.com', 8765432109),
('Praveen Kumar', 'praveen.kumar@gmail.com', 7654321098),
('Meena Ramesh', 'meena.ramesh@gmail.com', 6543210987),
('Vignesh Ravi', 'vignesh.ravi@gmail.com', 7896541230),
('Kavitha Ram', 'kavitha.ram@gmail.com', 9988776655),
('Suresh Iyer', 'suresh.iyer@gmail.com', 8899776655),
('Santhosh Narayanan', 'santhosh.narayan@gmail.com', 7788996655),
('Karthik Subramanian', 'karthik.subramanian@gmail.com', 6677889900),
('Deepa Chandran', 'deepa.chandran@gmail.com', 5566778899);

--Booking Data
insert into Booking (customer_id, event_id, num_tickets, total_cost, booking_date) values
(1, 1, 2, 3000, '2025-05-15'),
(2, 2, 4, 10000, '2025-06-05'),
(3, 3, 1, 1200, '2025-04-10'),
(4, 4, 3, 3000, '2025-07-01'),
(5, 5, 2, 3600, '2025-06-20'),
(6, 6, 5, 10000, '2025-07-30'),
(7, 7, 6, 13200, '2025-08-25'),
(8, 8, 3, 3900, '2025-09-10'),
(9, 9, 1, 1700, '2025-10-30'),
(10, 10, 2, 6000, '2025-12-20');

--Booking id in the Event table
UPDATE Event 
SET Event.booking_id = CASE 
    WHEN event_name = 'IPL Match' THEN 1  
    WHEN event_name = 'Tamil Film Music Concert' THEN 2  
    WHEN event_name = 'Comedy Night with Tamil Stand-up Stars' THEN 3  
    WHEN event_name = 'Madurai Jallikattu Championship' THEN 4  
    WHEN event_name = 'Carnatic Classical Night' THEN 5  
    WHEN event_name = 'Tamil Film Awards Night' THEN 6  
    WHEN event_name = 'Rock Band Night - Chennai Edition' THEN 7  
    WHEN event_name = 'Kabaddi Premier League' THEN 8  
    WHEN event_name = 'Kollywood Film Premiere' THEN 9  
    WHEN event_name = 'New Year Countdown Concert' THEN 10  
END
WHERE booking_id IS NULL;

--Update the booking id in the Customer table
UPDATE Customer 
SET booking_id = CASE 
    WHEN customer_name = 'Arun Kumar' THEN 1  
    WHEN customer_name = 'Divya Rajendran' THEN 2  
    WHEN customer_name = 'Praveen Kumar' THEN 3  
    WHEN customer_name = 'Meena Ramesh' THEN 4  
    WHEN customer_name = 'Vignesh Ravi' THEN 5  
    WHEN customer_name = 'Kavitha Ram' THEN 6  
    WHEN customer_name = 'Suresh Iyer' THEN 7  
    WHEN customer_name = 'Santhosh Narayanan' THEN 8  
    WHEN customer_name = 'Karthik Subramanian' THEN 9  
    WHEN customer_name = 'Deepa Chandran' THEN 10  
END
WHERE booking_id IS NULL;

-- 2. List all Events
Select * from Event

-- 3. Select events with available tickets
Select * from Event where available_seats>0

-- 4. Select events name partial match with ‘cup’
Select * from Event where event_name='%cup%'

-- 5. Select events with ticket price range between 1000 to 2500
Select * from Event where ticket_price between 1000 and 2500

-- 6. Retrieve events with dates within a specific range
Select * from Event where event_date between '2025-01-01' and '2025-12-30'

-- 7. Retrieve available tickets that have "Concert" in their name
Select * from Event where event_type='Concert' and available_seats>0

-- 8. Retrieve users in batches of 5, starting from the 6th user
Select * from Customer order by customer_id offset 5 rows fetch next 5 rows only

-- 9. Retrieve booking details where booked tickets are more than 4
Select * from Booking where num_tickets>4

-- 10. Retrieve customer information whose phone number ends with ‘000’
Select * from Customer where phone_number like '%000'

-- 11. Retrieve events with seat capacity more than 15000
Select * from Event where total_seats>15000 order by total_seats asc

-- 12. Select events name not starting with ‘x’, ‘y’, ‘z’
Select * from Event where event_name not like 'x%' and event_name not like 'y%' and event_name not like 'z%'
