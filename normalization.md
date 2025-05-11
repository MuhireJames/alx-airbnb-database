
# 📘 Database Normalization to 3NF

## ✅ Objective
To ensure that the provided schema adheres to the principles of the **Third Normal Form (3NF)** by eliminating redundancy, ensuring atomicity, and removing transitive dependencies.

---

## 🧩 Step-by-Step Normalization

### 1NF – First Normal Form
**Goal:** Eliminate repeating groups; ensure atomic values.

✅ Your schema already meets 1NF:
- All fields contain only atomic (indivisible) values.
- There are no repeating groups or arrays.

---

### 2NF – Second Normal Form
**Goal:** Remove partial dependencies (non-prime attributes must depend on the whole primary key).

✅ The schema uses UUIDs as primary keys, not composite keys, so no partial dependencies exist.

---

### 3NF – Third Normal Form
**Goal:** Remove transitive dependencies (non-prime attributes must depend only on the primary key).

🔍 **Identified Issues:**
1. **No clear transitive dependencies** in the current schema. All non-key attributes are directly dependent on their table's primary key.
2. **Minor improvements** suggested to further enforce normalization:

---

## ✅ Final Adjusted Schema Summary

# 📘 Database Schema in 3rd Normal Form (3NF)

This document presents the final schema after normalization to **Third Normal Form (3NF)**, using relational symbols to clearly define relationships and constraints.

---
## 👤 User
**User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)**

- PK: user_id
- email: UNIQUE
- role ∈ {guest, host, admin}

---

## 🏠 Property
**Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)**

- PK: property_id  
- FK: host_id → User(user_id)

---

## 📅 Booking
**Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)**

- PK: booking_id  
- FK: property_id → Property(property_id)  
- FK: user_id → User(user_id)  
- status ∈ {pending, confirmed, canceled}

---

## 💳 Payment
**Payment(payment_id, booking_id, amount, payment_date, payment_method)**

- PK: payment_id  
- FK: booking_id → Booking(booking_id)  
- payment_method ∈ {credit_card, paypal, stripe}

---

## ⭐ Review (Normalized)
**Review(review_id, booking_id, rating, comment, created_at)**

- PK: review_id  
- FK: booking_id → Booking(booking_id)  
- rating ∈ [1, 5]

---

## 💬 Message
**Message(message_id, sender_id, recipient_id, message_body, sent_at)**

- PK: message_id  
- FK: sender_id → User(user_id)  
- FK: recipient_id → User(user_id)

---

## ✅ 3NF Summary

| Table    | Primary Key   | Foreign Keys                                | Normalization Notes                                      |
|----------|---------------|---------------------------------------------|----------------------------------------------------------|
| User     | user_id       | —                                           | Atomic, no transitive dependencies                       |
| Property | property_id   | host_id → User(user_id)                    | Fully functionally dependent on primary key              |
| Booking  | booking_id    | property_id, user_id                       | All fields depend solely on booking_id                   |
| Payment  | payment_id    | booking_id → Booking(booking_id)           | No derived or redundant attributes                       |
| Review   | review_id     | booking_id → Booking(booking_id)           | user_id/property_id derivable, avoids transitive dep.    |
| Message  | message_id    | sender_id, recipient_id → User(user_id)    | Clean, atomic messaging structure                        |

---


---
