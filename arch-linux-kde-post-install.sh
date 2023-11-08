#!/bin/bash
######################
#@Autor: Marcos Orelio
#@Date: 2023-11-6
#@Version: 1.0.0
#@URL: https://raw.githubusercontent.com/marcosorelio/Arch_Lenovo_330S-15IKB/main/arch-linux-kde-post-install.sh
#######################

#Inicial config
sudo systemctl enable --now bluetooth

#Install git
yes | sudo pacman -Syu
yes | sudo pacman -Sy --needed git base-devel
git config --global user.name "marcosorelio"
git config --global user.email bw.marcos@gmail.com

#Install Yay
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#Install Reflector
yes | yay -Sy reflector
reflector --latest 5 --country "United States" --protocol https --sort rate --save /etc/sudo pacman.d/mirrorlist
#cp /etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf.bak
#echo '--country "United States"' >> /etc/xdg/reflector/reflector.conf
#systemctl enable --now reflector.service

#Install tools
yes | yay -Sy spectacle
yes | yay -Sy btop
yes | yay -Sy virtualbox virtualbox-host-dkms linux-lts-headers
#Fix Error start virtual box
modprobe vboxdrv

#Install docker
yes | yay -Sy docker docker-compose
groupadd docker
usermod -aG docker $USER
systemctl enable --now docker.service

#Install asdf lib tools
yes | yay -Sy asdf-vm
echo "source /opt/asdf-vm/asdf.sh" >> ~/.bashrc
source ~/.bashrc

#asdf install lib Java
asdf plugin add java
asdf install java openjdk-21
asdf global java openjdk-21
java -version

#Install flatpak
yes | yay -Sy flatpak

flatpak install flathub org.mozilla.firefox
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub org.keepassxc.KeePassXC
flatpak install flathub net.cozic.joplin_desktop
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.kde.krita
flatpak install flathub org.videolan.VLC
flatpak install flathub com.transmissionbt.Transmission
flatpak install flathub com.google.AndroidStudio
flatpak install flathub org.chromium.Chromium
flatpak install flathub com.notepadqq.Notepadqq
flatpak install flathub org.kde.okular

#Clean install package
yes | sudo pacman -Rns vim
yes | sudo pacman -Scc
sudo rm -rf ~/yay