# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export HOSTNAME=dooderstem

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

txtred="\e[0;31m" # Red
txtgrn="\e[0;32m" # Green
bldgrn="\e[1;32m" # Bold Green
bldpur="\e[1;35m" # Bold Purple
txtrst="\e[0m"    # Text Reset

shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
CLICOLOR=1
LSCOLORS=GxFxCxDxBxegedabagaced

emojis1=("🎲" "🌍")
emojis2=("🎲" "💵")

EMOJI1=${emojis1[$RANDOM % ${#emojis1[@]}]}
EMOJI2=${emojis2[$RANDOM % ${#emojis2[@]}]}

PS1="$EMOJI1 $EMOJI2 >"

mkcd() {
    mkdir $1 && cd $1
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
    if ! grep -q "^alias $1='" "$HOME/.bash_aliases"; then
        alias "$1"="$2"
        sed -i "1,/^####### Aliases #######$/ {/^####### Aliases #######$/!{n;b};a\
                alias $1='$2'
                }" "$HOME/.bash_aliases"
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
        sed -i "/alias $1=/d" "$HOME/.bash_aliases"
        printf "\n$txtgrn%s: $txtrst%s\n" "${FUNCNAME[0]}" "Alias '${1}' removed successfully"
    else
        printf "\n$txtred%s: $txtrst%s\n" "${FUNCNAME[0]}" "No such alias: '${1}'"
        return 1
    fi
}

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
#
# # If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

print_before_the_prompt() {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    format="\n$txtred%s: $bldpur%s $txtgrn%s\n$txtrst"
    if [ -f ~/bin/vcprompt ]; then
        if [ -d .git ]; then
            printf "$format" "$HOSTNAME" "$dir" "[$(vcprompt)]"
            return 1
        fi
    fi
    printf "$format" "$HOSTNAME" "$dir" ""
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nvm use stable
