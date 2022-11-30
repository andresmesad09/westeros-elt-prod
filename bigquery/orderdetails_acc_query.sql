create or replace table `westeros-project.westeros_dtlk_acc_prod.orderdetails_acc` (orderNumber int64,
productCode string,
quantityOrdered int64,
priceEach float64,
totalSale float64)
;
insert `westeros-project.westeros_dtlk_acc_prod.orderdetails_acc`

select * from (
  select orderNumber,productCode,quantityOrdered,priceEach,ROUND(quantityOrdered*priceEach,2) as totalSale from `westeros-project.westeros_dtlk_qty_prod.orderdetails_qty`
)
;