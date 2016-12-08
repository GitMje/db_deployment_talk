CREATE TABLE [dbo].[ProductColor] (
    [ProductColorId] INT           IDENTITY (1, 1) NOT NULL,
    [Color]  NVARCHAR (50) NOT NULL
    CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED ([ProductColorId])
);

