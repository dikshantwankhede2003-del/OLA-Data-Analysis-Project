-- retrive all successful bookings
create view successfulbookings as
SELECT * from bookings where Booking_Status='Success';
select* from successfulbookings;

-- find average ride distance for each vehicle type
create View ride_distance_for_each_vehicle as
select Vehicle_Type ,avg(Ride_Distance)
as avg_distance from bookings group by Vehicle_Type;
select* from ride_distance_for_each_vehicle;

-- get the total number of cancelled rides by customers
create view canceled_rides_by_Customers as
SELECT count(*) from bookings where Booking_Status='Canceled by Customer';
select *from  canceled_rides_by_Customers;

-- list top 5 customers who booked the highest number of rides
create VIEW top_5_customers as
select Customer_ID,count (Booking_ID) as total_rides
from bookings group by Customer_ID
ORDER BY total_rides Desc limit 5;
select *from top_5_customers ;

-- get number of rides canceled by driver due to personal and car_related issues
create view cancled_rides_by_Driver_personal_car_issue as
select count(*)  as cancled from bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';
select *from cancled_rides_by_Driver_personal_car_issue;    

-- find the maximun and minimum driver rating for  prime sedan bookings
create view max_min_driver_rating_prime_sedan as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type='Prime Sedan';
select *from max_min_driver_rating_prime_sedan;

-- retrive all teh rides where payment was made using UPI
create view upi_payments AS
select * from bookings where Payment_Method='UPI';
select * from   upi_payments;

-- find the average customer rating per vehicle type
create view average_customer_rating_per_vehicle_type as
select Vehicle_Type,avg(Customer_Rating) as average
from bookings group by Vehicle_Type;
select *from average_customer_rating_per_vehicle_type;

-- calculate total bookings value completed successfully
create view total_booking_value_successful as
select sum(Booking_Value) as total_booking_value from bookings where Booking_Status='Success';
select* from total_booking_value_successful;

-- list all incomplete rides along with the reason
create view incomplete_rides_with_reason as
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides='Yes';
select * from incomplete_rides_with_reason;
