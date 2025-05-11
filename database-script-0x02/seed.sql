-- INSERT SAMPLE USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('1111-11111', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'guest'),
('22222222-2222', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'host'),
('33333333-3333', 'Carol', 'Davis', 'carol@example.com', 'hash3', NULL, 'admin');

-- INSERT SAMPLE PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaa1', '22222222-2222', 'Cozy Cottage', 'A small cozy cottage.', 'New York', 120.00),
('aaaaaaa2', '33333333-3333', 'Modern Apartment', 'A sleek modern apartment.', 'San Francisco', 200.00);

-- INSERT SAMPLE BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1', 'aaaaaaa1', '11111111-1111', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
('bbbbbbb2', 'aaaaaaa2', '22222222-2222', '2025-07-10', '2025-07-12', 400.00, 'pending');

-- INSERT SAMPLE PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1', 'bbbbbbb1', 480.00, 'credit_card');

-- INSERT SAMPLE REVIEWS
INSERT INTO Review (review_id, booking_id, rating, comment)
VALUES
('ddddddd1', 'bbbbbbb1', 5, 'Amazing stay, very clean and comfortable!');

-- INSERT SAMPLE MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1', '1111-11111', '22222222-2222', 'Hi Bob, is the cottage available next weekend?'),
('eeeeeee2', '22222222-2222', '11111111-1111', 'Hi Alice, yes it is available from Friday to Sunday.');
