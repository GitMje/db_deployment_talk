Import-Module ..\..\common\common.psm1 
 
#////////////////////////////////////////////////////////////////////////////// 
# Delete all databases 
#////////////////////////////////////////////////////////////////////////////// 
Remove-MeAllDatabases

#////////////////////////////////////////////////////////////////////////////// 
# Create and publish to databases 
#////////////////////////////////////////////////////////////////////////////// 
New-MeAllEnvDatabases

#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms "ProjectsV13"
Start-MeSsms "environments"