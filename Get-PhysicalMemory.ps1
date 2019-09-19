$filepath = 'C:\Windows\System32\drivers\etc\avmemory.log'
if (Test-Path -Path $filepath) {Remove-Item $filepath}
$Memory1 = (systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
$Memory2 = $Memory1.Replace('MB','')
$Memory3 = $Memory2.Replace(',','')
$TotalMemory = [int]$Memory3
$TotalMemory | Out-File -FilePath $filepath
