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
RAISERROR (N'[dbo].[ProductColor]: Insert Batch: Done!', 10, 1) WITH NOWAIT;
GO

DBCC CHECKIDENT ('[dbo].[ProductColor]', RESEED)

SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO