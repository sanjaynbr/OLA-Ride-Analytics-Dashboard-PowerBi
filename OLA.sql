create database Ola;
use ola;
select * from [dbo].[Bookings]

alter table [dbo].[Bookings]
drop column Vehicle_Images;

ALTER TABLE [dbo].[Bookings]
ALTER COLUMN Ride_Distance FLOAT;
ALTER TABLE [dbo].[Bookings]
ALTER COLUMN customer_rating FLOAT;

--All Successful Bookings	
select * from [dbo].[Bookings] where Booking_status='Success'

--average ride distance for each vehicle type
select AVG(Ride_Distance) AS Avg_Distance,Vehicle_type from [dbo].[Bookings] group by Vehicle_type

-- Get the total number of cancelled rides by customers
select count(*) [Total Number of Rides Cancelled by Customers] from [dbo].[Bookings] where Booking_status='Canceled by Customer'

-- List the top 5 customers who booked the highest number of rides

select top 5 customer_id,count(Booking_ID) [Total Rides] from [dbo].[bookings] group by customer_id order by [Total Rides] desc;

--Get the number of rides cancelled by drivers due to personal and car-related issues

select count(Canceled_Rides_by_Driver) [Total Rides Cancelled] from [dbo].[bookings] where canceled_rides_by_driver in ('Personal & Car related issue')

-- Find the maximum and minimum driver ratings for Prime Sedan bookings
select max(Driver_Ratings)  [Maxmimum Rating],min(Driver_ratings) [Minimum Rating] from [dbo].[bookings] where Vehicle_Type in ('Prime Sedan')

--Retrieve all rides where payment was made using UPI
select * from [dbo].[bookings] where Payment_method in ('UPI')

--Find the average customer rating per vehicle type

SELECT AVG(Customer_Rating) AS [Avg Rating],Vehicle_Type FROM [dbo].[Bookings] GROUP BY Vehicle_Type ORDER BY [Avg Rating] DESC;

--Calculate the total booking value of rides completed successfully

select sum(booking_value) [Total Booking Value] from [dbo].[bookings] where booking_status in ('Success')


Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success'

SELECT * 
FROM Successful_Bookings;