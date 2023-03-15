with result as (SELECT dc.channel,
       round(sum(fsm.sold_quantity*fgp.gross_price),2) as gross_sales_mln
FROM fact_sales_monthly as fsm
inner join dim_customer as dc ON fsm.customer_code = dc.customer_code 
inner join fact_gross_price as fgp ON fsm.product_code = fgp.product_code and fgp.fiscal_year = fsm.fiscal_year
where fgp.fiscal_year = 2021
group by dc.channel )

select channel,
       format(gross_sales_mln,0) as gross_sales_mln, 
       round(gross_sales_mln/(select sum(gross_sales_mln) from result)*100,0) as percentage 
from result 
order by percentage desc