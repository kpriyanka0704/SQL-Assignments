select name from sys.databases;

exec sp_help databases;

create database Fruits;

use Fruits;

create table fruit(fruit_id int,fruit_name varchar(20),Price int,taste varchar(10), quantity int);

insert into fruit values(101,'Apple',100,'Sweet',5),(102,'Bananas',60,'Sweet',12),(103,'Strowberry',100,'Sweet',12),(104,'Cherry',100,'Sweet',6),
(105,'Orange',60,'Sour',5);
insert into fruit values(102,'Bananas',60,'Sweet',12);
select * from Fruit;

--WAQ to find out all fruits having taste is sweet;

select  * from fruit where taste='Sweet';

--WAQ to find price wise count;

select  Price, count(*) from fruit group by Price;

--WAQ to find quantity wise count;

select  quantity, count(*) from fruit group by quantity;

--WAQ to find all  fruit where taste is sweet having quantity less than 12;

select * from fruit where taste='Sweet' and quantity<12;

--WAQ to find all te fruits whose name ends with letter e ;

select * from fruit where fruit_name like '%e';

--WAQ to find all te fruits whose name starts with letter c ;

select * from fruit where fruit_name like 'c%';

--WAQ to find all te fruits whose name conatains letter r;

select * from fruit where fruit_name like '%r%';

--WAQ to find all te fruits having 2nd character is a ;

select * from fruit where fruit_name like '_a%';

--WAQ to find all te fruits whose name having 6 character;

select * from fruit where fruit_name like '______';

--WAQ to find all te fruits whose taste is sweet name having length 5;

select * from fruit where taste='Sweet' and fruit_name like '_____';

--WAQ to find price of all fruits in ascending and descending order;

select * from fruit order by price ;

select * from fruit order by price desc ;
select * from fruit order by quantity ;
select * from fruit where quantity=12 order by price;

--WAQ to delete fruit having price 60 and taste is sweet;

delete from fruit  where price =60 and taste ='Sweet';

--WAQ to update price of fruit having id=103;

update fruit set price= 200 where fruit_id=103;


--WAQ to find max price 
select max(price) from fruit;

--WAQ to find max price

select min(price) from fruit;

--WAQ to find max price
select count(*) from fruit;

--WAQ to find sum of price of sweet fruit;

select sum(price) from fruit;

--WAQ TO Find price wise max;

select top(1) * from fruit order by price desc;

--WAQ to find price wise count;

select price,count(*) from fruit where taste ='Sweet' group by Price;--to find with one parameter 
select price,count(*) from fruit where taste is not null group by Price;---to find from all

--WAQ find the fruit having quantity more than 1 AND equal 1;
select quantity,count(*) from fruit where quantity is not null group by quantity having count(*)>1;
select quantity,count(*) from fruit where quantity is not null group by quantity having count(*)=1;


