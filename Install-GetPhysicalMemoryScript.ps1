## Script para crear certificado autofirmado para Code Signing y firmar el codigo para obtener la memoria de forma segura
$path = "C:\Windows\System32\drivers\etc\Get-PhysicalMemory.ps1"
wget https://raw.githubusercontent.com/sorcia25/PublicScripts/master/Get-PhysicalMemory.ps1 -OutFile $path
$cert1 = New-SelfSignedCertificate -KeyUsage DigitalSignature -CertStoreLocation "Cert:\CurrentUser\My" -DnsName PSCodeSigning -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3")
Set-AuthenticodeSignature -Certificate:$cert1 -FilePath $path