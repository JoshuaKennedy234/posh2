$procTitle = "placeholder"
$enter = '~'
$waitForApp = "10"
Add-Type -AssemblyName System.Windows.Forms
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

start-sleep $waitForApp

$procTitles = get-process | sort mainwindowtitle | select mainwindowtitle

if ($procTitles -match $procTitle)
{
    Write-host "Progressing through target UI"
    [Microsoft.VisualBasic.Interaction]::AppActivate($procTitle)
    $enter.ToCharArray() | ForEach-Object {[System.Windows.Forms.SendKeys]::SendWait($_)}
}
else
{
    Exit
}

start-sleep 1

do {
    start-sleep 3
    $procTitles = get-process | sort mainwindowtitle | select mainwindowtitle
    Write-host "Still waiting for it to close"
} while ($procTitles -match $procTitle)

Exit
