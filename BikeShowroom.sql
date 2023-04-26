select name from sys.databases;

exec sp_help databases;

create database BikeShowroom;

use BikeShowroom;

create table Model(model_id int primary key,model_name varchar(20),cost int);
exec sp_help Model;

create table Customer(cust_id int primary key,first_name varchar(20),last_name varchar(20),mobile_no varchar(20),gender varchar(10),email varchar(20));
exec sp_help Customer;

create table Payment_mode(payment_id int primary key,payment_type varchar(20));
exec sp_help Payment_mode;

create table Feedback_rating(rating_id int primary key,rating varchar(20));
exec sp_help Feedback_rating;

create table Purchase(purchase_id int primary key,cust_id int,model_id int,booking_amount int, payment_id int,purchase_date varchar(20),rating_id int,
constraint fk_cid foreign key(cust_id)references Customer(cust_id) on delete cascade on update cascade,
constraint fk_mid foreign key(model_id)references Model(model_id) on delete cascade on update cascade,
constraint fk_pid foreign key(payment_id) references Payment_mode(payment_id)on delete cascade on update cascade,
constraint fk_rid foreign key(rating_id) references Feedback_rating(rating_id)on delete cascade on update cascade);
exec sp_help Purchase;


insert into Model values(1,'Activa5G',74536),(2,'Yamaha R15',180000),(3,'Royal Enfield',190000),(4,'Bajaj Pulsar',140000),(5,'TVS Jupiter',71000);

insert into Customer values(101,'Ms.Priyanka','Kardile','8600671310','female','priya@gmail.com'),(102,'Mr.Mayur','Sahu','9867564590','male','mayur@gmail.com'),
                           (103,'Mr.Vaibhav','Patil','9078679856','male','patil@gmail.com'),(104,'Mr.Devdatt','Pawar','7689090757','male','devdatt@gmail.com'),
						   (105,'Ms.Aswini','Bhalerao','8600657896','female','ashu@gmail.com');

insert into Payment_mode values(11,'Online'),(22,'Cash'),(33,'Check');

insert into Feedback_rating values(5,'Excellent'),(4,'Good'),(3,'Average'),(2,'Bad'),(1,'Complaint');
insert into Feedback_rating (rating_id)values(1);
delete from Feedback_rating where rating_id=1;


insert into Purchase values(1001,101,1,25000,11,'2020-07-04',1),(1002,102,2,180000,22,'2022-06-12',5),(1003,103,3,25000,11,'2023-02-15',4),
                            (1004,104,4,25000,33,'2020-05-03',5);
insert into Purchase(purchase_id,cust_id,model_id,booking_amount,payment_id,purchase_date)values(1005,105,5,25000,22,'2019-07-09');
select * from Model;
select * from Customer;
select * from Payment_mode;
select * from Feedback_rating;
select * from Purchase;

--1) WAQ to get the balance amount for customers who made cash payment;

select b.booking_amount,c.first_name from Purchase b join Customer c on b.cust_id=c.cust_id join Payment_mode p on b.payment_id=p.payment_id
where payment_type='Cash';

--2) delete all the records of custmer who have paid complete amount as that of bike cost;

delete c from Customer c left join Purchase p on c.cust_id=p.cust_id join Model m on p.model_id=m.model_id where cost=180000;

--3) WAQ to change payment mode to cash for Activa5G purchased by customer with id 11;

update Payment_mode set payment_type='Cash' from Payment_mode pm join Purchase p on pm.payment_id=p.payment_id join Model m on m.model_id=p.model_id 
where m.model_name='Activa5G' and p.purchase_id=1003;

--4) create a stored procedure to get the full name of cust whose cust_id is provided as input;


--5) WAQ to get number of complaints regestered for model Activa5G;

select c.rating from  Feedback_rating c join Purchase p on c.rating_id=p.rating_id join Model m on p.model_id=m.model_id and model_name='Activa5G';

--6) WAQ to get all customer names who haven't given rating yet;

select first_name,last_name from Customer c join Purchase p on c.cust_id=p.cust_id where rating_id is null;
select first_name,last_name from Customer c join Purchase p on c.cust_id=p.cust_id join Feedback_rating f  on p.rating_id=f.rating_id where rating is null;

--7) Delete all complaint records from purchase;

delete c from Feedback_rating c left join Purchase p on c.rating_id=p.rating_id where rating='Complaint';

--8) Update ratings given by Mr vaibhav from good to excellent;

update Feedback_rating set rating= 'Excellent' from Feedback_rating f  join Purchase p on f.rating_id= p.rating_id join
Customer c on c.cust_id= p.cust_id where first_name='Mr Vaibhav' and rating='Good';---Incomplete 0 rows affected

--9) Reduce cost of all Bikes for which rating is bad by 10%;

update model set cost=cost-cost*0.10 from Model;



