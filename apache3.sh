   #!/bin/bash

    #check apache2 installed or not
    systemctl status apache2

    if [ echo $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install $name

        else
            echo    "installed"
    fi
