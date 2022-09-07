$NewPassword = (Read-Host -Prompt "Provide New" -AsSecureString) 
$accounttochange = (Read-Host -Prompt "Samaccountname")     

$randoUpper = (65..90) | Get-Random -Count 1 | % {[char]$_}
$randoLower = (97..122) | Get-Random -Count 1 | % {[char]$_}
$randoSymbol = (33..47) | Get-Random -Count 1 | % {([char]$_).ToString()}
#$randoNum = (48..57) | Get-Random -Count 1 | % {([char]$_).ToString()}

$base = $randoLower + $randoUpper + $randoSymbol
$base += $(Get-Random).ToString()
#$base

1..12 | foreach {
    $temppass = ConvertTo-SecureString $base -AsPlainText -Force
    Set-ADAccountPassword -Identity $accounttochange -NewPassword $temppass -Reset
    $base += $PSItem
    "Cycle $PSItem" | Out-Host
}

"`n`n"
Set-ADAccountPassword -Identity $accounttochange -NewPassword $NewPassword -Reset -verbose





