  #!/bin/bash

    #check apache2 installed or not 
    systemctl status apache2

    if [ $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install apache2

        else
            echo    "installed"
    fi

    systemctl status mysql

    if [ $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install mysql

        else
            echo    "installed"
    fi

    dpkg -s php7.2 &> /dev/null

    if [ $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install php7.2

        else
            echo    "installed"
    

name=haha.com
WEB_ROOT_DIR=/var/www/haha.com

email=${3-'webmaster@localhost'}
sitesEnable='/etc/apache2/sites-enabled/'
sitesAvailable='/etc/apache2/sites-available/'
sitesAvailabledomain=$sitesAvailable$name.conf
sudo mkdir $WEB_ROOT_DIR
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

service apache2 reload

echo "Done, please browse to http://$name to check!"                                