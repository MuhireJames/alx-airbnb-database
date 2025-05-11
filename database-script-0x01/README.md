
# 🗂️ Normalized Database Schema (3NF)

This repository contains the SQL script to create a fully normalized relational database schema designed for a property rental platform. The schema adheres to the **Third Normal Form (3NF)** for optimal data integrity and reduced redundancy.

---

## 📄 File

- `Normalized_Database_Schema.sql` – Contains `CREATE TABLE` statements for all entities, with constraints, foreign keys, and indexes.

---

## 🧱 Entity Overview

### 👤 User
Stores all platform users with roles (`guest`, `host`, `admin`).

### 🏠 Property
Listings created by hosts, including metadata like description, location, and price.

### 📅 Booking
Records reservations made by users for properties.

### 💳 Payment
Tracks payments linked to bookings, supporting multiple methods.

### ⭐ Review (Normalized)
Captures user reviews based on actual bookings (linked by `booking_id`).

### 💬 Message
Facilitates communication between users (guests, hosts, admins).

---

## 🔐 Constraints and Integrity

- **Primary Keys** on all main identifiers (UUIDs).
- **Foreign Keys** for referential integrity between entities.
- **Enums** for constrained fields (e.g., user role, booking status, payment method).
- **CHECK constraints** on ratings.
- **Indexes** for improved query performance on frequently accessed fields.

---


