use ecommercedb;

-- highest price product 
select productname from products 
where price = (select max(price) as highprice from products);

-- customer with more than 1 order 
select fullname from customers
where 
(select count(*) from orders 
where orders.customerid = customers.customerid) > 1;

-- products not saled
select productname from products 
where productid 
not in (select productid from orderitems);

-- highest order 
select orderid from orders 
where 
totalamount = (select max(totalamount) from orders);

-- cutomers withut orders 
select fullname from customers 
where not exists (
select * from orders 
where orders.customerid = customers.customerid
);


