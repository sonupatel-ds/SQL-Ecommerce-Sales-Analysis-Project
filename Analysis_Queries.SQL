-- 1. TOP CUSTOMERS ANALYSIS

-- Q1: Top 5 customers by total revenue
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

--    2. MONTHLY SALES TREND
--   Q2: Monthly sales trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(order_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- 3. CHURN ANALYSIS
-- Q3: Customers churned in last 6 months
SELECT 
    c.customer_id,
    c.customer_name,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING MAX(o.order_date) < CURRENT_DATE - INTERVAL 6 MONTH;

--  4. WINDOW FUNCTIONS
-- Q4: Rank customers by total spending
SELECT 
    customer_id,
    customer_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.order_amount) AS total_spent
    FROM customers c
    JOIN orders o 
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
) t;

-- Q5: Running total of monthly sales
SELECT 
    month,
    monthly_sales,
    SUM(monthly_sales) OVER (ORDER BY month) AS running_total
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(order_amount) AS monthly_sales
    FROM orders
    GROUP BY month
) t;


-- Q6: Previous month sales using LAG
SELECT 
    month,
    monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY month) AS previous_month_sales
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(order_amount) AS monthly_sales
    FROM orders
    GROUP BY month
) t;
