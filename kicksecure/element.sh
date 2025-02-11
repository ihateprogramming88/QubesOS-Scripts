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

curl --proxy http://127.0.0.1:8082/ https://packages.element.io/debian/element-io-archive-keyring.gpg | sudo tee /usr/share/keyrings/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update
sudo apt install --no-install-recommends element-desktop -y

#Adding a DNS entry for my Matrix server here so I can add a Firewall rule locking the AppVM to only being able to connect to my server.
echo "5.226.143.168 matrix.arcticfoxes.net" | sudo tee -a /etc/hosts
