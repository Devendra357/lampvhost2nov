#!/bin/bash

echo -e "\n\nUpdating Apt Packages and upgrading latest patches\n"
sudo apt-get update -y && sudo apt-get upgrade -y

echo -e "\n\nInstalling Apache2 Web server\n"
sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

echo -e "\n\nInstalling PHP & Requirements\n"
sudo apt-get install libapache2-mod-php7.2 php7.2 php7.2-common php7.2-curl php7.2-dev php7.2-gd php-pear php7.2-mcrypt php7.2-mysql -y

echo -e "\n\nInstalling MySQL\n"
sudo apt-get install mysql-server mysql-client -y

echo -e "\n\nPermissions for /var/www\n"
sudo chown -R www-data:www-data /var/www
echo -e "\n\n Permissions have been set\n"

echo -e "\n\nEnabling Modules\n"
sudo a2enmod rewrite
sudo phpenmod mcrypt

echo -e "\n\nRestarting Apache\n"
sudo service apache2 restart

echo -e "\n\nLAMP Installation Completed"
name=$1
WEB_ROOT_DIR=$2

email=${3-'webmaster@localhost'}
sitesEnable='/etc/apache2/sites-enabled/'
sitesAvailable='/etc/apache2/sites-available/'
sitesAvailabledomain=$sitesAvailable$name.conf
mkdir $WEB_ROOT_DIR
git clone https://github.com/moodle/moodle.git $WEB_ROOT_DIR"/moodle"
echo " <?php phpinfo(); ?>">> /var/www/sachin.com/info.php
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
~
~                                                                
