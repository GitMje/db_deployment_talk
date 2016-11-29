#////////////////////////////////////////////////////////////////////////////// 
# Start SSMS 
#////////////////////////////////////////////////////////////////////////////// 
function Start-MeSsms 
{ 
    param([Object]$db) 
    Ssms -E -S "(LocalDB)\$db" -nosplash   
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
    if ($prev) 
    { 
      sqllocaldb p $prev 
      sqllocaldb d $prev 
    } 
 
    # Make sure that current database is cleaned up 
    sqllocaldb p $curr 
    sqllocaldb d $curr 
 
    # Create new current database 
    sqllocaldb c $curr -s 
}

function New-LocalDb 
{ 
    Param( [string]$Name ) 
    # Make sure that previous database is cleaned up 
    if ($Name) 
    { 
      sqllocaldb p $Name 
      sqllocaldb d $Name 
    } 
    sqllocaldb c $Name -s 
}