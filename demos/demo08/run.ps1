Import-Module ..\common\common.psm1
 
$prev = "demo07"
$curr = "demo08"
 
#////////////////////////////////////////////////////////////////////////////// 
# LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
Initialize-LocalDb $prev $curr 
 
#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms $curr