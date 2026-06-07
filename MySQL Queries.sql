Create database OLA;
Use OLA;

Create View Successful_Rides as
select * from Bookings where Booking_Status="Success";
select * from Successful_Rides;

Create View Vehicle_Type_Avg_Distance as
select Vehicle_Type, avg(Ride_Distance) as Avg_Distance from Bookings group by Vehicle_Type;
select * from Vehicle_Type_Avg_Distance;

Create View Cancelled_By_Customers as
select count(Booking_ID) as Number_Of_Cancelled_Rides_By_Customers from Bookings where Booking_Status="Canceled by Customer";
select * from Cancelled_By_Customers;

Create View Top_5_Customers AS
select Customer_ID, count(Booking_ID) as Total_Rides from Bookings group by Customer_ID order by Total_Rides DESC limit 5;
select * from Top_5_Customers;

Create View Cancelled_By_Driver as
select count(Booking_ID) as Number_Of_Cancelled_Rides_By_Driver from Bookings where Booking_Status="Canceled by Driver" and Canceled_Rides_by_Driver="Personal & Car related issue";
select * from Cancelled_By_Driver;

Create View Max_Min_PrimeSedan_Driver_Ratings as
select max(Driver_Ratings) as Max_PrimeSedan_Driver_Rating, min(Driver_Ratings) as Min_PrimeSedan_Driver_Rating from Bookings where Vehicle_Type="Prime Sedan";
select * from Max_Min_PrimeSedan_Driver_Ratings;

Create View Paid_By_UPI as
select * from Bookings where Payment_Method="UPI";
select * from Paid_BY_UPI;

Create View Customer_Vehicle_Type_AvgRatings as
select Vehicle_Type, Round(avg(Customer_Rating),2) as Avg_Customer_Rating from Bookings group by Vehicle_Type;
select * from Customer_Vehicle_Type_AvgRatings;

Create View Total_Successful_Rides_Value as
select sum(Booking_Value) as Total_Successful_Rides_Value from Bookings where Incomplete_Rides="No";
select * from Total_Successful_Rides_Value;

Create View Incomplete_Rides as
select Booking_ID, Incomplete_Rides_Reason from Bookings where Incomplete_Rides="Yes";
select * from Incomplete_Rides