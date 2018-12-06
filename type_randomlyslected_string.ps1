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
$randomlySelectedstring = Get-Random -InputObject username1,username2

<# make intended app in focus and send string #>
[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)
$randomlySelectedstring.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
