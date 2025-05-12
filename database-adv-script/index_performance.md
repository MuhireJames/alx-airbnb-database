# Indexing and Performance Analysis

## 🎯 Objective
This document outlines the indexing strategy applied to key tables (`User`, `Property`, and `Booking`) in order to optimize query performance. It also includes examples of how to measure the effect of indexing using `EXPLAIN` and `ANALYZE`.

---

## 🔍 Indexing Strategy

### 📌 User Table
- `email`: Frequently used for login or lookups.
  ```sql
  CREATE INDEX idx_user_email ON User(email);
  ```
- `role`: Used to filter users by type (guest, host, admin).
  ```sql
  CREATE INDEX idx_user_role ON User(role);
  ```

### 🏡 Property Table
- `location`: Often used in search filters.
  ```sql
  CREATE INDEX idx_property_location ON Property(location);
  ```
- `pricepernight`: Used in price range filters.
  ```sql
  CREATE INDEX idx_property_price ON Property(pricepernight);
  ```

### 📅 Booking Table
- `user_id`: For JOIN operations to associate bookings with users.
  ```sql
  CREATE INDEX idx_booking_user_id ON Booking(user_id);
  ```
- `property_id`: For JOINs and filtering bookings by property.
  ```sql
  CREATE INDEX idx_booking_property_id ON Booking(property_id);
  ```
- `status`: Common filter to track booking progress.
  ```sql
  CREATE INDEX idx_booking_status ON Booking(status);
  ```

---

## ⚙️ Measuring Index Performance

Use `EXPLAIN` or `EXPLAIN ANALYZE` to check query plans and execution times before and after indexing.

### Example
```sql
-- Before indexing
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York' AND pricepernight < 200;

-- After indexing (using idx_property_location and idx_property_price)
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York' AND pricepernight < 200;
```

### Expected Improvements
- Reduced full table scans
- Improved filtering performance
- Faster JOIN and WHERE clause evaluations

---

## ✅ Conclusion
Proper indexing significantly enhances query efficiency, especially in read-heavy applications like property searches and booking lookups. Always monitor performance impact with `EXPLAIN` and fine-tune index usage based on query patterns.
