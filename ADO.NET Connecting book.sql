create table Book( id int primary key identity(1,1),name varchar(20),price decimal);
select * from Book;


create table Product(id int primary key identity(1,1),name varchar(30),company varchar(20),price int);
select * from Product;

create table NewStudent(rollno int primary key identity(1,1),name varchar(30),branch varchar(40),per int);
select * from NewStudent;