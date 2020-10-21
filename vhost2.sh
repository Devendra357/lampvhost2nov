#!/bin/bash
echo -e "\n\nCreate virtual host\n"
name=yashwant.thakur
email=yashwant.thakur
WEB_ROOT_DIR=/var/www/yashwant.thakur/public_html
sitesAvailable='/etc/apache2/sites-available/'
sudo mkdir -p /var/www/yashwant.thakur/public_html
sudo chown -R $USER:$USER /var/www/yashwant.thakur/public_html
sudo chmod -R 755 /var/www/yashwant.thakur/public_html
sudo a2ensite yashwant.thakur.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
echo -e $"\nNew Virtual Host Created\n"

sed -i "1s/^/127.0.0.1 $name\n/" /etc/hosts

