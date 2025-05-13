-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM Booking 
INNER JOIN User  ON Booking.user_id = User.user_id
ORDER BY Booking.start_date DESC;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Review.review_id,
    Review.rating,
    Review.comment
FROM Property
LEFT JOIN Review  ON Property.property_id = Review.property_id
ORDER BY Property.property_id, Review.rating DESC;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if not linked
-- Note: This is supported in PostgreSQL. For MySQL, use the UNION workaround below.
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User 
FULL OUTER JOIN Booking  ON User.user_id = Booking.user_id
ORDER BY User.user_id;

-- MySQL Workaround for FULL OUTER JOIN using UNION
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User
LEFT JOIN Booking  ON User.user_id = Booking.user_id

UNION

SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date
FROM User
RIGHT JOIN Booking  ON User.user_id = Booking.user_id
ORDER BY user_id;
