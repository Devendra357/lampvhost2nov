#!/bin/bash


email='webmaster@localhost'
sitesEnable='/etc/apache2/sites-enabled/'
sitesAvailable='/etc/apache2/sites-available/'
sitesAvailabledomain=$sitesAvailable$name.conf

echo " <?php phpinfo(); ?>">> /var/www/thakur.singh/info.php
echo "Creating a vhost for $sitesAvailabledomain with a webroot thakur.singh"

### create virtual host rules file
echo "
    <VirtualHost *:80>
      ServerAdmin thakur.singh
      ServerName thakur.singh
      DocumentRoot thakur.singh
      <Directory thakur.singh/>
        Options Indexes FollowSymLinks
        AllowOverride all
      </Directory>
    </VirtualHost>" > $sitesAvailabledomain
echo -e $"\nNew Virtual Host Created\n"

sed -i "1s/^/127.0.0.1 thakur.singh\n/" /etc/hosts

a2ensite $name
service apache2 reload
service apache2 restart

echo "Done, please browse to http://thakur.singh to check!"
~                                                         
