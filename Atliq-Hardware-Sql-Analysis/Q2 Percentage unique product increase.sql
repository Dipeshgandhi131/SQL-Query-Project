with result1 as (SELECT count(distinct product_code) as p1
 FROM fact_sales_monthly where extract(year from date) = 2020),
result2 as (SELECT count(distinct product_code) as p2 FROM fact_sales_monthly where extract(year from date) = 2021)
 
 
 select p1 as unique_products_2020,
        p2 as unique_products_2021,
        Round(((p2-p1)/p1)*100.0,2) as percentage_chg
 from result1
 Cross join result2