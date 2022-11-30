create or replace table `westeros-project.westeros_dtlk_qty_prod.customers_qty` (
customerNumber int64,
customerName string,
contactLastName string,
contactFirstName string,
phone string,
addressLine1 string,
addressLine2 string,
city string,
state string,
postalCode string,
country string,
salesRepEmployeeNumber int64,
creditLimit float64
)

;
insert `westeros-project.westeros_dtlk_qty_prod.customers_qty`

select * from (
  select customerNumber,
customerName,
contactLastName,
contactFirstName,
phone,
addressLine1,
addressLine2,
city,
state,
postalCode,
country,
CAST(CAST(CASE WHEN salesRepEmployeeNumber IS NULL THEN '0.0'
        ELSE salesRepEmployeeNumber END AS FLOAT64) AS INT64) AS salesRepEmployeeNumber,
creditLimit
from `westeros-project.westeros_dtlk_raw_prod.customers`
)
;