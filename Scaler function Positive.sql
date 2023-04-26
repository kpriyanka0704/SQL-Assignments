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
CREATE FUNCTION CheckPositive
(
	-- Add the parameters for the function here
	@Num1 int
)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ans varchar(20)

	if @Num1>0
	set @ans='Positive'
	else
	set @ans='Negative'
	

	-- Return the result of the function
	RETURN @ans

END
GO

select dbo.CheckPositive(8)as result;
select dbo.CheckPositive(-7)as result;