$StartParams = @{
    FilePath = "$Env:SystemRoot\regedit.exe"
    ArgumentList = '/s','.\colors.reg'
    Verb = 'RunAs'
    PassThru = $True
    Wait = $True
}
$Proc = Start-Process @StartParams

If ($Proc.ExitCode -ne 0) {
    Write-Host "Failed importing registry! Exit code: $($Proc.ExitCode)" 
    Exit
}

$src = "Microsoft.PowerShell_profile.ps1"
$des = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
If (Test-Path $des) {
    "Existing PowerShell profile detected."
    Copy-Item -Path $src -Destination $des -Confirm
} Else {
    Copy-Item -Path $src -Destination $des
}

"Finished."