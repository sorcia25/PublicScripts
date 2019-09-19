# PublicScripts
In this repository I'll put many scripts for different functions

## Get-PhysicalMemory.ps1
This script get the total physical memory of a system and put the value in MB in a **resgistry key** accord to the **$path** value.

## Install-GetPhysicalMemory.ps1
Execute this script in **Azure-->VM-->Operations-->Run Command**. This script will download the **Get-PhysicalMemory.ps1** from **GitHub**, create a self signed certificate, signing the code with that certificate to doing the execution without changing the execution policy of the system and create a scheduled task to refresh the memory value **every day at 1am**.
