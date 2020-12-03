Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

# https://dev.to/ofhouse/add-a-bash-like-autocomplete-to-your-powershell-4257
New-Alias open ii
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# auto completion for ripgrep
# . _rg.ps1

function touch {
    $file = $args[0]
    if ($null -eq $file) {
        throw "No filename supplied"
    }

    if (Test-Path $file) {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else {
        New-Item -ItemType file $file
    }
}
