create table employee(eid int,ename varchar(20),salary int,city varchar(10),gender varchar(20),dept_name varchar(10));

exec sp_help employee;

select * from employee;

insert into employee values(101,'Priya',70000,'Pune','Female','Sales'),(102,'Amit',50000,'Nagar','Male','Hr'),
(103,'Riya',86000,'Nashik','Female','sale'),(104,'Ram',90000,'Pune','Male','Admin'),(105,'Nikhil',70000,'Pune','Male','Hr');

 insert into employee values(106,'Nayan',65000,'Mumbai','male','Sales');

 insert into employee values(104,'Ram',90000,'Pune','Male','Admin');

--find employees who got salary more than 60000 and she/he is from Mumbai lacation

select * from employee where salary>60000 and city='Mumbai';

--find employees from pune location

select * from employee where city='Pune';

--delete employee who is working in Admin department

delete from employee where dept_name='Admin';

--find all employees who are working in Hr dept

select * from employee where dept_name='Hr';

--find out all the female employees working in sales dept

select * from employee where dept_name='Sales';

--Find out all male employees whose salary is less than 60000

select * from employee where salary<60000;
