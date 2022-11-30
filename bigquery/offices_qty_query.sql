create or replace table `westeros-project.westeros_dtlk_qty_prod.offices_qty` (officeCode string, city string, phone string,addressLine1 string,addressLine2 string,state string,country string,postalCode string)

;
insert `westeros-project.westeros_dtlk_qty_prod.offices_qty`

select * from (
  SELECT CAST(officeCode as string) as officeCode,
CASE WHEN city IS NULL THEN ''
ELSE city END AS city,
CASE WHEN phone IS NULL THEN ''
ELSE phone END AS phone,
CASE WHEN addressLine1 IS NULL THEN ''
ELSE addressLine1 END AS addressLine1,
CASE WHEN addressLine2 IS NULL THEN ''
ELSE addressLine2 END AS addressLine2,
CASE WHEN state IS NULL THEN ''
ELSE state END AS state,
CASE WHEN country IS NULL THEN ''
ELSE country END AS country,
CASE WHEN postalCode IS NULL THEN ''
ELSE postalCode END AS postalCode
FROM `westeros-project.westeros_dtlk_raw_prod.offices`
)
;