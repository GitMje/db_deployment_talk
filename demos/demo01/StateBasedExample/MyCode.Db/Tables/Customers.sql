CREATE TABLE [dbo].[Customers] (
    [CustomerId] INT           NOT NULL,
    [FirstName]  NVARCHAR (50) NOT NULL,
    [LastName]   NVARCHAR (50) NOT NULL,
    [Age]        INT           NOT NULL,
    CONSTRAINT [PK_Person2] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

