-- Create indexes on commonly queried columns

-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Property Table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);

-- Example: Use EXPLAIN to check query plan before/after index
-- EXPLAIN SELECT * FROM Booking WHERE status = 'confirmed';

-- EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York' AND pricepernight < 200;
