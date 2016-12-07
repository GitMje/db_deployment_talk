Import-Module ..\..\common\common.psm1 
 
#////////////////////////////////////////////////////////////////////////////// 
# LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
New-LocalDb "demo"
New-LocalDb "environments"

#////////////////////////////////////////////////////////////////////////////// 
# Delete all env databases 
#////////////////////////////////////////////////////////////////////////////// 
Remove-MeAllEnvDatabases
Remove-MeDatabase "(LocalDb)\ProjectsV13" "ExampleDb"
Remove-MeDatabase "(LocalDb)\ProjectsV13" "Example.Db"
Remove-MeDatabase "(LocalDb)\ProjectsV13" "Example.Db_2"

#////////////////////////////////////////////////////////////////////////////// 
# Create and publish to databases 
#////////////////////////////////////////////////////////////////////////////// 
New-MeAllEnvDatabases
 
#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms "environments"
Start-MeSsms "ProjectsV13"