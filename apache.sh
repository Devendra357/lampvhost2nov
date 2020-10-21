   #!/bin/bash


    if [ systemctl status apache2 ]
        
        then
            echo "not installed"

        else
            echo    "installed"
    fi
