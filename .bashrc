# .bashrc is executed every time a new terminal session is started, whereas .bash_profile is executed only when you log in to your system. This means that if you set environment variables in .bashrc, they will be available in all terminal sessions, but if you set them in .bash_profile, they will only be available in the first terminal session you open after logging in

# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/libexec:$PATH"
eval "$(pyenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" ] # This loads nvm bash_completion

# ----------------------
# Genaral Aliases
# ----------------------
alias *="cd D:/dooder"
alias **="cd D:/dooder/dooderstem"

alias x="exit 0"
alias quit="exit 0"

alias APPDATA="cd ~/AppData/Roaming"
alias doodercodes="cd E:/doodercodes"
alias gitbash="start D:/Git/git-bash.exe"
alias cmd="cd C:/WINDOWS/system32/ && start cmd.exe"

alias profile="code ~/.bash_profile"
alias pf="profile"
alias profilerc="code ~/.bashrc"
alias pfrc="profilerc"

alias reload="clr; . ~/.bash_profile"
alias refresh="clr; . ~/.bash_profile"
alias restart="clr; . ~/.bash_profile"
alias reset="clr; . ~/.bash_profile"

alias reloadrc="clr; . ~/.bashrc"
alias refreshrc="clr; . ~/.bashrc"
alias resetrc="clr; . ~/.bashrc"
alias restartrc="clr; . ~/.bashrc"

alias say="echo"

alias open='start "" '
alias file='touch'

alias clr='clear'
alias cls='clear'

alias lsal="ls -al"
alias lsdl="ls -dl"

alias pwd="pwd -LPW"
alias dir="pwd -LPW"

alias bitwarden="bw"
alias ytdl='youtube-dl'
alias dnr='dotnet run'
alias py="python"
# alias pip="python -m pip"

# alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"

alias jek="jekyll"
alias jeknew="jekyll new ."
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'

alias gp='git pull'
alias gpsh='git push'
alias gpshup='git push --set-upstream upstream master'

alias grs="git reset --soft"
alias grh="git reset --hard"

alias grm='git rm --cached'

alias gc='git commit'
alias gcm='git commit -m'

alias gd='git diff'
alias gl='git log'
alias gss='git status -s'
alias gb='git branch'
alias gc='git checkout'

alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# ----------------------
# NPM Aliases
# ----------------------
alias run='npm run'
alias nrm='npm uninstall'
alias nupdate="npm update"
alias nadd='npm install'
alias nold="npm outdated"

# ----------------------
# NPX Aliases
# ----------------------
alias kuma="npx uptime-kuma"
alias p5js="npx p5js"
alias p5="npx p5js"
alias pm="npx pm2"
alias nodemon="npx nodemon"
alias ts="npx typescript"
alias tsc="npx tsc"
alias tscw="npx tsc --watch"
alias next="npx next"
alias nextapp="npx create-next-app"

# ----------------------
