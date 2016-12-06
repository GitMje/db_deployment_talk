Import-Module ..\..\common\common.psm1 
 
#////////////////////////////////////////////////////////////////////////////// 
# LocalDB 
#////////////////////////////////////////////////////////////////////////////// 


#////////////////////////////////////////////////////////////////////////////// 
# Delete all env databases 
#////////////////////////////////////////////////////////////////////////////// 
Remove-MeAllEnvDatabases
Remove-MeDatabase "(LocalDb)\ProjectsV13" "ExampleDb"
Remove-MeDatabase "(LocalDb)\ProjectsV13" "Example.Db"

#////////////////////////////////////////////////////////////////////////////// 
# Create and publish to databases 
#////////////////////////////////////////////////////////////////////////////// 
New-MeAllEnvDatabases
 
#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms "environments"