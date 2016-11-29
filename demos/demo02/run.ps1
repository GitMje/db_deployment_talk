$prev = "demo01"
$curr = "demo02"

function Start-MeSqlServer
{
    param([Object]$db)
    Ssms -E -S "(LocalDB)\$db" -nosplash  
}

sqllocaldb p $prev
sqllocaldb d $prev

sqllocaldb c $curr -s

Start-MeSqlServer $curr