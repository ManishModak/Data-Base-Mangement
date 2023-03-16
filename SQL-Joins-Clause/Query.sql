show databases ;

use sib14 ;

show tables ;

Select * from orders ;

insert into person values(4,'Manish',24) ;
 
 Alter table orders
 rename column PersonId to ID ;
 
 select orders.OrderID , person.Name , orders.OrderName from Orders
 Inner join person on orders.ID = person.ID 
 order by orderId;
 
 create table customers(
	CustomerId int ,
    CustomerName varchar(20) ,
    Country varchar(20) 
 );
 
 drop table orders ;
 
 create table orders(
	OrderId int ,
    CustomerId int ,
    OrderDate date ,
    ShipperId int
 );
 
 insert into orders values (10308,2,'1996-09-18',3) ,
	(10309,3,'1996-09-19',1) ,
    (10310,4,'1996-09-20',2) ,
    (10311,4,'1996-09-21',3) ,
    (10312,5,'1996-09-22',3) ;
    
insert into customers values (1,'Manish','US'),
	  (2,'Aman','spain') ,
    (3,'suyog','france') ,
    (4,'abhi','canada') ;
    
select orders.OrderID , Customers.CustomerName , Customers.Country , orders.OrderDate from Orders
Inner join customers on orders.CustomerID = Customers.CustomerID 
order by orderId;

select orders.OrderID , Customers.CustomerName , Customers.Country , orders.OrderDate from Orders
left join customers on orders.CustomerID = Customers.CustomerID 
order by orderId;

select orders.OrderID , Customers.CustomerName , Customers.Country , orders.OrderDate from Orders
right join customers on orders.CustomerID = Customers.CustomerID 
order by orderId;

select orders.OrderID , Customers.CustomerName , Customers.Country , orders.OrderDate from Orders
Full Outer join customers on orders.CustomerID = Customers.CustomerID 
order by orderId;
