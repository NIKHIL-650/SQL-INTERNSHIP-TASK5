# SQL Joins – Task 5

This project demonstrates different types of SQL joins using sample `customers`, `orders`, `products`, `order_items`, and `employees` tables.

It covers:
1. INNER JOIN
2. LEFT JOIN
3. RIGHT JOIN (MySQL) / Emulation in SQLite
4. FULL OUTER JOIN (emulation)
5. CROSS JOIN
6. NATURAL JOIN
7. SELF-JOIN
8. Joining more than 2 tables
9. Nested joins
10. Joins without foreign keys
11. Cartesian product example
12. Optimization (indexing)

---

## 📂 Project Structure
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
-- MySQL:
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- SQLite emulation:
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id;
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT o.customer_id, NULL AS name, o.order_id, o.amount
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

---

Do you want me to also **bundle the schema, sample data, and all 12 join queries** into separate `.sql` files so your GitHub repo is ready in one go? That way you can just upload and push.


