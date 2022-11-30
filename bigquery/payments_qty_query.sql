create or replace table `westeros-project.westeros_dtlk_qty_prod.payments_qty` (customerNumber int64,checkNumber string,paymentDate date,amount float64)

;
insert `westeros-project.westeros_dtlk_qty_prod.payments_qty`

select * from (
  SELECT CASE WHEN customerNumber IS NULL THEN 0 ELSE customerNumber END AS customerNumber,
CASE WHEN checkNumber IS NULL THEN '' ELSE checkNumber END AS checkNumber,
CASE WHEN paymentDate IS NULL THEN '1900-01-01' ELSE paymentDate END AS paymentDate,
CASE WHEN amount IS NULL THEN 0.0 ELSE amount END AS amount
FROM `westeros-project.westeros_dtlk_raw_prod.payments` 
)
;