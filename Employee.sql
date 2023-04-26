create table employee(eid int,ename varchar(10),salary int,citi varchar(10),gender varchar(20),dept_name varchar(10));

exec sp_help employee;

select * from employee;

insert into employee values(101,'Priya',70000,'Pune','Female','Sales'),(102,'Amit',50000,'Nagar','Male','Hr'),
(103,'Riya',86000,'Nashik','Female','sale'),(104,'Ram',90000,'Pune','Male','Admin'),(105,'Nikhil',70000,'Pune','Male','Hr');

drop table employee;

