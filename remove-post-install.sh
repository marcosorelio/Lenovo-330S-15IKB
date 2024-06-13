sudo pacman -Rns vim 
sudo pacman -Rns git 
sudo pacman -Rns base-devel 
sudo pacman -Rns spectacle 
sudo pacman -Rns yay 
sudo pacman -Rns reflector 
sudo pacman -Rns spectacle 
sudo pacman -Rns btop 
sudo pacman -Rns virtualbox 
sudo pacman -Rns virtualbox-host-dkms 
sudo pacman -Rns linux-lts-headers 
sudo pacman -Rns docker-compose 
sudo pacman -Rns asdf-vm 
sudo pacman -Rns flatpak

sudo systemctl disable reflector
sudo rm -rf /etc/xdg/reflector/
sudo rm -rf ~/yay
