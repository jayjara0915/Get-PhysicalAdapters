<#
.SYNOPSIS
Get-PhysicalAdapters retrieves the physical adapters on a given computer
.Description
Display all adapters from Win32_NetworkAdapter class
#> 

# Jaymar Jaramillo
# date 8/1/2022

[cmdletbinding()]
param (
    [Parameter(Mandatory = $True, HelpMessage = "Enter a computername to query")]
    [alias('hostname')]
    [string]$computername
)
Write-Host "Getting the physical network adapters from $computername..." -ForegroundColor Yellow

Get-WmiObject -Class win32_networkadapter -ComputerName $computername |
    where { $_.PhysicalAdapter } |
    select MACAddress,AdapterType,DeviceID,Name,Speed | ft -AutoSize

Write-Host "Script Finished." -ForegroundColor Yellow