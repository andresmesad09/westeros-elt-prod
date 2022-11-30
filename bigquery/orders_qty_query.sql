create or replace table `westeros-project.westeros_dtlk_qty_prod.orders_qty` (orderNumber int64,orderDate date,,requiredDate date,shippedDate date,status string,comments string,customerNumber int64)

;
insert `westeros-project.westeros_dtlk_qty_prod.orders_qty`

select * from (
  SELECT orderNumber,orderDate,requiredDate,
case when shippedDate is null then '1900-01-01'
else shippedDate end as shippedDate,
case when status is null then ''
else status end as status,
case when comments is null then ''
else comments end as comments,
customerNumber
FROM `westeros-project.westeros_dtlk_raw_prod.orders` 
)
;



