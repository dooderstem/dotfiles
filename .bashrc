# .bashrc is executed every time a new terminal session is started, whereas .bash_profile is executed only when you log in to your system. This means that if you set environment variables in .bashrc, they will be available in all terminal sessions, but if you set them in .bash_profile, they will only be available in the first terminal session you open after logging in

# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/libexec:$PATH"
eval "$(pyenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" ] # This loads nvm bash_completion

export bashenv=~/.bash_env

if [ -f "$bashenv" ]; then
    if [ -s "$bashenv" ]; then
        # Check if any uncommented lines exist in the file
        if grep -q -v '^#' "$bashenv"; then
            source "$bashenv"
            echo "Private environment variables loaded"
        else
            echo "File '$bashenv' exists but all lines are commented out"
        fi
    else
        echo "File '$bashenv' exists but is empty"
    fi
else
    echo "File '$bashenv' does not exist"
fi
