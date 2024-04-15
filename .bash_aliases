# This script defines a function 'add_alias' to simplify the creation of Bash aliases. It then uses this function to define various aliases for common commands, making them easier to use.

#! Sourced in: C:\Users\User\.bash_profile

export aliases=~/.bash_aliases

add_alias() {
    if ! grep -q "^alias $1='" "$aliases"; then
        alias $1="$2"
        sed -i '10,/####### Aliases #######/ {n;/####### Aliases #######/ a\
'"alias $1='$2'"'
}' "$HOME/.bash_aliases"
        echo "Alias set for '$1' as '$2'."
    else
        echo "Alias '$1' already exists."
    fi
}

rm_alias() {
    if alias $1 >/dev/null 2>&1; then
        unalias $1
        sed -i "/alias $1=/d" "$aliases"
        echo "Removed alias for '$1'."
    else
        echo "Alias '$1' does not exist. Nothing to remove."
    fi
}

####### Aliases #######
alias vite='npx vite'

alias *='cd D:/dooder'
alias **='cd D:/dooder/dooderstem'
alias bash='start D:/Git/git-bash.exe'
alias bitwarden='bw'
alias chatgpt='npx chatgpt'
alias clr='clear'
alias cls='clear'
alias cmd='start C:/WINDOWS/system32/cmd.exe'
alias dir='pwd -LPW'
alias exit='exit 0'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gc='git checkout'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gpshup='git push --set-upstream upstream master'
alias grh='git reset --hard'
alias grm='git rm --cached'
alias grs='git reset --soft'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gss='git status -s'
alias ipython='winpty ipython.exe'
alias kuma='npx uptime-kuma'
alias ll='ls -l'
alias logout="exit"
alias ls='ls -F --color=auto --show-control-chars'
alias lsal='ls -al'
alias lsdl='ls -dl'
alias nadd='npm install'
alias next='npx next'
alias nextapp='npx create-next-app@latest'
alias node='winpty node.exe'
alias nodemon='npx nodemon'
alias nold='npm outdated'
alias nrm='npm uninstall'
alias nupdate='npm update'
alias open='start ""'
alias p5='npx p5js'
alias p5js='npx p5js'
alias pip='python -m pip'
alias pm='npx pm2'
alias pwd='pwd -LPW'
alias pwsh='powershell.exe'
alias py='python'
alias quit='exit'
alias run='npm run'
alias say='echo'
alias ts='npx typescript'
alias tsc='npx tsc'
alias tscw='npx tsc --watch'
alias x='exit'
alias ytdl='youtube-dl'
