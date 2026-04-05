-- Monthly Revenue (Practice)
SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    SUM(amount) AS Revenue
FROM orders
GROUP BY 1
ORDER BY 1;