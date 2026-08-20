-- =========================================
-- UK Supermarket Data Quality Project
-- File: 01_basic_queries.sql
-- Purpose: Basic exploratory SQL queries
-- =========================================
-- Combine all supermarkets into one dataset
SELECT * FROM aldi
UNION ALL
SELECT * FROM asda
UNION ALL
SELECT * FROM morrisons
UNION ALL
SELECT * FROM sains
UNION ALL
SELECT * FROM tesco;
-- Count products by supermarket
SELECT supermarket, COUNT(*) AS total_records
FROM (
    SELECT * FROM aldi
    UNION ALL
    SELECT * FROM asda
    UNION ALL
    SELECT * FROM morrisons
    UNION ALL
    SELECT * FROM sains
    UNION ALL
    SELECT * FROM tesco
) AS all_products
GROUP BY supermarket
ORDER BY total_records DESC;
-- Average product price by supermarket
SELECT supermarket,
       ROUND(AVG([prices_(£)]), 2) AS avg_price
FROM (
    SELECT * FROM aldi
    UNION ALL
    SELECT * FROM asda
    UNION ALL
    SELECT * FROM morrisons
    UNION ALL
    SELECT * FROM sains
    UNION ALL
    SELECT * FROM tesco
) AS all_products
GROUP BY supermarket
ORDER BY avg_price ASC;
-- Interpretation:
-- This query compares the average product price across supermarkets.
-- Lower values suggest a cheaper overall product mix, while higher values
-- may indicate a greater proportion of premium products.
