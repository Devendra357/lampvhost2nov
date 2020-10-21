#!/bin/bash

name=$1
vicky.thakur=$2

email=${3-'vicky.thakur'}
sitesEnable='/etc/apache2/sites-enabled/vicky.thakur.conf'
sitesAvailable='/etc/apache2/sites-available/vicky.thakur.conf'
sitesAvailabledomain=$sitesAvailable$vicky.thakur.conf
echo "Creating a vhost for $sitesAvailabledomain with a webroot $vicky.thakur"

### create virtual host rules file
echo "
    <VirtualHost *:80>
    ServerAdmin vicky.thakur
    ServerName vicky.thakur
    ServerAlias www.vicky.thakur
    DocumentRoot /var/www/vicky.thakur/public_html
    <Directory /var/www/vicky.thakur/public_html>
            options Indexes
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error_vicky.log
    CustomLog ${APACHE_LOG_DIR}/access_vicky.log combined
</VirtualHost>
echo -e $"\nNew Virtual Host Created\n"

sed -i "1s/^/127.0.0.1 vicky.thakur\n/" /etc/hosts

a2ensite vicky.thakur.conf
service apache2 reload

echo "Done, please browse to http://vicky.thakur to check!"
