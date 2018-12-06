<# command line usage 
c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -file "<script path>" -apptitlename "apptitlename"
#> 

<#command line params#>
param (
[Parameter(Mandatory=$true)][string]$appTitlename
)

<# assemblies load #>
Add-Type -AssemblyName System.Windows.Forms
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

<# set vars #>
$MonthRange = Get-Random -Minimum 1 -Maximum 12 | Out-String
$DayRange = Get-Random -Minimum 1 -Maximum 28 | Out-String
$YearRange = Get-Random -Minimum 1973 -Maximum 2002 | Out-String
set-variable -name "forwardSlash" -value "/"

<# make intended app in focus and send strings #>
[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)

$MonthRange = $MonthRange.Trim()
$DayRange = $DayRange.Trim()
$YearRange = $YearRange.Trim()
$MonthRange.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
$forwardSlash.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
$DayRange.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
$forwardSlash.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
$YearRange.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}