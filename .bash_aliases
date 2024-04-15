# This script defines a function 'define_alias' to simplify the creation of Bash aliases. It then uses this function to define various aliases for common commands, making them easier to use.

define_alias() {
    alias $1="$2"
}

# General Aliases
define_alias '*' 'cd D:/dooder'
define_alias '**' 'cd D:/dooder/dooderstem'
define_alias x 'exit 0'
define_alias quit 'exit 0'
define_alias bash 'start D:/Git/git-bash.exe'
define_alias cmd 'start C:/WINDOWS/system32/cmd.exe'
define_alias bitwarden 'bw'
define_alias ytdl 'youtube-dl'
define_alias say 'echo'
define_alias open 'start ""'
define_alias clr 'clear'
define_alias cls 'clear'
define_alias lsal 'ls -al'
define_alias lsdl 'ls -dl'
define_alias pwd 'pwd -LPW'
define_alias dir 'pwd -LPW'
define_alias py 'python'
define_alias pip 'python -m pip'

# Git Aliases
define_alias ga 'git add'
define_alias gaa 'git add .'
define_alias gaaa 'git add -A'
define_alias gp 'git pull'
define_alias gpsh 'git push'
define_alias gpshup 'git push --set-upstream upstream master'
define_alias grs 'git reset --soft'
define_alias grh 'git reset --hard'
define_alias grm 'git rm --cached'
define_alias gc 'git commit'
define_alias gcm 'git commit -m'
define_alias gd 'git diff'
define_alias gl 'git log'
define_alias gss 'git status -s'
define_alias gb 'git branch'
define_alias gc 'git checkout'
define_alias gs 'echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# NPM Aliases
define_alias run 'npm run'
define_alias nrm 'npm uninstall'
define_alias nupdate 'npm update'
define_alias nadd 'npm install'
define_alias nold 'npm outdated'

# NPX Aliases
define_alias kuma 'npx uptime-kuma'
define_alias p5js 'npx p5js'
define_alias p5 'npx p5js'
define_alias pm 'npx pm2'
define_alias nodemon 'npx nodemon'
define_alias ts 'npx typescript'
define_alias tsc 'npx tsc'
define_alias tscw 'npx tsc --watch'
define_alias next 'npx next'
define_alias nextapp 'npx create-next-app@latest'
