#! Sourced in 'C:\Users\User\.bash_profile'

export PATH="$PATH:$HOME/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/libexec:$PATH"
export PATH="$PATH:/c/Program Files/nodejs:/c/Program Files/nodejs/node_modules/npm/bin:/c/Users/User/.pyenv/pyenv-win/bin:/c/Ruby32-x64/bin:/c/Windows/System32/WindowsPowerShell/v1.0:/c/Users/User/AppData/Local/GitHubDesktop/bin:/c/Program Files/GitHub CLI:/c/Users/User/AppData/Local/Programs/Python/Python311:/c/Users/User/AppData/Local/Programs/Python/Python311/Scripts:/c/ProgramData/chocolatey/bin:/c/Program Files/Meson:/c/Program Files/Docker/Docker/resources/bin:/c/Users/User/.emacs.d/bin:/c/ProgramData/chocolatey/lib/ripgrep:/c/Program Files/Mozilla Firefox:/c/Program Files (x86)/Microsoft/Edge/Application:/c/Program Files/Google/Chrome/Application:/c/Users/User/AppData/Local/Programs/Opera:/c/Windows/System32"
export PATH="$PATH:/d/xampp/apache/bin:/d/xampp/mysql/bin:/d/Microsoft VS Code/bin:/d/Git/cmd:/d/explorer++_1.3.5_x64:/d/GIMP 2/bin:/d/Emacs-28.2/emacs-28.2/bin"

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -f "$env" ]; then source "$env"; fi
