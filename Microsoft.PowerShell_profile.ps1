# copy below to $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

function prompt {
    Write-Host -ForegroundColor Green (Get-Location).Path.Replace($HOME, "~")
    Write-Host -nonewline -ForegroundColor Gray "λ" 
    " "
}

$Host.PrivateData.DebugBackgroundColor = "DarkGray"
$Host.PrivateData.ErrorBackgroundColor = "DarkGray"

$tokenColors = @{
    'Command'   = 'White'
    'Comment'   = 'DarkGreen'
    'Keyword'   = 'Blue'
    'Member'    = 'Cyan'
    'Number'    =  'Yellow'
    'Operator'  = 'Magenta'
    'Parameter' = 'Cyan'
    'String'    = 'Yellow'
    'Type'      = 'Green'
    'Variable'  = 'White'
}

if((Get-Module -Name "PSReadline").Version.Major -gt 1) {
    Set-PSReadLineOption -Colors $tokenColors
} else { foreach ($tokenColor in $tokenColors.GetEnumerator()) {
    Set-PSReadlineOption -TokenKind $tokenColor.Name -ForegroundColor $tokenColor.Value
}}
