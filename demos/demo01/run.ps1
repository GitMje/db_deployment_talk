Import-Module ..\common\common.psm1 
 
#////////////////////////////////////////////////////////////////////////////// 
# Delete all databases 
#////////////////////////////////////////////////////////////////////////////// 
Remove-MeAllDatabases

#////////////////////////////////////////////////////////////////////////////// 
# Stop and Delete all LocalDBs
#////////////////////////////////////////////////////////////////////////////// 
Remove-LocalDb "demo"
Remove-LocalDb "environments"

