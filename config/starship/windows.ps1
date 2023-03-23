$env:STARSHIP_CONFIG = ($env:USERPROFILE + '\dotfiles\starship.toml')
Invoke-Expression (&starship init powershell)
