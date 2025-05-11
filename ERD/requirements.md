🏠 Booking Platform Database Schema
👤 User
🔑 user_id (UUID, Primary Key, Indexed)

🧑 first_name (VARCHAR, NOT NULL)

🧑‍🦰 last_name (VARCHAR, NOT NULL)

📧 email (VARCHAR, UNIQUE, NOT NULL) 🔍 (Indexed)

🔒 password_hash (VARCHAR, NOT NULL)

📞 phone_number (VARCHAR, NULLABLE)

🎭 role (ENUM: guest, host, admin, NOT NULL)

🕒 created_at (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

✅ Constraints:
Unique constraint on email

Non-null for all required fields

🏘️ Property
🔑 property_id (UUID, Primary Key, Indexed)

🧑‍💼 host_id (UUID, Foreign Key → User.user_id)

🏷️ name (VARCHAR, NOT NULL)

📝 description (TEXT, NOT NULL)

📍 location (VARCHAR, NOT NULL)

💲 pricepernight (DECIMAL, NOT NULL)

🕒 created_at (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

🔁 updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

✅ Constraints:
Foreign key on host_id

Non-null essential attributes

📅 Booking
🔑 booking_id (UUID, Primary Key, Indexed)

🏘️ property_id (UUID, Foreign Key → Property.property_id)

👤 user_id (UUID, Foreign Key → User.user_id)

🗓️ start_date (DATE, NOT NULL)

🗓️ end_date (DATE, NOT NULL)

💰 total_price (DECIMAL, NOT NULL)

🔁 status (ENUM: pending, confirmed, canceled, NOT NULL)

🕒 created_at (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

✅ Constraints:
Foreign keys on property_id and user_id

Valid ENUM values for status

💳 Payment
🔑 payment_id (UUID, Primary Key, Indexed)

📅 booking_id (UUID, Foreign Key → Booking.booking_id)

💸 amount (DECIMAL, NOT NULL)

🕒 payment_date (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

💳 payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

✅ Constraints:
Foreign key on booking_id

⭐ Review
🔑 review_id (UUID, Primary Key, Indexed)

🏘️ property_id (UUID, Foreign Key → Property.property_id)

👤 user_id (UUID, Foreign Key → User.user_id)

🌟 rating (INTEGER, NOT NULL, CHECK: 1 ≤ rating ≤ 5)

💬 comment (TEXT, NOT NULL)

🕒 created_at (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

✅ Constraints:
Rating between 1 and 5

Foreign keys on property_id and user_id

✉️ Message
🔑 message_id (UUID, Primary Key, Indexed)

📤 sender_id (UUID, Foreign Key → User.user_id)

📥 recipient_id (UUID, Foreign Key → User.user_id)

💌 message_body (TEXT, NOT NULL)

🕒 sent_at (TIMESTAMP, DEFAULT: CURRENT_TIMESTAMP)

📈 Indexing Summary
✅ Primary Keys: Indexed automatically

🔍 Additional Indexes:

email → User

property_id → Property, Booking

booking_id → Booking, Payment
