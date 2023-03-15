SELECT dp.product  ,dp.product_code,fmc.manufacturing_cost as manufacturing_cost
FROM dim_product as dp
left join fact_manufacturing_cost as fmc On dp.product_code=fmc.product_code
where manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
union 
SELECT dp.product  ,dp.product_code,fmc.manufacturing_cost as manufacturing_cost
FROM dim_product as dp
left join fact_manufacturing_cost as fmc On dp.product_code=fmc.product_code
where manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)