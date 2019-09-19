## Script para crear certificado autofirmado para Code Signing y firmar el codigo para obtener la memoria de forma segura
$path = "C:\Windows\System32\drivers\etc\Get-PhysicalMemory.ps1"
wget https://raw.githubusercontent.com/sorcia25/PublicScripts/master/Get-PhysicalMemory.ps1 -OutFile $path
$cert1 = New-SelfSignedCertificate -KeyUsage DigitalSignature -CertStoreLocation "Cert:\CurrentUser\My" -DnsName PSCodeSigning -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3")
Set-AuthenticodeSignature -Certificate:$cert1 -FilePath $path
## Crear el schedule para ejecutar el script
$argument = '-NoProfile -WindowStyle Hidden -file '+ $path
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument $argument 
$trigger =  New-ScheduledTaskTrigger -Daily -At 1am
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Get-PhysicalMemory" -Description "Run a Powershell script to get total Physical Memory and save the value in a Registry Key" -Principal $principal
Get-ScheduledTask -TaskName "Get-PhysicalMemory" | Start-ScheduledTask
