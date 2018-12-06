$dropoffDay = "11"
$abbreviatedMonthPlusOne = (Get-Date).AddMonths(1).ToString('MMM') | out-string
$lowercaseMonth = $abbreviatedMonthPlusOne.ToLower()

#$appTitlename = "Notepad"
$appTitlename = "Flight"

Add-Type -AssemblyName System.Windows.Forms
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

write-host "starting powerexpresscardrop"
write-verbose "starting powerexpresscardrop"
start-sleep 60

[Microsoft.VisualBasic.Interaction]::AppActivate($appTitlename)
start-sleep 1
$dropoffDay.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1

$lowercaseMonth.ToCharArray() | Select-Object -first 3 {[System.Windows.Forms.SendKeys]::SendWait($_)}
start-sleep 1