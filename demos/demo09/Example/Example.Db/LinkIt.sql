EXEC sp_addlinkedserver 
    @server = N'OtherServer', 
	@srvproduct=N'', 
	@provider=N'SQLNCLI', 
	@provstr=N'DRIVER={SQL Server};Server=(localdb)\LinkedServerExample; Initial Catalog=AnotherDb'