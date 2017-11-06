$projFile = ".\Example.Db.sqlproj"
$dacpac = ".\bin\Debug\Example.Db.dacpac"
$publishProfile = "Deploy\DEV_MJE.publish.xml"

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