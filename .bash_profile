#FIXME:install - fortune | cowsay -f tux

shopt -s autocd
shopt -s histappend

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export HOSTNAME=dooderstem
export HISTSIZE=5000
export HISTFILESIZE=10000
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export aliases=$HOME/.bash_aliases
export rc=$HOME/.bashrc
export pf=$HOME/.bash_profile
export env=$HOME/.bash_env

txtred="\e[0;31m" # Red
txtgrn="\e[0;32m" # Green
bldgrn="\e[1;32m" # Bold Green
bldpur="\e[1;35m" # Bold Purple
txtrst="\e[0m"    # Text Reset

emojis1=("🎲" "🌍")
emojis2=("🎲" "💵")

EMOJI1=${emojis1[$RANDOM % ${#emojis1[@]}]}
EMOJI2=${emojis2[$RANDOM % ${#emojis2[@]}]}

PS1="$EMOJI1 $EMOJI2 >"

mkcd() {
        mkdir $1 && cd $1
}

file() {
        touch $1 && code $1
}

mkfile() {
        mkdir $1 && file $2
}

exists() {
        if [ "$#" -ne 1 ]; then
                printf "\n$txtred%s: $txtrst%s\n" "${FUNCNAME[0]}" "You did not specify a path"
                return 1
        else
                test -e $1 && echo "Path exists" || echo "Path does not exist"
        fi
}

clrhist() {
        history -c && history -w
        echo -e "\nHasta la vista, history! Cleaning up the past... 🚀"
}

addalias() {
        if [ "$#" -ne 2 ]; then
                printf "\n$txtred%s: $txtrst%s\n$txtrst%s\n" "${FUNCNAME[0]}" "Two parameters are required" "Try '${FUNCNAME[0]} alias command'"
                return 1
        fi
        if ! grep -q "^alias $1='" "$aliases"; then
                alias "$1"="$2"
                sed -i "1,/^####### Aliases #######$/ {/^####### Aliases #######$/!{n;b};a\
                alias $1='$2'
                }" "$aliases"
                printf "\n$txtgrn%s: $txtrst%s\n" "${FUNCNAME[0]}" "Alias set for '$1' as '$2'"
        else
                printf "\n$txtred%s: $txtrst%s\n" "${FUNCNAME[0]}" "Alias '${1}' already exists"

        fi
}

rmalias() {
        if [ "$#" -ne 1 ]; then
                printf "\n$txtred%s: $txtrst%s\n$txtrst%s\n" "${FUNCNAME[0]}" "A parameter is required" "Try '${FUNCNAME[0]} alias'"
                return 1
        fi
        if alias $1 >/dev/null 2>&1; then
                unalias $1
                sed -i "/alias $1=/d" "$aliases"
                printf "\n$txtgrn%s: $txtrst%s\n" "${FUNCNAME[0]}" "Alias '${1}' removed successfully"
        else
                printf "\n$txtred%s: $txtrst%s\n" "${FUNCNAME[0]}" "No such alias: '${1}'"
                return 1
        fi
}

print_before_the_prompt() {
        dir=$PWD
        home=$HOME
        dir=${dir/"$HOME"/"~"}
        format="\n$txtred%s: $bldpur%s $txtgrn%s\n$txtrst"
        if [ -x "$HOME/bin/vcprompt" ]; then
                if [ -d "$dir/.git" ]; then
                        printf "$format" "$HOSTNAME" "$dir" "$($HOME/bin/vcprompt)"
                else
                        printf "$format" "$HOSTNAME" "$dir"
                fi
        else
                printf "$format" "$HOSTNAME" "$dir"
        fi
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

[[ $- == *i* && -f "$rc" ]] && source "$rc"
[ -f "$aliases" ] && source "$aliases"
[ -f ~/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh || echo "nvm not found"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" ]
