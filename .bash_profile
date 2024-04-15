# .bash_profile is executed when a user logs into the system or opens a new terminal window for the first time. This file is executed only once when you log in to your system or open a new terminal emulator window.

#FIXME fortune | cowsay -f tux

# Enable automatic directory changing by just typing directory names
shopt -s autocd

# Append to the history file instead of overwriting it
shopt -s histappend

# Bind up and down arrow keys for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Set my hostname
export HOSTNAME=dooderstem

# Set history size and color settings
export HISTSIZE=5000
export HISTFILESIZE=10000
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Add ~/bin directory to the PATH
export PATH=$PATH:$HOME/bin

# Assign shell dependency files to variables. This makes
# it easy to source these files files for reloading my
# shell environment when I make changes.
# Ex: ". $aliases" or "source $aliases".
export aliases=~/.bash_aliases
export pf=~/.bash_profile
export env=~/.bash_env
export rc=~/.bashrc

# Source C:\Users\User\.bashrc if it exists.
if [ -f "$rc" ]; then
        source "$rc"
        echo "Sourced: $rc"
else
        echo "$rc" not found
fi

# Source C:\Users\User\.bash_aliases if it exists.
if [ -f "$aliases" ]; then
        source "$aliases"
        echo "Sourced: $(realpath $aliases)"
fi

# Source nvm if it exists and activate the stable version of Node.js.
# note: This depends on Node.js. Make sure you have it installed.
if [ -f ~/.nvm/nvm.sh ]; then
        source ~/.nvm/nvm.sh
        echo -e "Sourced: $(dirname ~/.nvm/nvm.sh)\n"
        nvm use stable
else
        echo "nvm not found"
fi

# python -V
# pip -V
# pyenv --version
# ruby -v
# echo "gem version "$(gem -v)""

# Arrays to store emojis for prompt
emojis1=("🎲" "🌍")
emojis2=("🎲" "💵")

# Select random emojis from arrays
EMOJI1=${emojis1[$RANDOM % ${#emojis1[@]}]}
EMOJI2=${emojis2[$RANDOM % ${#emojis2[@]}]}

# ANSI color codes for text formatting
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

# Function to print the current directory, and my
# hostname (set on line 16) before the prompt.
print_before_the_prompt() {
        dir=$PWD
        home=$HOME
        # Replace home directory with '~'
        dir=${dir/"$HOME"/"~"}
        # Print the formatted prompt
        printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOSTNAME" "$dir" #FIXME "$(vcprompt)"
}

# Function to add an alias.
# This function adds the alias to the current bash session and
# appends the alias definition to C:\Users\User\.bash_aliases
# so that it persists across sessions. If you would like to
# define a temporary alias, just use `alias hewwo="helloooooo"`.
add_alias() {
        # Check if exactly two parameters are provided
        if [ "$#" -ne 2 ]; then
                echo "Error: Two parameters are required."
                echo 'Usage: add_alias hewwo "helloooo"'
                return 1
        fi
        # Check if alias already exists
        if ! grep -q "^alias $1='" "$aliases"; then
                alias "$1"="$2"
                sed -i '3,/####### Aliases #######/ {/####### Aliases #######/!{n;b};a\
                '"alias $1='$2'"'
                }' "$aliases"
                # Add the alias to the specified file
                echo "Alias set for '$1' as '$2'."
        else
                echo "Warning: Alias '$1' already exists."

        fi
}

# Function to remove an alias.
# This function removes the alias from both the current bash session
# and C:\Users\User\.bash_aliases. If you would like to remove an alias
# temporarily without modifying .bash_aliases, simply prefix your command
# with `unalias` instead of using this function. For example, type
# `unalias hewwo` rather than `remove_alias hewwo`.
rm_alias() {
        # Check if exactly one parameter is provided
        if [ "$#" -ne 1 ]; then
                echo "Error: One parameter is required."
                echo 'Usage: rm_alias hewwo'
                return 1
        fi
        # Check if alias exists
        if alias $1 >/dev/null 2>&1; then
                unalias $1
                # Remove alias from the specified file
                sed -i "/alias $1=/d" "$aliases"
                echo "Removed alias for '$1'."
        else
                echo "Error: Alias '$1' does not exist."
                echo "Nothing to remove."
                return 1
        fi
}

# Function to create a directory and navigate into it
mkcd() {
        mkdir $1 && cd $1
}

# Function to create a new file and open it in VS Code
file() {
        touch $1 && code $1
}

# Set command to run before displaying the prompt
PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" # Refresh command history
PS1="$EMOJI1 $EMOJI2 >"                                              # Set custom prompt
