#!/bin/bash

INSTALL_DIR="$HOME/Documents/tmp"
mkdir -p $HOME/Documents/tmp

go_to_installation_dir(){
    cd $INSTALL_DIR
}


############################### Clonning dotfiles repo ########################
go_to_installation_dir

git clone https://github.com/lucaspeixotot/dotfiles


############################### Installing yaourt ########################
sudo pacman -S --noconfirm --needed base-devel git wget yajl
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si && cd /tmp/
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si


############################### Installing Window and display Manager ########################
go_to_installation_dir

sudo pacman -S --noconfirm i3 dmenu xorg xorg-xinit feh lightdm lightdm-gtk-greeter networkmanager network-manager-applet lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service

cd dotfiles
cp .profile $HOME/
cp .xinitrc $HOME/
cp .Xresources $HOME/
cp .bashrc $HOME/
cp .inputrc $HOME/

mkdir -p $HOME/.config
cp .config/i3 $HOME/.config -r
cp .config/i3blocks $HOME/.config -r
cp .config/nnn $HOME/.config -r
cp .config/ranger $HOME/.config -r

############################### Installing st ########################

go_to_installation_dir

git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install

############################# Installing nnn ########################
sudo pacman -S --noconfirm nnn atool xsel xclip ranger

############################### Installing wallpappers and fonts ########################
go_to_installation_dir

sudo pacman -S --noconfirm otf-font-awesome ttf-dejavu ttf-liberation noto-fonts ttf-linux-libertine ttf-inconsolata

sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -s /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

cd dotfiles
sudo cp local.conf /etc/fonts/
sudo cp freetype2.sh /etc/profile.d/


cd $HOME/.config/
git clone https://github.com/LukeSmithxyz/wallpapers


############################### Installing vim ########################
go_to_installation_dir
sudo pacman -S --noconfirm gvim

cd dotfiles/.scripts
sh install_vim.sh

############################### Installing sound ########################
sudo pacman -S --noconfirm alsa-firmware alsa-utils alsa-plugins pulseaudio-alsa pulseaudio pavucontrol


############################### Installing xbacklight ########################
sudo pacman -S --noconfirm acpilight
go_to_installation_dir

sudo cp 90-backlight.rules /etc/udev/rules.d/


############################### Installing and configure commom programs ########################
yaourt -S --noconfirm google-chrome zathura sxiv scrot imagemagick htop transmission-gtk clang entr ag cmake compton ctags util-linux minicom

mkdir -p $HOME/Pictures/screenshots

