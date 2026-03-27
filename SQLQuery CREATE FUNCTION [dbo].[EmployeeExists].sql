USE [project]
GO

/****** Object:  UserDefinedFunction [dbo].[EmployeeExists]    Script Date: 27-03-2026 14:01:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[EmployeeExists] (@EMP_ID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @Exists BIT;
    
    IF EXISTS (SELECT 1 FROM Employee WHERE EMP_ID = @EMP_ID)
    BEGIN
        SET @Exists = 1;
    END
    ELSE
    BEGIN
        SET @Exists = 0;
    END
    
    RETURN @Exists;
END
GO


