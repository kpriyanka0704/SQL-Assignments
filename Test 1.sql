select name from sys.databases;

exec sp_help databases;

create database Test1;

use Test1;

create table AUTHOR(author_id int primary key,author_name varchar(20),city varchar(10),country varchar(10));
exec sp_help AUTHOR;

create table CATEGORY(category_id int primary key,description varchar(20));
exec sp_help CATEGORY;

CREATE TABLE Book(book_id int primary key,title varchar(20),author_id int,category_id int,book_year int,price int,publisher varchar(10),rating int,
constraint fk_auther_id foreign key(author_id) references AUTHOR(author_id),constraint fk_category_id foreign key(category_id)references CATEGORY(category_id));

alter table book drop constraint fk_auther_id;
alter table Book add constraint fk_auth_id foreign key(author_id) references AUTHOR(author_id);

alter table Book drop constraint fk_category_id;
alter table book add constraint fk_cat_id foreign key(category_id) references CATEGORY(category_id);
exec sp_help Book;

create table ORDER_DETAILS(order_no int primary key,book_id int,qty int,constraint fk_book_id foreign key(book_id)references Book(book_id));

alter table ORDER_DETAILS drop constraint fk_book_id;
alter table ORDER_DETAILS ADD CONSTRAINT fk_bid foreign key(book_id)references Book(book_id);

exec sp_help ORDER_DETAILS;

insert into AUTHOR values(101,'John','Pune','India'),(102,'Jkrolling','nashik','India'),(103,'merry','Mumbai','America'),
(104,'priyanka','Pune','India'),(105,'Ashwini','Nashik','Italy');
insert into AUTHOR values(101,'John','Pune','India'),(104,'priyanka','Pune','India');

insert into CATEGORY values(1,'Drama'),(2,'Horror'),(3,'Mystrey'),(4,'Romance'),(5,'Action');

insert into Book values(11,'Harrypotter',101,3,2018,50000,'Bloomsburr',5),(22,'100days',102,3,2019,75000,'Bookmate',4),
(33,'ShertLockHome',103,4,2016,100000,'Bookmate',5),(44,'Harrypotter',101,3,2018,50000,'Bloomsburr',5),(55,'Elizabeth Wein',105,5,2020,50000,'Bloomsburr',3);
insert into Book values(11,'Harrypotter',101,3,2018,50000,'Bloomsburr',5),(44,'Harrypotter',101,3,2018,50000,'Bloomsburr',5);

insert into ORDER_DETAILS values(1001,11,100),(1002,22,500),(1003,11,1000),(1004,33,200),(1005,55,1000);

select * from AUTHOR;
select * from CATEGORY;
select * from Book;
select * from ORDER_DETAILS;

alter table book drop constraint fk_auth_id;
alter table Book add constraint fk_auth foreign key(author_id) references AUTHOR(author_id) on delete cascade on update cascade;


alter table ORDER_DETAILS drop constraint fk_bid;
alter table ORDER_DETAILS ADD CONSTRAINT fk_b_id foreign key(book_id)references Book(book_id) on delete cascade on update cascade;

alter table book drop constraint fk_auth;
alter table Book add constraint fk_aid foreign key(author_id) references AUTHOR(author_id) on delete set null on update set null;

--update book price set price is 10% discount whose rating is 5 and description is action;
update b set b.price=b.price-(b.price*0.1)from Book b, CATEGORY c where b.category_id=c.category_id and rating =5 and description='Action';


--delete book written by author living in pune city;
select b.title,a.author_name from Book b ,AUTHOR a where a.author_id=b.author_id and a.city ='Pune';
delete b from Book b ,AUTHOR a where a.author_id=b.author_id and a.city ='Pune';


--find out country wise author count
select c.country,count(*) from AUTHOR c join Book b on c.author_id=b.author_id group by c.country;

--find the country in which more than 2 authors are living
select country,count(*) from AUTHOR group by country having count(*)>2;

--find category wise book count
select a.category_id,count(*) from CATEGORY a join Book b on a.category_id=b.category_id group by a.category_id;

--find total price of Mystre book;
select sum(price) from Book where category_id=3;
--select sum(price) from Book b join CATEGORY c on b.category_id=c.category_id group by price;

--find total quantity as per category in desc order of total category

select c.description ,count(*) from ORDER_DETAILS o join Book b on o.book_id=b.book_id join CATEGORY c on b.category_id=c.category_id 
group by c.description order by count(*)desc;






