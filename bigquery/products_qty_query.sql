create or replace table `westeros-project.westeros_dtlk_qty_prod.products_qty` (
productCode string,
productName string,
productLine string,
productScale string,
productVendor string,
quantityInStock int64,
buyPrice float64,
MSRP float64)

;
insert `westeros-project.westeros_dtlk_qty_prod.products_qty`

select * from (
  select case when productCode is null then '' else productCode end as productCode, 
case when productName is null then '' else productName end as productName,
case when productLine is null then '' else productLine end as productLine,
case when productScale is null then '' else productScale end as productScale,
case when productVendor is null then '' else productVendor end as productVendor,
case when quantityInStock is null then 0 else quantityInStock end as quantityInStock,
case when buyPrice is null then 0 else buyPrice end as buyPrice,
case when MSRP is null then 0 else MSRP end as MSRP

from `westeros-project.westeros_dtlk_raw_prod.products`
)
;