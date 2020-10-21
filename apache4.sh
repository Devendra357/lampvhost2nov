   #!/bin/bash
    systemctl status apache2  

    if [ $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install $name

        else
            echo    "installed"
    fi
