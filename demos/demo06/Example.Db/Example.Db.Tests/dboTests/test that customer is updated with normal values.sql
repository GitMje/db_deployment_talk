CREATE PROCEDURE [dboTests].[test that customer is updated with normal values]
AS
BEGIN
	------------------------
	-- ASSEMBLE
    SET NOCOUNT ON -- added to prevent extra result sets
	DECLARE @expected int = 1
	DECLARE	@result int = 0

	EXEC tSQLt.FakeTable 'Customers', 'dbo'
	 
	INSERT INTO dbo.Customers (CustomerId, FirstName, LastName, Age)
       VALUES (1, N'Leeroy', N'Jenkins', 14);

	------------------------
	-- ACT
    EXEC    [dbo].[UpdateCustomer]
			@CustomerId = 1,
	    	@FirstName = N'Leeroy',
		    @LastName = N'Jenkins',
		    @Age = 35

	DECLARE @actual int = (SELECT COUNT(*) FROM dbo.Customers);
	SELECT @result = Age FROM dbo.Customers;

    ------------------------
	-- ASSERT
    EXEC tSQLt.AssertEquals @expected = @expected, @actual = @actual, @message = 'Actual row count didn''t match expected'
	EXEC tSQLt.AssertEquals @expected = 35, @actual = @result, @message = 'Actual Age didn''t match expected'
END