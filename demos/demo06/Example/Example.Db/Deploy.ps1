# Note: Octopus Deploy will run any PowerShell script 
#       in the root directory automatically upon publishing

# Grab Octopus variables
$PackageName = $OctopusParameters["PackageName"]
$PublishProfile = $OctopusParameters["PublishProfile"]
$BlockOnPossibleDataLoss = $OctopusParameters["BlockOnPossibleDataLoss"]

# Check for errors
if (! $PackageName)
{
    Write-Error -Message "Missing required variable PackageName"
    exit 1
}

if (! $PublishProfile)
{
    Write-Error -Message "Missing required variable PublishProfile"
    exit 1
}

if (! $BlockOnPossibleDataLoss)
{
    Write-Error -Message "Missing required variable BlockOnPossibleDataLoss"
    exit 1
}


# Adjust for location
$PackageName = (Get-Location).Path + "\Content\$PackageName"
$PublishProfile = (Get-Location).Path + "\Content\$PublishProfile"

# Run command 
$command = "sqlpackage.exe /Action:Publish /Sourcefile:$PackageName /Profile:'$PublishProfile' /p:BlockOnPossibleDataLoss=$BlockOnPossibleDataLoss"
Write-Debug "command = $command"
Invoke-Expression $command