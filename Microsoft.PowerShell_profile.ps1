# copy below to $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

function prompt {
    Write-Host -ForegroundColor Green "$(Get-Location)"
    Write-Host -nonewline -ForegroundColor Gray "λ" 
    " "
}

$Host.PrivateData.DebugBackgroundColor = "DarkGray"
$Host.PrivateData.ErrorBackgroundColor = "DarkGray"


$promptColors = @{
    'Command' = 'White'
    'Comment' = 'DarkGreen'
    'Keyword' = 'Blue'
    'Member' = 'Cyan'
    'Number' = 'Yellow'
    'Operator' = 'Magenta'
    'Parameter' = 'Cyan'
    'String' = 'Yellow'
    'Type' = 'Green'
    'Variable' = 'White'
}
if((Get-Module -Name "PSReadline").Version -gt 1.0.0) {
    Set-PSReadLineOption -Colors $promptColors
} else {
    Set-PSReadlineOption -TokenKind Command   -ForegroundColor White
    Set-PSReadlineOption -TokenKind Comment   -ForegroundColor DarkGreen
    Set-PSReadlineOption -TokenKind Keyword   -ForegroundColor Blue
    Set-PSReadlineOption -TokenKind Member    -ForegroundColor Cyan
    Set-PSReadlineOption -TokenKind Number    -ForegroundColor Yellow
    Set-PSReadlineOption -TokenKind Operator  -ForegroundColor Magenta
    Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Cyan
    Set-PSReadlineOption -TokenKind String    -ForegroundColor Yellow
    Set-PSReadlineOption -TokenKind Type      -ForegroundColor Green
    Set-PSReadlineOption -TokenKind Variable  -ForegroundColor White
}
