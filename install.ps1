# Get Script Path
try {
    if($PSVersionTable.PSVersion.Major -lt 3) {
        $scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
    }
    $scriptPath = $PSScriptRoot
    if (!$scriptPath) {
        if ($psISE) {
            $scriptPath = Split-Path -Parent -Path $psISE.CurrentFile.FullPath
        } else {
            Write-Host -ForegroundColor Red "Cannot resolve script file's path"
            exit 1
        }
    }
} catch {
    Write-Host -ForegroundColor Red "Caught Exception: $($Error[0].Exception.Message)"
    exit 2
}

# Backup colors
reg export 'HKCU:\Console\Windows PowerShell' "$scriptPath\backup_WindowsPowershell.reg"
reg export HKCU:\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe "$scriptPath\backup_WindowsPowershell_sys32.reg"
reg export HKCU:\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe "$scriptPath\backup_WindowsPowershell_sysWOW64.reg"

# Add colors
reg import "$scriptPath\colors.reg"

$src = "Microsoft.PowerShell_profile.ps1"
$des = "$PROFILE.CurrenUserCurrentHost"
Get-Content -Path $src -Raw | Add-Content -Path $des -Confirm:$false

"Finished."
