USE [project]
GO

/****** Object:  StoredProcedure [dbo].[InsertEmployees]    Script Date: 27-03-2026 14:01:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[InsertEmployees]
  (
  @EmployeeData  TableTypeInsert READONLY,
	@DependentsData DEPENDENT_TYPE READONLY
)
AS
BEGIN
    BEGIN TRY
        -- Insert data into Employees table
        INSERT INTO Employee (FIRST_NAME, LAST_NAME, EMAIL,SALARY,STATE_ID,DEPARTMENT_ID,MANAGER_ID,DATE_OF_BIRTH )
        SELECT FIRST_NAME, LAST_NAME, EMAIL,SALARY,STATE_ID,DEPARTMENT_ID,MANAGER_ID,DATE_OF_BIRTH
        FROM @EmployeeData;

		INSERT INTO DEPENDENT_TABLE(FIRST_NAME,LAST_NAME,RELATION_ID,PERCENTAGE,EMP_ID,CREATED_BY)
		SELECT FIRST_NAME,LAST_NAME,RELATION_ID,PERCENTAGE,EMP_ID,CREATED_BY
		FROM @DependentsData;



        -- Optionally, you can add logic here for further checks, logging, or success confirmation
        PRINT 'Data inserted successfully.';

    END TRY
    BEGIN CATCH
        -- Error handling block
        PRINT 'Error occurred during insertion: ' + ERROR_MESSAGE();
        -- Optionally, you can log the error to a custom error log table or raise an error again
        -- RAISEERROR('Error occurred: %s', 16, 1, ERROR_MESSAGE());
    END CATCH
END
GO


