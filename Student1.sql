create table Student1(sid int,sname varchar(30),cid int,phno varchar(30),email varchar(30));

exec sp_help Student1;

select * from Student1;
insert into Student1 values(101,'Priyanka',1,'8669361067','priyanka@gmail.com'),(102,'Amit',2,'8976455678','amit@gmail.com'),
                            (103,'Nayan',3,'7656841023','nayan@gmail.com'),(104,'Neha',4,'9978657610','neha22@gmail.com'),
							(105,'Riya',5,'8678597745','riya@gmail.com');

create table Course(cid int,cname varchar(10),subject varchar(20),fee int, duration int); 
select * from Course;
insert into Course values(1,'Science','Chemistry',3000,3),(2,'C-Sharp','Loops',25000,5),
(3,'Python','Array',15000,4),(4,'Science','Mathematics',35000,3),(5,'MBA','Finance',20000,5);

