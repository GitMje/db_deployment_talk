Import-Module ..\common\common.psm1 
 
 
$curr = "demo01" 
 
#////////////////////////////////////////////////////////////////////////////// 
# LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
#Initialize-LocalDb $prev $curr 
New-LocalDb $curr
#New-LocalDb "Prod"
#Invoke-Sqlcmd -InputFile ".\Prod.publish.sql"
 
 
#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms $curr