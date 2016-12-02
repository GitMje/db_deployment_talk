$projFile = ".\Example.Db\Example.Db\Example.Db.sqlproj"
$dacpac = ".\Example.Db\Example.Db\bin\Output\Example.Db.dacpac"
$publishProfile = "Example.Db\Example.Db\Deploy\DEV.publish.xml"

Write-Host "==============================================================================="
Write-Host "== Build DACPAC                                                              =="
Write-Host "==============================================================================="
$command = "msbuild $projFile /t:build /p:Configuration='Local'"
Invoke-Expression $command

Write-Host "==============================================================================="
Write-Host "== Publish Database                                                          =="
Write-Host "==============================================================================="
$command = "sqlpackage.exe /Action:Publish /Sourcefile:$dacpac /Profile:'$publishProfile'"
Invoke-Expression $command