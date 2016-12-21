CREATE PROCEDURE [dbo].[GetDataFromAnotherServer]
AS
BEGIN
	SELECT * FROM [OtherServer].[AnotherDb].dbo.AnotherTable;
END