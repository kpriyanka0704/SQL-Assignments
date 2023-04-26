select name from sys.databases;

exec sp_help databases;

create database FBUser;

use FBUser;

create table FBUser(Userid int primary key,Username varchar(20),email varchar(20),phno varchar(10),total_post int);
exec sp_help FBUser;

create table Post1(post_id int primary key,Userid int,post_content varchar(20),post_image varchar(20),post_video varchar(20),
constraint fk_FBUser foreign key(Userid) references FBUser(Userid));
exec sp_help Post1;

create table Friendship(friend_id int primary key,Userid int,Friendship_status_code int,
constraint fk_Friendship foreign key(Userid) references FBUser(Userid));
exec sp_help Friendship;

create table Friendship_Status(Status_code int,staus varchar(20));
exec sp_help Friendship_Status;
