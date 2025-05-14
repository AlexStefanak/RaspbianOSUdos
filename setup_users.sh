#!/bin/bash

echo "👤 Vytváram používateľské účty..."

# Admin účet
sudo useradd -m adminserver -s /bin/bash
echo "adminserver:admin123" | sudo chpasswd
sudo usermod -aG sudo adminserver
echo "✅ Vytvorený používateľ adminserver (sudopráva)"

# Web správca
sudo useradd -m webadmin -s /bin/bash
echo "webadmin:web123" | sudo chpasswd
echo "✅ Vytvorený používateľ webadmin (bez sudo)"

echo "🛠️ Nastavujem databázového používateľa webuser v MariaDB..."

# Vytvorenie webuser s mysql_native_password (PHP kompatibilita)
sudo mysql -e "
CREATE DATABASE IF NOT EXISTS webapp;
CREATE USER IF NOT EXISTS 'webuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'webpass';
GRANT ALL PRIVILEGES ON webapp.* TO 'webuser'@'localhost';
FLUSH PRIVILEGES;
"

echo "✅ Databáza 'webapp' a používateľ 'webuser' boli nastavení správne."
