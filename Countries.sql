select name from sys.databases;

exec sp_help databases;

create database Countries;

create table Country(country_id int primary key,country_name varchar(20));
exec sp_help Country;

create table Formatt(format_id int primary key,format_name varchar(20));
exec sp_help Formatt;

create table Batsman1(player_id int primary key,player_name varchar(20),Age int,country_id int,total_runs int,total_50s int,total_100s int,
player_grade varchar(10),constraint fk_Country foreign key(country_id) references Country(country_id));
exec sp_help Batsman1;

create table B_FMapping(id int primary key,player_id int,format_id int,constraint fk_player_id foreign key(player_id) references Batsman1(player_id), 
 constraint fk_format_id foreign key(format_id) references Formatt(format_id));
 exec sp_help B_FMapping;

 insert into Country values(1,'India'),(2,'Austrelia'),(3,'Ameria'),(4,'Italy');

 insert into Formatt values(11,'T20'),(22,'ODI'),(3,'TEST'),(4,'IPL');

--insert into Batsman1 values

--insert into B_FMapping values
 select * from Country;
 select * from Formatt;
 select * from Batsman1;
 select * from B_FMapping;

