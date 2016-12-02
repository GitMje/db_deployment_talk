$projFile = ".\Example.Db\Example.Db.Tests\Example.Db.Tests.sqlproj"
$dacpac = ".\Example.Db\Example.Db.Tests\bin\Output\Example.Db.Tests.dacpac"
$publishProfile = ".\Example.Db\Example.Db.Tests\Deploy\DEV.publish.xml"

Write-Host "==============================================================================="
Write-Host "== Build Test DACPAC                                                         =="
Write-Host "==============================================================================="
$command = "msbuild $projFile /t:build /p:Configuration='Local'"
Invoke-Expression $command

Write-Host "==============================================================================="
Write-Host "== Publish Test Database                                                     =="
Write-Host "==============================================================================="
$command = "sqlpackage.exe /Action:Publish /Sourcefile:$dacpac /Profile:'$publishProfile'"
Invoke-Expression $command
