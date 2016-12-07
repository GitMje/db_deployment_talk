Use [Prod];

EXEC master.dbo.sp_addlinkedserver 
    @server = N'OtherServer', 
	@srvproduct=N'', 
	@provider=N'SQLNCLI', 
	@provstr=N'DRIVER={SQL Server};Server=(localdb)\demo; Initial Catalog=OtherDatabase'