$preRegPath = 'HKLM:\SYSTEM\'
$RegKey = 'TotalPhysicalMemory'
$registrypath = $preRegPath+$RegKey

$Memory1 = (systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
$Memory2 = $Memory1.Replace('MB','')
$Memory3 = $Memory2.Replace(',','')
$TotalMemory = [int]$Memory3

New-Item -Path HKLM:\SYSTEM\ -Name TotalPhysicalMemory –Force
Set-Item -Path HKLM:\SYSTEM\TotalPhysicalMemory -Value $TotalMemory -Type String –Force
