CREATE DATABASE ecomm_returns;
USE ecomm_returns;

CREATE TABLE ecomm_returns (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    category VARCHAR(50),
    supplier VARCHAR(50),
    price DECIMAL(10,2),
    quantity INT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    marketing_channel VARCHAR(50),
    returned INT
);

INSERT INTO ecomm_returns VALUES
(101, 1, '2024-01-05', 1001, 'Electronics', 'Supplier A', 25000, 1, 'Mumbai', 'Maharashtra', 'India', 'Google Ads', 1),
(102, 2, '2024-01-10', 1002, 'Fashion', 'Supplier B', 3000, 2, 'Delhi', 'Delhi', 'India', 'Instagram', 0),
(103, 3, '2024-01-15', 1003, 'Home', 'Supplier C', 5000, 1, 'Pune', 'Maharashtra', 'India', 'Email', 1),
(104, 4, '2024-01-18', 1004, 'Electronics', 'Supplier A', 45000, 1, 'Bangalore', 'Karnataka', 'India', 'Facebook', 0),
(105, 5, '2024-01-20', 1005, 'Fashion', 'Supplier B', 2000, 3, 'Chennai', 'Tamil Nadu', 'India', 'Influencer', 1);

DELETE FROM ecomm_returns
WHERE category IS NULL OR supplier IS NULL;

UPDATE ecomm_returns
SET returned = 0
WHERE returned NOT IN (0,1);

SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(returned) AS returned_orders,
    ROUND(SUM(returned)*100.0 / COUNT(*), 2) AS return_rate_pct
FROM ecomm_returns
GROUP BY category;

SELECT
    supplier,
    COUNT(*) AS total_orders,
    SUM(returned) AS returned_orders,
    ROUND(SUM(returned)*100.0 / COUNT(*), 2) AS return_rate_pct
FROM ecomm_returns
GROUP BY supplier;

SELECT
    state,
    ROUND(SUM(returned)*100.0 / COUNT(*), 2) AS return_rate_pct
FROM ecomm_returns
GROUP BY state;

SELECT
    marketing_channel,
    ROUND(SUM(returned)*100.0 / COUNT(*), 2) AS return_rate_pct
FROM ecomm_returns
GROUP BY marketing_channel;


