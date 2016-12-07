use [QA];

GO
PRINT N'Rename LastName to Surname';

GO
EXECUTE sp_rename @objname = N'[dbo].[Customers].[LastName]', @newname = N'Surname', @objtype = N'COLUMN';

GO
PRINT N'Rename CustomerId to Id';

GO
EXECUTE sp_rename @objname = N'[dbo].[Customers].[CustomerId]', @newname = N'Id', @objtype = N'COLUMN';

GO
PRINT N'Altering UpdateCustomer sproc';

GO
ALTER PROCEDURE [dbo].[UpdateCustomer]
	@CustomerId int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Age int
AS

BEGIN
	SET NOCOUNT ON;

    BEGIN TRY
      BEGIN TRANSACTION;

  	  UPDATE [Customers]
		SET 
		  FirstName = @FirstName,
		  [Surname] = @LastName,
		  Age = @Age
        WHERE [Id] = @CustomerId
      COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        PRINT 'Error occurred in UpdateCustomer'
    END CATCH;

END
GO

PRINT N'Complete!!!';
