-- Retention Metrics (Practice)
SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    COUNT(DISTINCT customer_id) AS new_customers,
    COUNT(DISTINCT CASE WHEN is_retained THEN customer_id END) AS retained_customers,
    COUNT(DISTINCT CASE WHEN is_retained THEN customer_id END) / COUNT(DISTINCT customer_id) AS retention_rate
FROM orders
GROUP BY 1
ORDER BY 1;