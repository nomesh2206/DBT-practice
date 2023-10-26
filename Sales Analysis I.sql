Table: Product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id is the primary key of this table.

Table: Sales
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.
Write an SQL query that reports the best seller by total sales price. If there is a tie, report them all.

Answer:
  
SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (
    SELECT MAX(total_price)
    FROM (
        SELECT seller_id, SUM(price) AS total_price
        FROM Sales
        GROUP BY seller_id
    )
);

-- In this version, the subquery calculates the total price for each seller, and the outer query then compares the sum of prices for each seller with the maximum total price to identify the seller with
-- the maximum sum of prices.
-- This approach eliminates the need for window functions, and it uses basic aggregation and subqueries. Let me know if you have any questions or if there's anything else I can help you with!





