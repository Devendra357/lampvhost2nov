#!/bin/bash
name=lallu.com
WEB_ROOT_DIR=/var/www/lallu.com

email=${3-'webmaster@localhost'}
sitesEnable='/etc/apache2/sites-enabled/'
sitesAvailable='/etc/apache2/sites-available/'
sitesAvailabledomain=$sitesAvailable$name.conf
mkdir $WEB_ROOT_DIR
echo " <?php phpinfo(); ?>">> $WEB_ROOT_DIR/info.php
echo "Creating a vhost for $sitesAvailabledomain with a webroot $WEB_ROOT_DIR"

### create virtual host rules file
echo "
    <VirtualHost *:80>
      ServerAdmin $email
      ServerName $name
      DocumentRoot $WEB_ROOT_DIR
      <Directory $WEB_ROOT_DIR/>
        Options Indexes FollowSymLinks
        AllowOverride all
      </Directory>
    </VirtualHost>" > $sitesAvailabledomain
echo -e $"\nNew Virtual Host Created\n"

sed -i "1s/^/127.0.0.1 $name\n/" /etc/hosts

a2ensite $name
service apache2 reload

echo "Done, please browse to http://$name to check!"

