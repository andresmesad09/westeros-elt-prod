create or replace table `westeros-project.westeros_dtlk_qty_prod.orderdetails_qty` (orderNumber int64,
productCode string,
quantityOrdered int64,
priceEach float64,
orderLineNumber string)
;
insert `westeros-project.westeros_dtlk_qty_prod.orderdetails_qty`

select * from (
  select orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber from `westeros-project.westeros_dtlk_raw_prod.orderdetails`
)
;