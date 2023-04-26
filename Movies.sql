create table Moviess(movie_id int primary key,movie_name varchar(20),release_year int,Box_Ofice_Collection int);
exec sp_help Moviess;

create table Roless(roll_id int primary key,roll_name varchar(10));
exec sp_help Roless;

create table Celebrityy(cid int primary key, cname varchar(20),Birthdate varchar(10),phno varchar(10),email varchar(20));
exec sp_help Celebrityy;

create table Bollywood_Data(Bollywooddata_id int primary key,celebrity_id int,Mid int,Rid int);
exec sp_help Bollywood_Data;

alter table Bollywood_Data add constraint fk_celebrity_id foreign key(celebrity_id) references Celebrityy(cid);
alter table Bollywood_Data add constraint fk_Mid foreign key (Mid) references Moviess(movie_id);
alter table Bollywood_Data add constraint fk_Rid foreign key(Rid) references Roless(roll_id);

insert into Moviess values(1,'KGF',2021,431),(2,'Sultan',2019,400),(3,'Pathan',2023,300),(4,'Ved',2023,320),(5,'Simba',2018,350);

insert into Roless values(101,'Producer'),(102,'Director'),(103,'Hero'),(104,'Heroine'),(105,'Villain');

insert  into Celebrityy values(1001,'Salman khan','1965-12-27','9876549045','salman@gmail.com'),
(1002,'ShahRukh khan','1965-11-02','7867984560','shahrukh@gmail.com'),(1003,'Alia Bhatt','1993-03-15','9970874560','alia@gmail.com'),
(1004,'Deepika Padukone','1986-01-05','7767895640','deepika@gmail.com'),(1005,'Allu Arjun','1982-04-08','9787679055','allu@gmail.com');

insert into Bollywood_Data values(10,1001,1,101),(20,1002,1,102),(30,1003,3,102),(40,1004,3,104),(50,1005,5,105);

select * from Moviess;
select * from Roless;
select * from Celebrityy;
select * from Bollywood_Data;

--find out all the movie which are released in 2021
select movie_name from Moviess where release_year=2019;

--find out celebrity  name for movie XYZ

select cname from Celebrityy where cid in (select cid from Bollywood_Data where Mid=(select movie_id from Moviess where movie_name='Pathan'));

--Find ot the year wise movie count
select release_year,count(*) from Moviess group by release_year order by count(*);

--find movie name in which celebrity XYZ

select m.movie_name from Moviess m join Celebrityy c on c.cname =(select cname from Celebrityy where cname='Salman khan');