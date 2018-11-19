# copy below to $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

function prompt {
    Write-Host -ForegroundColor Green "$(Get-Location)"
    Write-Host -nonewline -ForegroundColor Gray "λ" 
    " "
}

$Host.PrivateData.DebugBackgroundColor = "DarkGray"
$Host.PrivateData.ErrorBackgroundColor = "DarkGray"
Set-PSReadLineOption -Colors @{
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
