Import-Module ..\common\common.psm1 
 
Remove-LocalDb "demo01"
Remove-LocalDb "demo02"
Remove-LocalDb "demo03"
Remove-LocalDb "demo04"
Remove-LocalDb "demo05"
Remove-LocalDb "demo06"
Remove-LocalDb "demo07"

#Remove-LocalDb "Prod"

Get-LocalDbInfo