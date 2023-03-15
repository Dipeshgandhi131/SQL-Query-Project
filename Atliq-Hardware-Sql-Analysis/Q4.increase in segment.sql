with 
fact as (SELECT dp.product_code , dp.segment, fmc.cost_year 
FROM dim_product as dp
left join fact_manufacturing_cost as fmc On dp.product_code=fmc.product_code),

fact1 as (select segment, count(distinct product_code) as product_count_2020
from fact where cost_year= 2020 group by segment ),

fact2 as (select segment, count(distinct product_code) as product_count_2021
from fact where cost_year= 2021 group by segment )

select f1.segment,product_count_2020,product_count_2021,product_count_2021-product_count_2020 as difference
from fact1 as f1
inner join fact2 as f2 on f1.segment = f2.segment
order by difference desc