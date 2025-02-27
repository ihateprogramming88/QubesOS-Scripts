#!/bin/bash

# Copyright (C) 2023 Thien Tran
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

#Install packages
sudo apt install --no-install-recommends linux-headers-amd64 lkrg-dkms qt5ct qt5-style-plugins arc-theme -y

#Enabling SUID Disabler and Permission Hardener
sudo systemctl enable --now permission-hardening

#Enable hardened malloc
echo "/usr/lib/libhardened_malloc.so/libhardened_malloc.so" | sudo tee /etc/ld.so.preload

#Restrict /proc and access
sudo systemctl enable --now proc-hidepid.service

#Reduce kernel information leaks
#Will break a lot of applications. The apps I use on Whonix work fine with it so I am enabling it.
sudo systemctl enable --now hide-hardware-info.service

echo "export QT_QPA_PLATFORMTHEME=gtk2" | sudo tee /etc/environment

sudo mkdir -p /etc/gtk-3.0
echo "[Settings]
gtk-theme-name=Arc-Dark
gtk-application-prefer-dark-theme=1" | sudo tee /etc/gtk-3.0/settings.ini

sudo mkdir -p /etc/gtk-4.0
echo "[Settings]
gtk-theme-name=Arc-Dark
gtk-application-prefer-dark-theme=1" | sudo tee /etc/gtk-4.0/settings.ini
