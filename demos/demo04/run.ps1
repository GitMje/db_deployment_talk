Import-Module ..\common\common.psm1 
 
 
$prev = "demo03"
$curr = "demo04"
 
#////////////////////////////////////////////////////////////////////////////// 
# LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
Initialize-LocalDb $prev $curr 
 
#////////////////////////////////////////////////////////////////////////////// 
# SSMS 
#////////////////////////////////////////////////////////////////////////////// 
Start-MeSsms $curr