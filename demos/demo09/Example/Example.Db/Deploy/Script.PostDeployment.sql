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
PRINT '[dbo].[Customers]: Insert Batch: Done!'
GO

DBCC CHECKIDENT ('[dbo].[Customers]', RESEED)

SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
--=============================================================================
BEGIN TRANSACTION;

DELETE FROM	[dbo].[ProductColor]

COMMIT;
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON
GO

------------------------------------------------------------------------------- 
BEGIN TRANSACTION;
INSERT INTO [dbo].[ProductColor]([ProductColorId], [Color])
SELECT 1, N'Blue' UNION ALL
SELECT 2, N'Red' UNION ALL
SELECT 3, N'Black' UNION ALL
SELECT 4, N'Green'
COMMIT;
PRINT '[dbo].[ProductColor]: Insert Batch: Done!'
GO

DBCC CHECKIDENT ('[dbo].[ProductColor]', RESEED)

SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
--=============================================================================

IF '$(Environment)' = 'Development' BEGIN
  PRINT 'Running for Development!'
END

IF '$(Environment)' = 'Production' BEGIN
  PRINT 'Running for Production!'
END

