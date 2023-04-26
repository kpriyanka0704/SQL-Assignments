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

CREATE TRIGGER Mydata1 ON Student1
	FOR delete
AS 

BEGIN

         declare @sid int;
	 declare @sname varchar(30);
	 declare @cid int;
	 declare @phno varchar(30);
	 declare @email varchar(30);

	 select @sid=d.sid from deleted d;
	 select @sname=d.sname from deleted d;
	 select @cid=d.cid from deleted d;
	 select @phno=d.phno from deleted d;
	 select @email=d.email from deleted d;

	 insert into studentlog values (@sid,@sname,@cid,@phno,@email);
   PRINT 'deleted successfully!' 
   
END
GO


select * from Student1;

create table studentlog(sid int,sname varchar(30),cid int,phno varchar(30),email varchar(30));

select * from studentlog;

delete from Student1 where sid=105;


