-- 1. Total transaction amount per customer
SELECT c.name, SUM(t.amount) AS total_transaction_amount 
FROM customers c JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name;

-- 2. Identify high-value customers (Total > 10000)
SELECT c.name, SUM(t.amount) AS total_transaction_amount 
FROM customers c JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name
HAVING SUM(t.amount) > 10000;

-- 3. Monthly transaction trend
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, SUM(amount) AS monthly_total
FROM transactions GROUP BY month;

-- 4. Customers with no transactions
SELECT c.name
FROM customers c LEFT JOIN transactions t ON c.customer_id=t.customer_id
WHERE t.transaction_id IS NULL;

-- 5. Rank customers by total transaction amount
SELECT c.name, SUM(t.amount) AS total_transaction_amount, DENSE_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS drnk
FROM customers c JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name;

-- 6. Top 2 customers by revenue
SELECT * FROM (
SELECT c.name, SUM(t.amount) AS total_transaction_amount, ROW_NUMBER() OVER (ORDER BY SUM(t.amount) DESC) AS row_num
FROM customers c JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name)a
WHERE row_num <=2 ;

-- 7. Running total of transactions by date
SELECT transaction_date, SUM(amount) as daily_total, SUM(SUM(amount)) OVER (ORDER BY transaction_date) AS running_total
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date;

-- 8. Customer segmentation based on total spending
SELECT c.name, SUM(t.amount) AS total_spent,
CASE WHEN SUM(t.amount) >= 15000 THEN 'Premium'
     WHEN SUM(t.amount) BETWEEN 6000 AND 14999 THEN 'Gold'
     ELSE 'Standard'
END AS customer_segment
FROM customers c JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name;
