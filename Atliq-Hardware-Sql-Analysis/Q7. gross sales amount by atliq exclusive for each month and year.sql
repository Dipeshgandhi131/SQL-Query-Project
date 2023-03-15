SELECT monthname(fsm.date) as month , extract(year from fsm.date) as year, round(sum(sold_quantity*gross_price),2) as gross_sales_amount
FROM fact_sales_monthly as fsm
inner join fact_gross_price as fgp ON fsm.product_code = fgp.product_code and fgp.fiscal_year = fsm.fiscal_year
where customer_code IN (select distinct customer_code from dim_customer where customer = 'Atliq Exclusive')
group by month,year 
order by year, extract(month from fsm.date)  
