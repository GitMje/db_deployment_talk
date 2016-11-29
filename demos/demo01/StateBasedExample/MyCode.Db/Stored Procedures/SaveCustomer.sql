CREATE PROCEDURE [dbo].[SaveCustomer]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Age int,
	@CustomerId int output
AS

BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
	SET XACT_ABORT ON;

	BEGIN TRAN


		IF @CustomerId <= 0 BEGIN
			INSERT INTO [Customers] (CustomerId, FirstName, LastName, Age)
			VALUES (@CustomerId, @FirstName, @LastName, @Age);
			SET @CustomerId = SCOPE_IDENTITY();

		END
		ELSE BEGIN
			IF EXISTS (SELECT NULL AS Empty FROM Customers WHERE CustomerId = @CustomerId)
			BEGIN
				UPDATE [Customers]
				 SET 
					FirstName = @FirstName,
					LastName = @LastName,
					Age = @Age
				WHERE CustomerId = @CustomerId
			END

			ELSE BEGIN
				RAISERROR('Customer %i could not be found.', 16, 1, @CustomerId)
			END
		END
	COMMIT
END
