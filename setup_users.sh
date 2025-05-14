#!/bin/bash

echo "👤 Vytváram systémové používateľské účty..."

# Admin účet
sudo useradd -m adminserver -s /bin/bash
echo "adminserver:admin123" | sudo chpasswd
sudo usermod -aG sudo adminserver
echo "✅ Vytvorený používateľ adminserver (sudopráva)"

# Web správca
sudo useradd -m webadmin -s /bin/bash
echo "webadmin:web123" | sudo chpasswd
echo "✅ Vytvorený používateľ webadmin (bez sudo)"

echo "🛠️ Vytváram databázového používateľa 'webuser' a databázu 'webapp'..."

# SQL príkazy na vytvorenie databázy a používateľa s heslom
sudo mysql -u root -p'rootpassword' -e "
CREATE DATABASE IF NOT EXISTS webapp;
CREATE USER IF NOT EXISTS 'webuser'@'localhost' IDENTIFIED BY 'webpass';
GRANT ALL PRIVILEGES ON webapp.* TO 'webuser'@'localhost';
FLUSH PRIVILEGES;
"

echo "✅ Databáza 'webapp' a používateľ 'webuser' boli úspešne vytvorení a nakonfigurovaní."
