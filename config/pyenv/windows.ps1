$env:PYENV =      ($env:USERPROFILE + '\.pyenv\pyenv-win\')
$env:PYENV_ROOT = ($env:USERPROFILE + '\.pyenv\pyenv-win\')
$env:PYENV_HOME = ($env:USERPROFILE + '\.pyenv\pyenv-win\')
$env:PATH =       ($env:USERPROFILE + '\.pyenv\pyenv-win\bin;'   + $env:PATH)
$env:PATH =       ($env:USERPROFILE + '\.pyenv\pyenv-win\shims;' + $env:PATH)

$env:PYTHONSCRIPTS = Get-ChildItem ($env:APPDATA + '\Python\*\Scripts') | ForEach-Object {
  $env:PATH += ';' + $_.FullName
}
