DOTFILES=(.bash_profile .bashrc .bash_aliases .bash_env.sh .gitconfig)

# TODO:
# 1: copy DOTFILES to 'C:\Users\User\.bashrc' if nonexistent
# 2: setup Chocolatey for Windows and install dependencies from choco_install
        # 2a: Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

function choco_install() {
    # manage corsair preferables
    choco install icue

    # Browsers
    choco install googlechrome
    choco install opera-gx

    # Auth
    choco install bitwarden
    choco install bitwarden-cli

    # Productivity
    choco install notion
    choco install todoist
    choco install obsidian
    choco install chatgpt
    choco install sparkmail

    # DEV
    choco install vscode
    choco install micro
    choco install nodejs
    choco install nvm
    choco install python
    choco install ruby

    ## git
    choco install git
    choco install gh
    choco install github-desktop
    git config --global core.editor micro

    # pause for credentials
    git config --global user.name "dooderstem"
    git config --global user.email "johnDoe@wright.edu"

    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    ## Design
    choco install gimp
    choco install inkscape
    choco install obs-studio

    ## Other
    choco install steam-client
    choco install discord

}
