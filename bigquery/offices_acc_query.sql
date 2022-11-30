create or replace table `westeros-project.westeros_dtlk_acc_prod.offices_acc` (officeCode string, city string, country string)

;
insert `westeros-project.westeros_dtlk_acc_prod.offices_acc`

select * from (
  select officeCode, city, country from `westeros-project.westeros_dtlk_qty_prod.offices_qty`
)
;