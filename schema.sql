CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  city VARCHAR(50),
  account_type VARCHAR(50),
  joining_date DATE
);

CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  customer_id INT,
  transaction_date DATE,
  amount DECIMAL(10,2),
  transaction_type VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
