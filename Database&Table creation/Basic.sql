show databases ;

use sib14 ;

show tables ;

create table person(
	ID int ,
	Name varchar(200),
        Age int ,
        primary key(ID)
) ;
    
desc person ;

insert into person values (1,'Manish',20) ;
insert into person values (2,'Aman',21);
insert into person values (3,'Suyog',20) ;

select * from person ;

create table orders (
	OrderId int not null,
    	OrderName varchar(200) not null,
   	PersonId int ,
   	primary key(OrderId) ,
    	foreign key(PersonId) references person(ID) 
);

desc orders ;

insert into orders values(111,'Maggie',1) ;
insert into orders values(112,'Rice',2) ;
insert into orders values(113,'Roti',3) ;
insert into orders values(114,'veggie',4) ;
insert into orders values(114,'veggie',1) ;

select * from orders ;
