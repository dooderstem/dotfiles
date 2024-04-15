# '.bashrc' is executed every time a new terminal session is started, whereas `.bash_profile` is executed only when you log in to your system. This means that if you set environment variables in '.bashrc', they will be available in all terminal sessions, but if you set them in '.bash_profile', they will only be available in the first terminal session you open after logging in

#! Sourced in 'C:\Users\User\.bash_profile'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/libexec:$PATH"
eval "$(pyenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" ] # This loads nvm bash_completion

# Check if the file specified by the variable '$env' exists.
# note: '$env' is assigned in 'C:\Users\User\.bash_profile'.
if [ -f "$env" ]; then
    # Check if the file has any content
    if [ -s "$env" ]; then
        # Check if any uncommented lines exist in the file
        if grep -q -v '^#' "$env"; then
            # If there are uncommented lines, source (execute) the file
            source "$env"
            echo "Sourced: $(realpath $env)"

        else
            # If there are no uncommented lines, print a message indicating that the file is ready for loading sensitive environment variables
            echo "$(realpath $env) ready to load sensitive environment variables"
        fi
    else
        echo "File '$env' exists but is empty"
    fi
else
    echo "File '$env' does not exist"
fi
