#!/bin/bash

INSTALL_DIR="$HOME/Documents/tmp"
mkdir -p $HOME/Documents/tmp

go_to_installation_dir(){
    cd $INSTALL_DIR
}


############################### Clonning dotfiles repo ########################
go_to_installation_dir

git clone https://github.com/lucaspeixotot/dotfiles

############################### Installing i3 ##################################
go_to_installation_dir

# Installing packages
sudo pacman -S --noconfirm compton

# Installing i3 config
cd dotfiles/.config/
mkdir -p $HOME/.config/
cp i3 $HOME/.config/ -r

############################### Installing i3blocks dependencies #############################
go_to_installation_dir

sudo pacman -S --noconfirm ttf-font-awesome

cd dotfiles/.config/i3blocks
mkdir -p $HOME/.config/i3blocks

cp config $HOME/.config/i3blocks
cp scripts $HOME/.config/i3blocks -r

############################### Installing vim #################################
go_to_installation_dir

cd dotfiles/.scripts
sh install_vim.sh

############################### Installing nnn #############################
sudo pacman -S --noconfirm nnn

go_to_installation_dir
cd dotfiles/.config
cp nnn $HOME/.config/ -r


############################### Installing uxvt config #############################
go_to_installation_dir

cd dotfiles
cp .xinitrc $HOME/
cp .Xresources $HOME/

############################### Installing pywal #############################

#installing dependencies
sudo pacman -S --noconfirm python-pywal feh
cd $HOME/.config/
git clone https://github.com/LukeSmithxyz/wallpapers


############################### Installing st terminal #############################
go_to_installation_dir

git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install

############################### Installing screenshot #############################
mkdir -p $HOME/Pictures/screenshots
sudo pacman -S --noconfirm scrot

############################### Installing commom programs #############################

sudo pacman -S --noconfirm google-chrome
sudo pacman -S --noconfirm zathura xsel sxiv poppler
#sudo apt install -y virtualbox-dkms virtualbox-guest-dkms virtualbox-guest-x11
