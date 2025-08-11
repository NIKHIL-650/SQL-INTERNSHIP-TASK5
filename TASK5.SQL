create database shop_db;
USE shop_db;
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  city TEXT
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT,
  amount REAL
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT,
  price REAL
);

CREATE TABLE order_items (
  id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  qty INTEGER
);

CREATE TABLE employees (
  emp_id INTEGER PRIMARY KEY,
  name TEXT,
  manager_id INTEGER
);
INSERT INTO customers (customer_id, name, email, city) VALUES
(1,'Alice','alice@example.com','Mumbai'),
(2,'Bob','bob@example.com','Delhi'),
(3,'Charlie','charlie@example.com','Bengaluru'),
(4,'Diana','diana@example.com','Chennai');  -- no orders

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101,1,'2025-07-01',250.00),
(102,2,'2025-07-02',1250.00),
(103,99,'2025-07-03',500.00); -- orphan order

INSERT INTO products (product_id, product_name, price) VALUES
(201,'Keyboard',20.0),
(202,'Mouse',10.0),
(203,'Monitor',150.0);

INSERT INTO order_items (id, order_id, product_id, qty) VALUES
(1,101,201,2),
(2,101,202,1),
(3,102,203,1),
(4,103,202,1);

INSERT INTO employees (emp_id, name, manager_id) VALUES
(1,'Sam',NULL),
(2,'Isha',1),
(3,'Raj',1),
(4,'Anya',2);
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT o.customer_id, NULL AS name, o.order_id, o.amount
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
SELECT c.name, o.order_id
FROM customers c
CROSS JOIN orders o
LIMIT 20;
SELECT *
FROM customers
NATURAL JOIN orders;
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
SELECT c.name, o.order_id, p.product_name, oi.qty, p.price, (oi.qty * p.price) AS line_total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
SELECT c.name, p.product_name
FROM (orders o JOIN order_items oi ON o.order_id = oi.order_id)
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id;
SELECT c.customer_id, c.name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.name, o.order_id
FROM customers c, orders o
WHERE 1=1; -- 1=1 matches everything
idx_orders_customer ON orders(customer_id);



  