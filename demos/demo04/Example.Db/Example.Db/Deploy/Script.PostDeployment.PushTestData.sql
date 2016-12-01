/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO
--IF '$(Environment)' = 'Development' BEGIN
BEGIN TRANSACTION;

DELETE FROM	[dbo].[Customers]

COMMIT;
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
GO

------------------------------------------------------------------------------- 
BEGIN TRANSACTION;
INSERT INTO [dbo].[Customers]([CustomerId], [FirstName], [LastName], [Age])
SELECT 1, N'Joe', N'Smith', 5 UNION ALL
SELECT 2, N'Jill', N'Jones', 10 UNION ALL
SELECT 3, N'Old', N'Man', 105 
COMMIT;
RAISERROR (N'[dbo].[Customers]: Insert Batch: Done!', 10, 1) WITH NOWAIT;
GO

DBCC CHECKIDENT ('[dbo].[Customers]', RESEED)

SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

------------------------------------------------------------------------------- 

--END /* if env condition */