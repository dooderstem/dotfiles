# .bash_profile is executed when a user logs into the system or opens a new terminal window for the first time. This file is executed only once when you log in to your system or open a new terminal emulator window.

# fortune | cowsay -f tux

shopt -s autocd
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export HOSTNAME=dooderstem

export HISTSIZE=5000
export HISTFILESIZE=10000
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:$HOME/bin

export pf=~/.bash_profile
export aliases=~/.bash_aliases
export rc=~/.bashrc

if [ -f "$rc" ]; then
        source "$rc"
        echo "Sourced: $rc"
else
        echo "$rc" not found
fi

if [ -f ~/.nvm/nvm.sh ]; then
        source ~/.nvm/nvm.sh
        echo "Sourced: $(dirname ~/.nvm/nvm.sh)"
        nvm use stable #
else
        echo "nvm not found"
fi

if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
fi

# python -V
# pip -V
# pyenv --version
# ruby -v
# echo "gem version "$(gem -v)""

emojis1=("🎲" "🌍")
emojis2=("🎲" "💵")
EMOJI1=${emojis1[$RANDOM % ${#emojis1[@]}]}
EMOJI2=${emojis2[$RANDOM % ${#emojis2[@]}]}

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
