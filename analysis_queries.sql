-- 1. Total transaction amount per customer
SELECT c.name, SUM(t.amount) AS total_transaction_amount 
FROM customers c JOIN transaction t ON c.customer_id = t.customer_id
GROUP BY c.name;

-- 2. Identify high-value customers (Total > 10000)
SELECT c.name, SUM(t.amount) AS total_transaction_amount 
FROM customers c JOIN transaction t ON c.customer_id = t.customer_id
GROUP BY c.name
HAVING SUM(t.amount) > 10000;

-- 3. Monthly transaction trend
SELECT * FROM
(SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, SUM(amount) AS monthly_total
FROM transactions)
GROUP BY monthly_total;

-- 4. Customers with no transactions
SELECT c.name
FROM customers c LEFT JOIN transactions t ON c.customer_id=t.customer_id
WHERE t.transaction_id IS NULL;
