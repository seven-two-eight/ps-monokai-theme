# copy below to $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

function prompt {
    Write-Host -ForegroundColor DarkGreen  "$(Get-Location)"
    Write-Host -nonewline -ForegroundColor Gray  "λ" 
    " "
}

$Host.PrivateData.DebugBackgroundColor = "DarkGray"
$Host.PrivateData.ErrorBackgroundColor = "DarkGray"

Set-PSReadlineOption -TokenKind Command   -ForegroundColor White
Set-PSReadlineOption -TokenKind Keyword   -ForegroundColor DarkYellow
Set-PSReadlineOption -TokenKind Member    -ForegroundColor White
Set-PSReadlineOption -TokenKind Number    -ForegroundColor White
Set-PSReadlineOption -TokenKind Operator  -ForegroundColor White
Set-PSReadlineOption -TokenKind Parameter -ForegroundColor DarkCyan
Set-PSReadlineOption -TokenKind String    -ForegroundColor DarkYellow
Set-PSReadlineOption -TokenKind Type      -ForegroundColor DarkCyan
Set-PSReadlineOption -TokenKind Variable  -ForegroundColor White