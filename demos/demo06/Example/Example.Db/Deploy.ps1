$PackageName = $OctopusParameters["PackageName"]
$PublishProfile = $OctopusParameters["PublishProfile"]
$BlockOnPossibleDataLoss = $OctopusParameters["BlockOnPossibleDataLoss"]

#check for errors
if (! $PackageName)
{
    Write-Host "Missing required variable PackageName" -ForegroundColor Yellow
    exit 1
}

if (! $PublishProfile)
{
    Write-Host "Missing required variable PublishProfile" -ForegroundColor Yellow
    exit 1
}

if (! $BlockOnPossibleDataLoss)
{
    Write-Host "Missing required variable BlockOnPossibleDataLoss" -ForegroundColor Yellow
    exit 1
}

#Adjust for location
$PackageName = (Get-Location).Path + "\Content\$PackageName"
$PublishProfile = (Get-Location).Path + "\Content\$PublishProfile"
 
Write-Host "==============================================================================="
Write-Host "== Publish Database                                                          =="
Write-Host "==============================================================================="
$command = "sqlpackage.exe /Action:Publish /Sourcefile:$PackageName /Profile:'$PublishProfile' /p:BlockOnPossibleDataLoss=$BlockOnPossibleDataLoss"

Write-Host "command = $command"

Invoke-Expression $command