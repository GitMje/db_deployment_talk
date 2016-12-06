#////////////////////////////////////////////////////////////////////////////// 
# Variables 
#////////////////////////////////////////////////////////////////////////////// 
$baseDir = "C:\src\github\db_deployment_talk"
$commonDir = "$baseDir\demos\common" 

#////////////////////////////////////////////////////////////////////////////// 
# Start SSMS 
#////////////////////////////////////////////////////////////////////////////// 
function Start-MeSsms 
{ 
    param([Object]$db) 
    Ssms -E -S "(LocalDB)\$db" -nosplash   
} 

#////////////////////////////////////////////////////////////////////////////// 
# Get LocalDB Info 
#////////////////////////////////////////////////////////////////////////////// 
function Get-LocalDbInfo
{ 
    sqllocaldb i 
}

#////////////////////////////////////////////////////////////////////////////// 
# Remove LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
function Remove-LocalDb 
{ 
    Param( [string]$Name ) 
     
    if ($Name) 
    { 
      sqllocaldb p $Name 
      sqllocaldb d $Name 
    }  
}

#////////////////////////////////////////////////////////////////////////////// 
# New LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
function New-LocalDb 
{ 
    Param( [string]$Name ) 

    sqllocaldb c $Name -s 
}

#////////////////////////////////////////////////////////////////////////////// 
# Initialize LocalDB 
#////////////////////////////////////////////////////////////////////////////// 
function Initialize-LocalDb 
{ 
    Param( 
        [string]$prev, 
        [string]$curr 
    ) 
    # Make sure that previous database is cleaned up 
    Remove-LocalDb $prev

    # Remove and create the new one
    Remove-LocalDb $curr
    New-LocalDb $curr
}

#////////////////////////////////////////////////////////////////////////////// 
# Remove (Drop) a Database 
#   Usage: Remove-MeDatabase "(LocalDb)\demo" "ExampleDb"
#////////////////////////////////////////////////////////////////////////////// 
function Remove-MeDatabase
{
    Param( 
        [string]$serverInstance, 
        [string]$databaseName 
    ) 

    $query = @"
        IF (DB_ID(N'$databaseName') IS NOT NULL) 
          BEGIN
            PRINT N'Dropping Database $databaseName...'
            ALTER DATABASE [$databaseName]
            SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
            DROP DATABASE [$databaseName];
          END
        ELSE
          BEGIN
            PRINT N'Database $databaseName does not exist. Nothing to do.'
          END
"@;

    Write-Debug $query;

    Invoke-Sqlcmd -ServerInstance $serverInstance -Query $query -Verbose
}

#////////////////////////////////////////////////////////////////////////////// 
# Remove (Drop) all env Databases
#   Usage: Remove-MeAllEnvDatabases
#////////////////////////////////////////////////////////////////////////////// 
function Remove-MeAllEnvDatabases
{
    Remove-MeDatabase "(LocalDb)\environments" "Prod"
    Remove-MeDatabase "(LocalDb)\environments" "QA"
    Remove-MeDatabase "(LocalDb)\environments" "Dev"
}


#////////////////////////////////////////////////////////////////////////////// 
# Remove (Drop) all Databases
#   Usage: Remove-MeAllDatabases
#////////////////////////////////////////////////////////////////////////////// 
function Remove-MeAllDatabases
{
    Remove-MeDatabase "(LocalDb)\demo" "ExampleDb"
    Remove-MeAllEnvDatabases
}

#////////////////////////////////////////////////////////////////////////////// 
# Add new (CREATE) a Database 
#   Usage: New-MeDatabase ".\ExampleDb.dacpac" ".\ExampleDb.publish.xml"
#////////////////////////////////////////////////////////////////////////////// 
function New-MeDatabase
{
    Param( 
        [string]$dacpac, 
        [string]$publishProfile 
    ) 

    Write-Host "==============================================================================="
    Write-Host "== Publish Database                                                          =="
    Write-Host "==============================================================================="
    
    $command = "sqlpackage.exe /Action:Publish /Sourcefile:$dacpac /Profile:'$publishProfile'"
    Write-Host "command = $command"
    Invoke-Expression $command
}

#////////////////////////////////////////////////////////////////////////////// 
# Add new (CREATE) ExampleDb Database 
#   Usage: New-MeExampleDatabase
#////////////////////////////////////////////////////////////////////////////// 
function New-MeExampleDatabase
{
    $dacpac = "$commonDir\ExampleDb.dacpac"
    $publishProfile = "$commonDir\ExampleDb.publish.xml"

    New-MeDatabase $dacpac $publishProfile
}

#////////////////////////////////////////////////////////////////////////////// 
# Add new (CREATE) Dev Database 
#   Usage: New-MeDevDatabase
#////////////////////////////////////////////////////////////////////////////// 
function New-MeDevDatabase
{
    $dacpac = "$commonDir\ExampleDb.dacpac"
    $publishProfile = "$commonDir\Env_Dev.publish.xml"

    New-MeDatabase $dacpac $publishProfile
}

#////////////////////////////////////////////////////////////////////////////// 
# Add new (CREATE) QA Database 
#   Usage: New-MeQaDatabase
#////////////////////////////////////////////////////////////////////////////// 
function New-MeQaDatabase
{
    $dacpac = "$commonDir\ExampleDb.dacpac"
    $publishProfile = "$commonDir\Env_Qa.publish.xml"

    New-MeDatabase $dacpac $publishProfile
}

#////////////////////////////////////////////////////////////////////////////// 
# Add new (CREATE) Prod Database 
#   Usage: New-MeProdDatabase
#////////////////////////////////////////////////////////////////////////////// 
function New-MeProdDatabase
{
    $dacpac = "$commonDir\ExampleDb.dacpac"
    $publishProfile = "$commonDir\Env_Prod.publish.xml"

    New-MeDatabase $dacpac $publishProfile
}

#////////////////////////////////////////////////////////////////////////////// 
# Create all Environments Databases
#   Usage: New-MeAllEnvDatabases
#////////////////////////////////////////////////////////////////////////////// 
function New-MeAllEnvDatabases
{
    New-MeDevDatabase
    New-MeQaDatabase
    New-MeProdDatabase
}

#////////////////////////////////////////////////////////////////////////////// 
# Create all Databases
#   Usage: New-MeProdDatabase
#////////////////////////////////////////////////////////////////////////////// 
function New-MeAllDatabases
{
    New-MeExampleDatabase
    New-MeAllEnvDatabases
}