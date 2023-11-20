Select  customer_id 
from Customer 
group by customer_id
having  (select count(*) from Product ) =  count( distinct product_key )
