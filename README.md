# Banking cusotmer analytics usin SQL

## Project overview 
This project simulates a real-world banking analytics use case.
The objective is to analyze customer transactions to identify:
- High-value cusotmers
- Monthly transaction trends
- Revenue ranking
- Customer segmentation
- Customers with no transactions

 ------

 ## Database design
 Two relational tables were created:
 1. customers
 2. transactions

Relationship:
- One customer can have multiple transactions
- Foreign key constraint ensures referential integrity

------

## SQL concepts demonstrated
- Inner Join & Left join
- Group By & HAVING CLAUSE
- Aggregate Functions
- Window Functions
- Running totals
- Case-based customer segmentation
- Subqueries
- Business analytics queries

------

## Key business analysis
1. Total transaction value per customer
2. Identification of high-value customers
3. Monthly transaction trend analysis
4. Ranking customers by revenue
5. Running revenue totals over time
6. Customer segmentation
7. Customers with no transactions

------

## Business insights
- Revenue concentration identified among top-ranked customers.
- Customer segmentation helps design targeted marketing stratergies.
- Running total provides visibility into revenue growth pattern.
- Inactive customers can be falgged for retention campaigns.

------

## Project structure
- schema.sql -> database structure
- data.sql -> sample dataset
- analysis_queries.sql -> analysis queries

------

-- Diksha Pandit
