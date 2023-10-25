create schema sales;
use  sales;

-- customer table
create table sales.customer(
cus_ID int primary key, 
email varchar(50) unique not null ,
address text,
phone_no char(10) not null ,
age smallint not null, 
DOB date) ;

--- insert 
insert into sales.customer ( cus_ID,email,address,phone_no,age,DOB) values
(102,'aac@gmail.com','aam street','923456987',24,'1999-01-01'),
(103,'ghc@gmail.com','mkol street','96239997',29,'1994-12-15'),
(104,'aoc@gmail.com','shanthi street','911156987',30,'1993-04-22'),
(105,'mkc@gmail.com','rajan street','923698987',25,'1998-02-03'),
(106,'ikc@gmail.com','lal street','999456987',26,'1997-11-20'),
(107,'uic@gmail.com','nehru street','3215456987',27,'1996-05-28'),
(108,'lou@gmail.com','pam street','923456987',32,'1991-09-27')
;
select * from sales.customer;

-- PRODUCT TABLE
create table sales.product(proID int primary key,
prod_name varchar(20) not null,
price decimal(10,2),
description text not null,
prod_type varchar(30) not null
);

insert into sales.product(proID,prod_name,price,description,prod_type) values
(1,'roshan bags',599.00,'Heavy duty laptop bag for office use','leather');
insert into sales.product(proID,prod_name,price,description,prod_type) values
(2,'roshan hand bags',899.00,'ladies bag for office use','leather matte'),
(3,'sky bags trolley',5999.00,'travel luggage','fibre'),
(4,'school bags',799.00,'kids specially printed bags','kids'),
(5,'shoes',2999.00,'Mens casual footwear','leather'),
(6,'sandals',299.00,'ladies casual wear','tote')
;
select * from sales.product;

-- ORDERS TABLE --------------
create table sales.orders( order_id int primary key auto_increment ,
 customer_ID int,
 prod_id int,
 orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
 order_status varchar(20),
 shipping_address text,
 payment varchar(20),
 payment_status varchar(30),
 shipping_method varchar(100),
 tracking_num varchar(50)
 );
 
 
 -- Adding foreign key---------
 alter table sales.orders add constraint fk_cusID foreign key(customer_ID) references customer(cus_ID);
 alter table sales.orders add  constraint fk_prodID foreign key(prod_ID) references product(proID);
 
 
 -- insert values
insert into sales.orders( customer_ID,prod_id,order_status,shipping_address,payment,payment_status,shipping_method,tracking_num) values
(103,2,'received','mkol street,coimbatore','online','success','express delivery','0021155669988'),
(104,1,'received','shanti street,chennai','online','success','express delivery','002369669989'),
(101,4,'received','psm street,delhi','COD','pending','standard delivery','0021155669095'),
(102,3,'received','ram street,bengaluru','online','success','express delivery','0021155660032'),
(107,2,'received','lal street,punjab','online','success','standard delivery','0021155660069'),
(101,5,'received','nehru street,west bengal','COD','pending','express delivery','0021155660082'),
(108,6,'received','mkol street,coimbatore','online','success','express delivery','0021155660091'),
(103,2,'received','rajan street,oddisa','online','success','standard delivery','0021155660132')
;

 insert into sales.orders(customer_ID,prod_id,order_status,shipping_address,payment,payment_status,shipping_method,tracking_num) values
(103,5,'received','mkol street,coimbatore','online','success','express delivery','0021155669988');
select * from sales.orders;
desc sales.orders;
 drop table sales.orders;