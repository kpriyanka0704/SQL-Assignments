select * from employee;

select * from employee order by ename;

--find out all the employee whose name ends with letter n;

select * from employee where ename like '%l';

--find out all the employees who are living in city with length 5

select * from employee where ename like '_____';

--find out no of employee from each dept;

select dept_name, count(*) from employee group by dept_name;

--find out no of employees from each city

select city,count(*) from employee group by city;

select * from employee;

-- find out city name which more than 1 employee working

select city,count(*) from employee group by city having count(*)>1;

--find out dpt name where one employee is working

select dept_name,count(*) from employee group by dept_name having count(*)=1;

--find out employee name which contains char i;

select * from employee where ename like '%i%';
