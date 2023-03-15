with cte as (SELECT quarter(date)-1 as quarter , sum(sold_quantity) as total_sold_quantities FROM fact_sales_monthly
where fiscal_year = 2020
group by quarter)

select 
   case
     when quarter = 1 then 'Q!' 
     when quarter = 2 then 'Q2'
     when quarter = 3 then 'Q3' else 'Q4' 
	End as quarter ,
    total_sold_quantities
from cte
order by 2 desc
    
    

     