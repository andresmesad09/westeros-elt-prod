SELECT CONCAT(EXTRACT(YEAR FROM orderDate),LPAD(CAST(EXTRACT(MONTH FROM orderDate) AS STRING),2,"0")) AS periodo, ROUND(sum(totalSale),2) as TotalSale
from `westeros-project.westeros_dtlk_stg_prod.westeros_stg_table`
WHERE status = 'Shipped'
group by CONCAT(EXTRACT(YEAR FROM orderDate),LPAD(CAST(EXTRACT(MONTH FROM orderDate) AS STRING),2,"0"))
