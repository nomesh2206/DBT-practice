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
