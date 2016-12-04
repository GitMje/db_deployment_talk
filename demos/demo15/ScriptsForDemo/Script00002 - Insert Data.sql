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
