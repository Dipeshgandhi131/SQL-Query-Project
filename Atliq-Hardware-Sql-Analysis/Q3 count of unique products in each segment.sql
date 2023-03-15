SELECT segment, count(Distinct product_code) as product_count
FROM dim_product
group by segment
order by product_count desc;