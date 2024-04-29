#! bin/bash
# This file is a wip

update(){
	sudo apt update
	sudo apt upgrade
}

installs(){
	sudo apt install\
	 code\
	 git\
	 neofetch shellcheck gh flathub nodejs

	flatpak install flathub\
 	com.raggesilver.BlackBox\
 	io.dbeaver.DBeaverCommunity\
 	io.github.zyedidia.micro\
 	com.opera.Opera\
 	com.microsoft.Edge\
 	com.bitwarden.desktop\
 	xyz.woxel.Woxel\
 	net.minetest.Minetest\
 	com.obsproject.Studio\
 	md.obsidian.Obsidian\
 	org.gimp.GIMP\
}

git_conf(){
	git config --global core.editor micro
	git config --global user.name $1
	git config --global user.email $2
}

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
mkdir ~/bin
curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt
chmod 755 ~/bin/vcprompt
