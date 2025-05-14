#!/bin/bash

echo "👤 Vytváram systémové používateľské účty..."

# Admin účet
sudo useradd -m adminserver -s /bin/bash
echo "adminserver:admin123" | sudo chpasswd
sudo usermod -aG sudo adminserver
echo " Vytvorený používateľ adminserver (sudopráva)"

# Web správca
sudo useradd -m webadmin -s /bin/bash
echo "webadmin:web123" | sudo chpasswd
echo " Vytvorený používateľ webadmin (bez sudo)"

echo " Vytváram databázového používateľa 'webuser' a databázu 'webapp'..."

# SQL príkazy na vytvorenie databázy a používateľa s heslom
sudo mysql -u root -p'rootpassword' -e "
CREATE DATABASE IF NOT EXISTS webapp;

# Vytvorte tabulku 'users' so stĺpcami 'username' a 'password'
CREATE TABLE IF NOT EXISTS webapp.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

# Vytvorte používateľa 'webuser' a nastavte heslo
CREATE USER IF NOT EXISTS 'webuser'@'localhost' IDENTIFIED BY 'webpass';

# Udeľte používateľovi 'webuser' všetky práva na databázu 'webapp'
GRANT ALL PRIVILEGES ON webapp.* TO 'webuser'@'localhost';

# Obnovte práva používateľov
FLUSH PRIVILEGES;

# Vytvorenie používateľa v tabulke 'users' s heslom pre PHP login (hashovanie hesla)
INSERT INTO webapp.users (username, password) 
VALUES ('webadmin', PASSWORD('web123'));
"

echo " Databáza 'webapp' a používateľ 'webuser' boli úspešne vytvorení a nakonfigurovaní."
