CREATE PROCEDURE [dbo].[UpdateCustomer]
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
		  [FirstName] = @FirstName,
		  [LastName] = @LastName,
		  [Age] = @Age
        WHERE [CustomerId] = @CustomerId
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