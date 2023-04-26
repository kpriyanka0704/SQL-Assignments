--====================================
--  Create database trigger template 
--====================================
USE <database_name, sysname, AdventureWorks>
GO

IF EXISTS(
  SELECT *
    FROM sys.triggers
   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
     AND parent_class_desc = N'DATABASE'
)
	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
GO

CREATE TRIGGER Mydata2 ON Student1
	FOR update
AS 

BEGIN

         declare @sid int;
	 declare @sname varchar(30);
	 declare @cid int;
	 declare @phno varchar(30);
	 declare @email varchar(30);

	  select @sid=i.sid from inserted i;
	 select @sname=i.sname from inserted i;
	 select @cid=i.cid from inserted i;
	 select @phno=i.phno from inserted i;
	 select @email=i.email from inserted i;

	 insert into studentlog values (@sid,@sname,@cid,@phno,@email);

   PRINT 'updated successfully!' 
   
END
GO


select * from Student1;

create table studentlog(sid int,sname varchar(30),cid int,phno varchar(30),email varchar(30));

select * from studentlog;

update  Student1 set sid=107 where sid=101;


