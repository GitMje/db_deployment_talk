GO
PRINT N'Creating [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [CustomerId] INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50) NOT NULL,
    [LastName]   NVARCHAR (50) NOT NULL,
    [Age]        INT           NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);


GO
PRINT N'Creating [dbo].[ProductColor]...';


GO
CREATE TABLE [dbo].[ProductColor] (
    [ProductColorId] INT           IDENTITY (1, 1) NOT NULL,
    [Color]          NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED ([ProductColorId] ASC)
);


GO
PRINT N'Creating [dbo].[UpdateCustomer]...';


GO
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
		  FirstName = @FirstName,
		  LastName = @LastName,
		  Age = @Age
        WHERE CustomerId = @CustomerId
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
