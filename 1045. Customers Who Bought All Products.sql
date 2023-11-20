Select  C.customer_id 
from Customer C
left join Product P
on  C.product_key = P.product_key  
group by C.customer_id
having  (select count(*) from Product ) =  count( distinct C.product_key )
order by C.customer_id
