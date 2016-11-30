CREATE TABLE [dbo].[Customers] (
    [CustomerId] INT           NOT NULL IDENTITY(1,1),
    [FirstName]  NVARCHAR (50) NOT NULL,
    [LastName]   NVARCHAR (50) NOT NULL,
    [Age]        INT           NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY ([CustomerId] ASC)
);

