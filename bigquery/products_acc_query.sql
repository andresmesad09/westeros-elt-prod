create or replace table `westeros-project.westeros_dtlk_acc_prod.products_acc` (
productCode string,
productName string,
productLine string,
quantityInStock int64,
buyPrice float64,
MSRP float64)

;
insert `westeros-project.westeros_dtlk_acc_prod.products_acc`

select * from (
  select productCode,productName,productLine,quantityInStock,buyPrice,MSRP
from `westeros-project.westeros_dtlk_qty_prod.products_qty`
)
;