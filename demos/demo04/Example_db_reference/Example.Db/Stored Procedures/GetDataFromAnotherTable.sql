CREATE PROCEDURE [dbo].[GetDataFromAnotherTable]
AS
BEGIN
  SET NOCOUNT ON;

  SELECT [SomeData] FROM [$(AnotherDb)].[dbo].[AnotherTable]
END
