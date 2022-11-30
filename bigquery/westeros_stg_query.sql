create or replace table `westeros-project.westeros_dtlk_stg_prod.westeros_stg_table` 
(
orderNumber int64,
productCode string,
quantityOrdered int64,
priceEach float64,
totalSale float64,
orderDate date,
status string,
customerNumber int64,
productName string,
productLine string,
quantityInStock int64,
buyPrice float64,
MSRP float64,
city string,
country string,
creditLimit float64,
employeeNumber int64,
officeCode string,
paymentDate date,
amount float64)
;
insert `westeros-project.westeros_dtlk_stg_prod.westeros_stg_table` 

select * from (
  select orderNumber,
productCode ,
quantityOrdered,
priceEach,
totalSale,
orderDate,
status,
ord_prod_join.customerNumber as customerNumber,
productName,
productLine,
quantityInStock,
buyPrice,
MSRP,
city,
country,
creditLimit,
employeeNumber,
officeCode,
paymentDate,
amount

from (SELECT ordetails.orderNumber,ordetails.productCode,quantityOrdered,priceEach,totalSale,orderDate,status,customerNumber,productName,productLine,quantityInStock,buyPrice,MSRP FROM `westeros-project.westeros_dtlk_acc_prod.orderdetails_acc` ordetails
LEFT JOIN `westeros-project.westeros_dtlk_acc_prod.orders_acc` ord
ON ordetails.orderNumber = ord.orderNumber 
LEFT JOIN `westeros-project.westeros_dtlk_acc_prod.products_acc` prod  
ON ordetails.productCode = prod.productCode) ord_prod_join
LEFT JOIN
(SELECT cust.customerNumber,city,country,creditLimit,employeeNumber,officeCode,paymentDate,amount FROM `westeros-project.westeros_dtlk_acc_prod.customers_acc` cust
LEFT JOIN `westeros-project.westeros_dtlk_acc_prod.employees_acc` emp 
ON emp.employeeNumber = cust.salesRepEmployeeNumber
LEFT JOIN `westeros-project.westeros_dtlk_acc_prod.payments_acc` pay 
ON cust.customerNumber = pay.customerNumber) cust_emp_pay_join
ON ord_prod_join.customerNumber = cust_emp_pay_join.customerNumber
);