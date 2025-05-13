# Query Optimization Report

## 🎯 Objective
Improve performance of a complex SQL query that retrieves booking, user, property, and payment information.

---

## 🐢 Initial Query
The original query joins four tables (Booking, User, Property, Payment) without filtering or pagination:

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```

### 🚨 Issues Identified with `EXPLAIN`
- Full table scans due to no filtering or pagination.
- LEFT JOIN on Payment returns unnecessary rows if not handled correctly.
- All data selected without relevance filtering.

---

## ⚙️ Optimization Steps

### 1. Apply Pagination
Use `LIMIT` to reduce data for UI display and stress on DB:
```sql
... 
LIMIT 100 OFFSET 0;
```

### 2. Use WHERE clause for filtering relevant results:
```sql
WHERE b.status = 'confirmed'
```

### 3. Ensure appropriate indexes exist on:
- `Booking.user_id`
- `Booking.property_id`
- `Booking.status`
- `Payment.booking_id`

### ✅ Refactored Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
LIMIT 100 OFFSET 0;
```

### 📈 Expected Benefits
- Reduced execution time
- Decreased I/O operations
- Improved user experience with faster data loading
