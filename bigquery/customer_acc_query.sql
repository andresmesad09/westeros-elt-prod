create or replace table `westeros-project.westeros_dtlk_acc_prod.customers_acc` (
customerNumber int64,
city string,
country string,
salesRepEmployeeNumber int64,
creditLimit float64
)

;
insert `westeros-project.westeros_dtlk_acc_prod.customers_acc`

select * from (
  select customerNumber,
city,
country,
salesRepEmployeeNumber,
creditLimit
from `westeros-project.westeros_dtlk_qty_prod.customers_qty`
)
;