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
CREATE PROCEDURE checkPositive1(@n1 int)
	
AS
BEGIN
	
	declare @ans varchar(20);

	if @n1>0

	set @ans='Positive';
	else
	set @ans='Negative';

   select @ans as result;

END
GO

exec dbo.checkPositive1 @n1=9;
exec dbo.checkPositive1 @n1=-10;
