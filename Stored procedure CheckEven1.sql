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
CREATE PROCEDURE checkEven1(@n1 int)
	
AS
BEGIN
	
	declare @ans varchar(20);

	if @n1%2=0

	set @ans='Even';
	else
	set @ans='Odd';

   select @ans as result;

END
GO

exec dbo.checkEven1 @n1=6;
exec dbo.checkEven1 @n1=3;
