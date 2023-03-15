with result as (SELECT dp.division,
       dp.product_code,
	   dp.product, 
       sum(fsm.sold_quantity) as total_sold_quantity ,
       dense_rank() over(partition by dp.division order by sum(fsm.sold_quantity) desc) as rank_order 
FROM fact_sales_monthly as fsm 
left Join dim_product as dp  on fsm.product_code = dp.product_code
where fsm.fiscal_year = 2021
group by dp.division,dp.product_code,dp.product)

select division,
       product_code,
       product,
       total_sold_quantity ,
       rank_order
from result 
where rank_order in (1,2,3)
