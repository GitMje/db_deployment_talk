#--$dbName: the name of the database to targets
$dbName = "Dev"
#--$dbPublishProfile: the publish profile to use when deploying
$dbPublishProfile = "DEV.publish.xml"

#--$dbUser: the database user to use
$dbUser = "merpenbeck"

#--$dbPassword: the password for the user being used
$dbPassword = "REDACTED"

# Set params
if (! $dbName)
{
}
if (! $dbPublishProfile)
{
    Write-Host "Missing required variable dbPublishProfile" -ForegroundColor Yellow
    exit 1
}
if (! $dbUser)
{
    Write-Host "Missing required variable dbUser" -ForegroundColor Yellow
    exit 1
}
if (! $dbPassword)
{
    Write-Host "Missing required variable dbPassword" -ForegroundColor Yellow
    exit 1
}

#$OctopusParameters["BlockOnPossibleDataLoss"]
$dataLoss = "False"
$smartDefaults = "False" 
 
if (!$smartDefaults) {
    Write-Host "Missing required variable smartDefaults" -ForegroundColor Yellow
    exit 1
}
 
if (!$dataLoss) {
    Write-Host "Missing required variable dataLoss" -ForegroundColor Yellow
    exit 1
}
 
if (!$TargetConnectionString) {
    throw "Target connection parameter missing!"   
}
 
Write-Host "Deploying database now..." -NoNewline
 
New-Alias -Name sqlpackage -Value "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\sqlpackage.exe"
sqlpackage /Action:Publish /SourceFile:"[[DACPAC_NAME]].dacpac" /tcs:$TargetConnectionString `
    /p:GenerateSmartDefaults=$smartDefaults /p:BlockOnPossibleDataLoss=$dataLoss
 
Write-Host "deployed"