CREATE PROCEDURE [dbo].[GetAllCustomers]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [CustomerId], [FirstName], [LastName], [Age]
	FROM dbo.[Customers]
END
