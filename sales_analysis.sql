-- Sales Analysis Project

-- Total revenue
SELECT SUM(sales) AS total_revenue
FROM orders;

-- Revenue by product category
SELECT product_category,
       SUM(sales) AS category_revenue
FROM orders
GROUP BY product_category
ORDER BY category_revenue DESC;

-- Top 10 customers by spending
SELECT customer_id,
       SUM(sales) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Monthly revenue trend
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(sales) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Average order value
SELECT AVG(sales) AS avg_order_value
FROM orders;

-- Running revenue total
SELECT order_date,
       sales,
       SUM(sales) OVER (ORDER BY order_date) AS cumulative_revenue
FROM orders;
