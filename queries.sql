-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select productname,
    CategoryName
from product
    join category
    on product.categoryid = category.id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select Id,
    companyname
from [order]
    join customer
    on customerid = customer.id
where orderdate < '2012-08-09'



-- Display the name and quantity of the  ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select ProductName, quantity
from [orderdetail]

    join product on 
     productid = product.id
    join [order] on 
     orderid = [order].id
where [order].id = 10251
order By ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [order].id as OrderID,
    customer.CompanyName,
    employee.LastName as 'Employee Last name'
from [order]
    join customer on 
     customerid = customer.id
    join employee on 
     employeeid = employee.id 