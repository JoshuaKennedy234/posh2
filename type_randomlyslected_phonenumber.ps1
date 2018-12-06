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
$RandomPhoneNumber = Get-Random -Minimum 2111111111 -Maximum 9999999999 | Out-String

<# make intended app in focus and send strings #>
[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)

$RandomPhoneNumber = $RandomPhoneNumber.Trim()
$RandomPhoneNumber.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}