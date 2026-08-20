-- =========================================
-- UK Supermarket Data Quality Project
-- File: 02_category_analysis.sql
-- Purpose: Category-level business analysis
-- =========================================

-- Cheapest supermarket within each category
SELECT category,
supermarket,
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
GROUP BY category, supermarket
ORDER BY category, avg_price ASC;

-- Average price by category
SELECT category,
ROUND(AVG([prices_(£)]), 2) AS avg_category_price
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
GROUP BY category
ORDER BY avg_category_price DESC;

-- Own-brand share by supermarket
SELECT supermarket,
COUNT(*) AS total_products,
SUM(CASE WHEN own_brand = 1 THEN 1 ELSE 0 END) AS own_brand_products,
ROUND(
100.0 * SUM(CASE WHEN own_brand = 1 THEN 1 ELSE 0 END) / COUNT(*),
2
) AS own_brand_percentage
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
ORDER BY own_brand_percentage DESC;

-- Interpretation:
-- 1. The first query compares supermarket pricing within each category.
-- 2. The second query identifies the most expensive categories overall.
-- 3. The third query measures the proportion of own-brand products for each supermarket.
