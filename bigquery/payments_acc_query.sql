create or replace table `westeros-project.westeros_dtlk_acc_prod.payments_acc` (customerNumber int64,paymentDate date,amount float64)

;
insert `westeros-project.westeros_dtlk_acc_prod.payments_acc`

select * from (
  select customerNumber,paymentDate,amount from `westeros-project.westeros_dtlk_qty_prod.payments_qty`
)
;