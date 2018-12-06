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
$UnixTimeStamp = [System.Math]::Truncate((Get-Date -Date (Get-Date).ToUniversalTime() -UFormat %s)) | Out-String

<# make intended app in focus and send string #>
[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)
$UnixTimeStamp.ToCharArray() | Select-Object -first 10 {[System.Windows.Forms.SendKeys]::SendWait($_)}