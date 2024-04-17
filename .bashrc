#! Sourced in 'C:\Users\User\.bash_profile'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/libexec:$PATH"
export PATH=$PATH:$HOME/bin

command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -f "$env" ]; then
    if [ -s "$env" ]; then
        if grep -q -v '^#' "$env"; then
            source "$env"
        else
            echo "$(realpath $env) ready to load sensitive environment variables"
        fi
    else
        echo "File '$env' exists but is empty"
    fi
else
    echo "File '$env' does not exist"
fi
