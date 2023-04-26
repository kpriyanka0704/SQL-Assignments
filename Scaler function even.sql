-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION CheckEven
(
	-- Add the parameters for the function here
	@Num1 int
)
RETURNS varchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ans varchar(10)
	if @Num1%2=0

	set @ans='Even'
	else
	set @ans='Odd'

	-- Return the result of the function
	RETURN @ans

END
GO

select dbo.CheckEven(4)as result;
select dbo.CheckEven(7)as result;
