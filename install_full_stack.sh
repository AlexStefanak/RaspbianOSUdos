#!/bin/bash

echo "=== Aktualizujem balíčky ==="
sudo apt update && sudo apt upgrade -y

echo "=== Inštalujem Apache2, PHP, MariaDB a ďalšie nástroje ==="
sudo apt install apache2 php libapache2-mod-php mariadb-server php-mysql git curl -y

echo "=== Spúšťam a povoľujem Apache a MariaDB ==="
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl enable mariadb
sudo systemctl start mariadb

echo "=== Nastavujem MariaDB root heslo ==="
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpassword'; FLUSH PRIVILEGES;"

echo "=== Inštalácia hotová ==="
