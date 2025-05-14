#!/bin/bash

echo " Spúšťam a povoľujem služby..."

# Apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo " Apache2 spustený a povolený pri štarte."

# MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo " MariaDB spustená a povolená pri štarte."

# Overenie stavu
echo ""
echo " Stav služieb:"
systemctl is-active apache2 && echo "Apache2 beží." || echo "Apache2 NIE je aktívny!"
systemctl is-active mariadb && echo "MariaDB beží." || echo "MariaDB NIE je aktívna!"

# Zobrazenie IP adresy
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo ""
echo " Webový server je dostupný na adrese: http://$IP_ADDRESS"
echo " Otvor túto adresu v prehliadači z iného zariadenia v rovnakej sieti."
