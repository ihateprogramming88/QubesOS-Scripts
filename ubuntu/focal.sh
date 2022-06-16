#!/bin/bash

#Deboat
sudo apt purge -y firefox* thunderbird emacs emacs-gtk emacs-bin-common emacs-common keepassx* gnome-settings-daemon ibus* cups* system-config-printer* xsettingsd yelp*
sudo apt autoremove -y
sudo apt autoclean

#Add repo
sudo apt install curl -y
curl --proxy http://127.0.0.1:8082/ --tlsv1.3 --proto =https --max-time 180 --output ~/unman.pub https://raw.githubusercontent.com/unman/unman/master/unman.pub
sudo apt-key add ~/unman.pub
echo "deb https://qubes.3isec.org/4.0 focal main" | sudo tee -a /etc/apt/sources.list

#Install packages
sudo apt update
sudo apt install --no-install-recommends qubes-gpg-split eog qt5ct qt5-style-plugins nautilus arc-theme snapd qubes-snapd-helper -y

#Theming
git config --global http.proxy http://127.0.0.1:8082
git clone https://github.com/horst3180/arc-icon-theme
sudo mv arc-icon-theme/Arc /usr/share/icons
rm -rf arc-icon-theme

echo "export QT_QPA_PLATFORMTHEME=gtk2" | sudo tee /etc/environment

sudo mkdir /etc/gtk-3.0
echo "[Settings]
gtk-theme-name=Arc-Dark
gtk-application-prefer-dark-theme=1
gtk-icon-theme-name=Arc" | sudo tee /etc/gtk-3.0/settings.ini

sudo mkdir /etc/gtk-4.0
echo "[Settings]
gtk-theme-name=Arc-Dark
gtk-application-prefer-dark-theme=1
gtk-icon-theme-name=Arc" | sudo tee /etc/gtk-4.0/settings.ini
