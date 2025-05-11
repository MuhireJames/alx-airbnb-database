
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

## 🔧 Adjusted Schema for 3NF

### 🔸1. Property Table
**Issue:** Redundant storage of host details (host_id linked to User table).
- ✅ Already normalized via foreign key.

### 🔸2. Booking Table
**Issue:** No redundant data. `total_price` is a derived value but acceptable for performance reasons.
- 💡 Optionally, calculate `total_price` via query logic instead of storage.

### 🔸3. Payment Table
**Issue:** No transitive dependency. Every field depends solely on `payment_id`.

### 🔸4. Review Table
**Potential Improvement:** Link reviews directly to `booking_id` to ensure only reviewers who booked can submit reviews.

```sql
Review (
    review_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES Booking(booking_id),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
```

Then, `property_id` and `user_id` can be derived from the `Booking` record:
- ✅ Eliminates transitive dependency via Booking.

### 🔸5. Message Table
**Issue:** All fields are atomic and directly dependent on `message_id`.

---

## ✅ Final Adjusted Schema Summary

| Table     | Action Taken                                 | Justification |
|-----------|----------------------------------------------|---------------|
| Review    | Replaced `property_id` and `user_id` with `booking_id` | Removes transitive dependencies |
| Booking   | Optional: Calculate `total_price` dynamically | Not required, but improves normalization |
| Others    | No change                                     | Already in 3NF |

---
