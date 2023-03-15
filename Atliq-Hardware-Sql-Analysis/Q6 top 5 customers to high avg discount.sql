SELECT dc.customer_code,dc.customer,round(avg(fpid.pre_invoice_discount_pct),2) as average_discount_percentage
FROM fact_pre_invoice_deductions as fpid
Left Join dim_customer as dc on fpid.customer_code = dc.customer_code
where dc.market='India' and fpid.fiscal_year = 2021
group by dc.customer_code,dc.customer
order by average_discount_percentage Desc Limit 5;