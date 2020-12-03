# Install

```
winget install Microsoft.WindowsTerminal
```

# Explorer extension to open Terminal

https://github.com/KUTlime/PowerShell-Open-Here-Module

```powershell
Install-Module OpenHere

# As Administrator:
> Set-OpenHereShortcut -ShortcutType:WindowsTerminal
# Uninstall:
# > Remove-OpenHereShortcut -ShortcutType:WindowsTerminal
```

# Font

Download: https://www.nerdfonts.com/font-downloads

# Shell (starship-x86_64-pc-windows-msvc.zip)

Download: https://github.com/starship/starship/releases/

place in `$HOME/.cargo/bin` or in any other folder that is in $PATH

## Other resources

https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup

https://devblogs.microsoft.com/commandline/windows-terminal-tips-and-tricks/
