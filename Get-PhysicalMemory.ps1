$preRegPath = 'HKLM:\SYSTEM\'
$RegKey = 'Physical Memory Secnesys'
$registrypath = $preRegPath+$RegKey
# Get memory data
$Memory1 = (systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
$Memory2 = $Memory1.Replace('MB','')
$Memory3 = $Memory2.Replace(',','')
$TotalMemory = [int]$Memory3
# Create the Registry property
New-Item -Path $preRegPath -Name $RegKey -Force
$NewRegItem = $preRegPath+$RegKey
New-ItemProperty -Path $NewRegItem -Name MemoryinMB -PropertyType String -Value $TotalMemory
