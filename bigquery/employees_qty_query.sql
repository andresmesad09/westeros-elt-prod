create or replace table `westeros-project.westeros_dtlk_qty_prod.employees_qty` (
  employeeNumber int64,
  lastName string,
  firstName string,
  extension string,
  email string,
  officeCode string,
  reportsTo string,
  jobTitle string
)

;
insert `westeros-project.westeros_dtlk_qty_prod.employees_qty`

select * from (
  SELECT employeeNumber,
CASE WHEN lastName IS NULL THEN ''
ELSE lastName END AS lastName,
CASE WHEN firstName IS NULL THEN ''
ELSE firstName END AS firstName,
extension,
CASE WHEN email LIKE '%@%' THEN email
ELSE '' END AS email,
CASE WHEN officeCode IS NULL THEN '0'
ELSE officeCode END AS officeCode,
CASE WHEN reportsTo IS NULL THEN '0.0'
ELSE reportsTo END AS reportsTo,
CASE WHEN jobTitle IS NULL THEN ''
ELSE jobTitle END AS jobTitle,
FROM `westeros-project.westeros_dtlk_raw_prod.employees`
)
;