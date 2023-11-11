select a.name as customer_name, b.customer_id, b.order_id, b.order_date
from customers a
join (
    select customer_id, order_id, order_date, 
        rank() over(partition by customer_id order by order_date desc) as ranking
    from orders
) b
on a.customer_id = b.customer_id
where ranking <= 3
order by a.name, b.customer_id, b.order_date desc

--------------------------------------------------------------------------------------------
    
Oracle SQL answer:

SELECT c.name AS customer_name, c.customer_id, o1.order_id, o1.order_date
FROM Customers c
INNER JOIN Orders o1 ON c.customer_id = o1.customer_id
LEFT JOIN Orders o2 ON o1.customer_id = o2.customer_id AND o1.order_date <= o2.order_date
GROUP BY c.name, c.customer_id, o1.order_id, o1.order_date
HAVING COUNT(*) <= 3
ORDER BY c.name, c.customer_id, o1.order_date DESC;

