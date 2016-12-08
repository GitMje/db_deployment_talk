$date = Get-Date
$day = $date.Day
$month = $date.Month
$year = Get-Date -format "yy"
$hour = Get-Date -format "HH"
$min = Get-Date -format "mm"
$sec = $a.Second

$Version = "$year.$month.$day.$hour$min"
Write-Host $Version

msbuild Example.sln /t:Build /p:Configuration=Release /p:Platform="Any CPU" /p:RunOctoPack=true /p:OctoPackPublishPackageToHttp=http://deploy.erpenbeck.io/nuget/packages /p:OctoPackPublishApiKey=API-RP8AHTIZENBHV4JULTJSXVDSSRA /p:OctoPackPackageVersion=$version
