Create Database Ecommerce_db;
use Ecommerce_db;
-- Create Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

-- Order Table 

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Insert values in Customer Table 
INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'Delhi', '2023-01-10'),
(2, 'Anita Verma', 'Mumbai', '2023-02-15'),
(3, 'Suresh Kumar', 'Bangalore', '2023-03-20'),
(4, 'Pooja Singh', 'Hyderabad', '2023-04-25'),
(5, 'Amit Patel', 'Ahmedabad', '2023-05-05');

-- Insert values in Order Table 
INSERT INTO orders VALUES
(101, 1, '2023-06-10', 12000),
(102, 1, '2023-07-15', 8000),
(103, 2, '2023-06-20', 15000),
(104, 3, '2023-08-05', 6000),
(105, 4, '2023-09-10', 10000),
(106, 2, '2023-10-15', 9000),
(107, 1, '2023-03-10', 12000),
(108, 1, '2023-02-09', 7000),
(109, 2, '2023-05-12', 25000),
(110, 3, '2023-07-05', 3000),
(111, 5, '2023-01-11', 70000);

SELECT * FROM customers;
SELECT * FROM orders;
