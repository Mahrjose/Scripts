#! /usr/bin/bash

# Author: Mirza Mahrab Hossain
# Email : mahrjose.dev@gmail.com
# Github: github.com/Mahrjose/Scripts
# ========================================== #

pushd () {
    command pushd "$@" &> /dev/null
}

popd () {
    command popd "$@" &> /dev/null
}


# Update System
sudo apt update
sudo apt upgrade -y

# Install Important Pkgs
sudo apt install build-essential -y
sudo apt install ubuntu-restricted-extras -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-manager -y

# Softwares
sudo apt install git -y
sudo apt install vim -y
sudo apt install qbittorrent -y
sudo apt install vlc -y
sudo apt install neofetch -y
sudo apt install htop -y
sudo apt install timeshift -y


# Install google-chrome

if [[ $(getconf LONG_BIT) = "64" ]]; then

    echo "64bit Detected"
    echo "Installing Google Chrome..." 
    
    wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    pushd $HOME/Downloads
    
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    
    rm -f google-chrome-stable_current_amd64.deb
    popd

else
    echo "32bit Detected"
    echo "Installing Google Chrome..."
    
    wget -P $HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
    pushd $HOME/Downloads
    
    sudo dpkg -i google-chrome-stable_current_i386.deb
    
    rm -f google-chrome-stable_current_i386.deb
	popd

fi


# Install VSCode
wget -O $HOME/Downloads/code_amd64.deb https://az764295.vo.msecnd.net/stable/6261075646f055b99068d3688932416f2346dd3b/code_1.73.1-1667967334_amd64.deb
pushd $HOME/Downloads

sudo dpkg -i code_amd64.deb

rm -f code_amd64.deb
popd

sudo apt udpate
sudo apt install code -y


# Install flatpak
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install flatpak pkgs
sudo flatpak install flathub com.spotify.Client -y
sudo flatpak install flathub com.discordapp.Discord -y
sudo flatpak install flathub com.sublimetext.three -y

# Remove Snapd pkgs
sudo snap remove firefox

# Remove Snapd core pkgs
sudo snap remove snap-store
sudo snap remove gtk-common-themes
sudo snap remove gnome-system-monitor
sudo snap remove gnome-3-34-1804
sudo snap remove gnome-3-28-1804
sudo snap remove core18
sudo snap remove snapd

# Completely remove snapd from system
sudo rm -rf /var/cache/snapd/
sudo apt autoremove --purge snapd gnome-software-plugin-snap
sudo rm -rf ~/snap
sudo rm -rf /snap &> /dev/null
sudo rm -rf /var/snap &> /dev/null
sudo rm -rf /var/lib/snapd &> /dev/null
sudo apt-mark hold snapd

# Cleanup
sudo apt udpdate
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean

# Setup Dotfile
pushd $HOME

git clone https://github.com/mahrjose/dotfiles
pushd dotfiles
chmod +x setup.sh
./setup.sh
popd
popd



