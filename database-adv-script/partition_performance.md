
# Partitioning Performance Report

## Objective
To improve query performance on a large `Booking` table by partitioning it based on the `start_date`.

## Implementation
- Created a partitioned table `Booking_Partitioned` with partitions for years 2023, 2024, and 2025.
- Each partition handles a specific date range based on the `start_date`.

## Performance Observations
- Queries that filtered by `start_date` range scanned only relevant partitions, not the entire dataset.
- The `EXPLAIN` plan showed reduced I/O operations and faster estimated execution times.
- Overall, the partitioning significantly improved the efficiency of date-specific queries.

## Conclusion
Partitioning by `start_date` is an effective optimization strategy for large temporal datasets such as bookings. This should be paired with proper indexing within partitions for best results.
