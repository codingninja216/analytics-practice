-- Retention Metrics (Practice)
WITH customer_metrics AS (
    SELECT
        DATE_TRUNC(order_date, MONTH) AS month,
        customer_id,
        is_retained,
    FROM orders
)

SELECT
    month,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN is_retained THEN customer_id END) AS retained_customers,
    SAFE_DIVIDE(COUNT(DISTINCT CASE WHEN is_retained THEN customer_id END), 
                    COUNT(DISTINCT customer_id)) * 100
                     AS retention_rate
FROM customer_metrics
GROUP BY month
ORDER BY month;