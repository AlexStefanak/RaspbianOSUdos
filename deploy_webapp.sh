#!/bin/bash

echo " Kopírujem webovú stránku do /var/www/html..."

sudo cp -r ./webserver/* /var/www/html/

echo " Nastavujem oprávnenia..."
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

echo " Webová stránka nasadená. Otvor ju na: http://$(hostname -I | awk '{print $1}')"
