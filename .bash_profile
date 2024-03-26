# fortune | cowsay -f tux
HOSTNAME=dooderstem

export HISTSIZE=5000
export HISTFILESIZE=10000
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:$HOME/bin
# export BW_SESSION="/ik/C4/c8L5tyLHULY6WqQHjNcFOe+2p0q9BicAR4EQjnY6EYSidqrqTjzldt07o1M6aMHtJuhX50GEEgXy/wg=="
# $env:BW_SESSION="/ik/C4/c8L5tyLHULY6WqQHjNcFOe+2p0q9BicAR4EQjnY6EYSidqrqTjzldt07o1M6aMHtJuhX50GEEgXy/wg=="

. $HOME/.nvm/nvm.sh
. $HOME/.bashrc

shopt -s autocd
shopt -s histappend

# nvm use stable
# python -V
# pip -V
# pyenv --version
# ruby -v
# echo "gem version "$(gem -v)""

emojis1=("🎲" "🌍")
emojis2=("🎲" "💵")
EMOJI1=${emojis1[$RANDOM % ${#emojis1[@]}]}
EMOJI2=${emojis2[$RANDOM % ${#emojis2[@]}]}

# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

function print_before_the_prompt() {
        dir=$PWD
        home=$HOME
        dir=${dir/"$HOME"/"~"}
        printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOSTNAME" "$dir" #!FIXME - "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI1 $EMOJI2 >"

function mkcd() {
        mkdir $1 && cd $1
}

# ----------------------
# Genaral Aliases
# ----------------------
alias x="exit 0"
alias quit="exit 0"
alias gpt="npx chatgpt"

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
alias reloadrc="clr; . ~/.bashrc"
alias refreshrc="clr; . ~/.bashrc"

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
# alias py="python"
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
alias ns='npm start'
alias nstart='npm start'
alias nr='npm run'
alias nrun='npm run'
alias nis='npm i -S'
alias npmrm='npm uninstall'
alias nupdate="npm update"
alias nold="npm outdated"

#######################################################################################################
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" ] # This loads nvm bash_completion
