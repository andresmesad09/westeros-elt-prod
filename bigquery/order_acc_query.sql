create or replace table `westeros-project.westeros_dtlk_acc_prod.orders_acc` (orderNumber int64,orderDate date,status string,customerNumber int64)

;
insert `westeros-project.westeros_dtlk_acc_prod.orders_acc`

select * from (
  select orderNumber,orderDate,status,customerNumber from `westeros-project.westeros_dtlk_qty_prod.orders_qty`
)
;