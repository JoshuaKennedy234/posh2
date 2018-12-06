$appTitleName = "Cars - Quote / Shop"
#$appTitleName = "Notepad"
$initialDay = "1"
$secondaryDay = "1"
$airport = "ord"
$abbreviatedMonthPlusOne = (Get-Date).AddMonths(1).ToString('MMM') | out-string
$lowercaseMonth = $abbreviatedMonthPlusOne.ToLower()
$timestampPickupHH = Get-Random -InputObject "09","10","11","12" | Out-String
$timestampDropoffHH = Get-Random -InputObject 13,14,15,16,17 | Out-String
$timestampMM1 = Get-Random -InputObject "00","01","02","03","04","05","06","07","08","09",10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59 | Out-String
$timestampMM2 = Get-Random -InputObject "00","01","02","03","04","05","06","07","08","09",10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59 | Out-String

Add-Type -AssemblyName System.Windows.Forms
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)
start-sleep 1
$initialDay.ToCharArray() | Select-Object -first 1 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$lowercaseMonth.ToCharArray() | Select-Object -first 3 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$timestampPickupHH.ToCharArray() | Select-Object -first 2 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$timestampMM1.ToCharArray() | Select-Object -first 2 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$secondaryDay.ToCharArray() | Select-Object -first 1 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$lowercaseMonth.ToCharArray() | Select-Object -first 3 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$timestampDropoffHH.ToCharArray() | Select-Object -first 2 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$timestampMM2.ToCharArray() | Select-Object -first 2 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1
$airport.ToCharArray() | Select-Object -first 3 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1