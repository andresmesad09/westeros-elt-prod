create or replace table `westeros-project.westeros_dtlk_acc_prod.employees_acc` (employeeNumber int64,officeCode string)

;
insert `westeros-project.westeros_dtlk_acc_prod.employees_acc`

select * from (
  select employeeNumber,officeCode from `westeros-project.westeros_dtlk_qty_prod.employees_qty`
)
;