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
$des = "$PROFILE.CurrenUserCurrentHost"
Get-Content -Path $src -Raw | Add-Content -Path $des -Confirm:$false

"Finished."
