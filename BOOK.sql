create table author1(author_id int primary key,author_name varchar(20),phno varchar(20),email varchar(20),author_add varchar(10),city varchar(10));
exec sp_help author1;
select * from author1;

create table book1(book_id int primary key,book_name varchar(10),author_id int,price int,constraint fk_author1 foreign key(author_id)references author1(author_id));
exec sp_help book1;
select * from book1;

create table award_master(awardtype_id int,award_name varchar(10),award_price int);
exec sp_help award_master;
alter table award_master alter column awardtype_id int not null;

alter table award_master add constraint pk_awardtype primary key(awardtype_id);

create table Awardd(award_id int primary key,awardtype_id int,aid int,bid int,award_year int);
exec sp_help awardd;

alter table awardd add constraint fk_book_id foreign key(bid) references book1(book_id);
alter table awardd add constraint fk_aid foreign key(aid) references author1(author_id);
alter table awardd add constraint fk_type_id foreign key(awardtype_id) references award_master(awardtype_id);


insert into author1 values(1,'Merry','8669364067','merry@gmail.com','At Pune','Pune');
 insert into author1 values(2,'John','9922364047','john@gmail.com','At florida','Pune'),
                           (3,'Jkrolling','9864675078','jk@gmail.com','At Mumbai','Mumbai')
						   
select * from book1;
select * from author1;
select * from award_master;
select * from awardd;

insert into book1 values (101,'Harrypoter',2,1000),(102,'LivingArt',2,500),(103,'100Days',3,1500);

insert into award_master values(10,'Nobel',50000),(20,'Oscar',100000),(30,'Padmashri',70000);

insert into awardd values(1111,10,2,101,2019),(2222,20,2,102,2018),(3333,30,3,101,2019);
                        
--find author name for book XYZ
select a.author_name,b.book_name from book1 b join author1 a on a.author_id=b.author_id where b.book_name='Harrypoter';

--find all book name whose author is XYZ
select a.author_name,b.book_name from book1 b join author1 a on a.author_id=b.author_id where a.author_name='Jkrolling';

--find city name in which max author are living
select top(1)city,count(*)from author1 group by city order by count(*)desc;

--find year wise award count
select award_year,count(*) from Awardd group by award_year order by count(*);

--find award name for year 2019
select a.award_name,d.award_year from awardd d,award_master a where a.awardtype_id=d.awardtype_id and d.award_year=2019;

--find the author name who got award
select a.author_name from author1 a,awardd d where a.author_id=d.aid;

--find author wise award count
select a.author_name, count(*) from author1 join awardd a on a.aid =b.aid group by a.author_name;

