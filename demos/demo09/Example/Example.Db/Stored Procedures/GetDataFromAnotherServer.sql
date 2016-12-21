CREATE PROCEDURE [dbo].[GetDataFromAnotherServer]
AS
BEGIN
	SELECT * FROM [$(OtherServer)].[$(OtherDatabase)].dbo.AnotherTable;
END