select * from employee;
select * from department;

truncate table employee;
insert into employee values(1,'Priya',40000,'Beed','Female','Hr'),(2,'NIKHIL',60000,'Nashik','Male','Sales'),
(3,'Komal',80000,'Mumbai','Female','Admin'),(4,'Ram',50000,'Pune','Male','Sales');
insert into employee (eid,ename,salary,city,gender)values(5,'Amit',87000,'Pune','male');

insert into department values('Hr',101),('Sales',102);
insert into department values ('Admin',103),('Hr',104);


--find all the employee from company with there department;

select e.ename from employee e left join department d on e.dept_name=d.dname;

--find all departments with employee from company
select e.ename, d.dname from employee e right join department d on e.dept_name=d.dname;

--find employee who is not working in any department;
select* from employee where dept_name is  null;

--find department name in which no employee is working;
select e.ename , d.dname from employee e right outer join department d on e.dept_name=d.dname;


select * from employee;
alter table employee add mangr_id int;
update employee set mangr_id=2 where eid=5;
update employee set mangr_id=3 where eid=4;

alter table employee drop column mangr_id;
alter table employee add constraint fk_mg foreign key(mangr_id)references employee(eid);

--find manager with employee;

select e.ename as manager,m.ename as employee from employee e,employee m where e.eid=m.mangr_id;