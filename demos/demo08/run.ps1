Import-Module ..\..\common\common.psm1 
 
#////////////////////////////////////////////////////////////////////////////// 
# Delete all env databases 
#////////////////////////////////////////////////////////////////////////////// 
Remove-MeAllEnvDatabases

#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms "environments"