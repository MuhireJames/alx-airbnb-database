# SQL Join Queries

This project contains SQL queries demonstrating different types of JOIN operations in a relational database, using a schema inspired by an Airbnb-like platform. Each query showcases how to retrieve data by combining multiple tables.

## Queries Included

### 1. INNER JOIN - Bookings and Users
```sql
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;
```
- Retrieves all bookings along with details of the users who made them.
- Only includes records where a booking is associated with a user.

### 2. LEFT JOIN - Properties and Reviews
```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;
```
- Retrieves all properties, including those that do not have any reviews.
- Useful for showing listings with or without user feedback.

### 3. FULL OUTER JOIN - Users and Bookings
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM User u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
```
- Retrieves all users and all bookings, regardless of whether they are connected.
- Includes users who haven’t booked and bookings not linked to users (for PostgreSQL).

### 4. MySQL Workaround for FULL OUTER JOIN (Using UNION)
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM User u
RIGHT JOIN Booking b ON u.user_id = b.user_id;
```
- Combines LEFT and RIGHT joins to simulate a FULL OUTER JOIN in databases like MySQL that do not natively support it.

## Usage
These queries are designed to be executed in SQL-compatible databases such as PostgreSQL or MySQL. Modify table or column names as needed based on your schema.

