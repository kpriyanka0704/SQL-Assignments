select * from employee;

truncate table employee;
alter table employee add dept_id int;
alter table employee drop column dept_id;
exec sp_help employee;
alter table employee drop column dept_id;

--At the time of table creation

create table employee(eid int ,ename varchar(20),salary int, primary key(eid));

exec sp_help employee;

insert into employee values(1,'Priya',40000,'Pune','female','Hr');

--After table creation;
select * from department;
create table department(did int,dname varchar(20));
exec sp_help department;

alter table department add constraint d_pk primary key (did);

alter table department drop column did;

alter table department add did int not null;

--Drop primary key

exec sp_help employee;
alter table employee drop constraint 

--Foreign key

truncate table employee;
alter table employee add dept_id int;

alter table employee add constraint fk_did foreign key(dept_id) references department (did);

