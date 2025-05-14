#!/bin/bash

echo "🔄 Aktualizujem systém..."
sudo apt-get update && sudo apt-get upgrade -y

echo "📦 Inštalujem Apache2, PHP, MariaDB, iptables, netfilter-persistent a Node.js..."

# Web server a PHP
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql

# Databázový server
sudo apt-get install -y mariadb-server

# Firewall nástroje
sudo apt-get install -y iptables netfilter-persistent

# Node.js (pre JavaScript mimo prehliadača)
sudo apt-get install -y nodejs npm

# git a curl (užitočné vývojové nástroje)
sudo apt-get install -y git curl

echo "✅ Inštalácia dokončená."

# Zabezpečenie MariaDB (neinteraktívne)
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;"

echo "🔐 Nastavené heslo pre MariaDB root používateľa na: rootpassword"

# Reštart Apache pre istotu
sudo systemctl restart apache2

echo "🚀 Webový server pripravený na http://<tvoja-IP-adresa>"
