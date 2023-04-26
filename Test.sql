select name from sys.databases;
exec sp_help databases;

create database Test;

use Test;

create table Country(country_id int primary key,county_name varchar(10));
exec sp_help Country;

create table State (state_id int primary key,state_name varchar(10),country_id int,constraint fk_Country foreign key(country_id) references Country(country_id));
exec sp_help State;

create table City(city_id int primary key,city_name varchar(10),state_id int,constraint fk_State_ foreign key (state_id) references State(state_id));
exec sp_help City;

insert into Country values(101,'India'),(102,'China'),(103,'Spain'),(104,'Italy'),(105,'Rasia');

insert into State values(11,'Maharashtr',101),(22,'Bihar',102),(33,'Punjab',103),(44,'Maharashtr',102),(55,'Rajsthan',101);

insert into City values(1,'Pune',11),(2,'Nashik',33),(3,'Mumbai',33),(4,'Pune',44),(5,'Goa',11);

select * from Country;
select * from State;
select * from City;

--find out the country name for the state Maharashtra

select a.county_name,b.state_name from State b join Country a on a.country_id=b.country_id where b.state_name='Maharashtr';

--find out the all the state from India
select s.State_Name from State s join Country c on s.Country_id=c.Country_id where c.County_Name='India';

--find out all the city names from the Punjab nd Rajsthan state

select a.city_name from City a join State s on a.state_id=s.state_id where s.state_name='Punjab' or s.state_name='Rajsthan';

--find out the state name in which only one city is present

select state_name,count(*) from State group by state_name having count(*)=1;


--find out the country wise state count 

select c.county_name,count(*) from Country c join State s on c.country_id=s.country_id group by c.county_name;

--find out the all state name which end with n character

select * from State where state_name like '%n';






