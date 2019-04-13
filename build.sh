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
sudo apt install -y i3 i3blocks slim xorg compton

# Installing i3 config
cd dotfiles/.config/
mkdir -p $HOME/.config/i3
cp i3 $HOME/.config/ -r

############################### Installing i3 gaps #############################
go_to_installation_dir

# installing dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool

git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

go_to_installation_dir

# installing i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install


############################### Installing i3blocks dependencies #############################
go_to_installation_dir

sudo apt install -y fonts-font-awesome

cd dotfiles/.config/i3blocks
mkdir -p $HOME/.config/i3blocks

cp config $HOME/.config/i3blocks
cp scripts $HOME/.config/i3blocks -r

############################### Installing vim #################################
go_to_installation_dir
sudo apt install -y vim-gnome curl

cd dotfiles/.scripts
sh install_vim.sh

############################### Installing ranger #############################
go_to_installation_dir
sudo apt install -y ranger w3m-img

mkdir -p $HOME/.config/ranger
cd dotfiles/.config/ranger
cp * $HOME/.config/ranger -r

############################### Installing nnn #############################
sudo apt install pkg-config libncursesw5-dev xsel atool
go_to_installation_dir
git clone https://github.com/jarun/nnn
cd nnn
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
make
sudo make install

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
sudo apt install -y imagemagick feh python3-pip python-pip
sudo pip3 install pywal
cd $HOME/.config/
git clone https://github.com/LukeSmithxyz/wallpapers

############################### Installing audio/media/touchpad #############################
#sudo apt install -y alsa-base alsa-oss alsa-utils alsa-tools libasound2 libasound2-plugins speech-dispatcher pulseaudio pavucontrol xbacklight dkms

############################### Installing network-manager #############################
sudo apt install -y network-manager

############################### Installing st terminal #############################
#go_to_installation_dir

#git clone https://github.com/LukeSmithxyz/st
#cd st
#sudo make install

############################### Installing screenshot #############################
mkdir -p $HOME/Pictures/screenshots
sudo apt install -y scrot

############################### Installing commom programs #############################

#sudo apt install -y firefox
sudo apt install -y zathura xsel sxiv poppler-utils
sudo apt install -y virtualbox-dkms virtualbox-guest-dkms virtualbox-guest-x11
