-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE airthmatic(@n1 int,@n2 int,@ans int output)
	
AS
BEGIN
	
	set @ans=@n1+@n2;
  
END
GO

declare @return_value int;
declare @ans int;
select @ans=0;
exec @return_value= dbo.airthmatic @n1=5,@n2=10,@ans=@ans output;
select @ans;
go
