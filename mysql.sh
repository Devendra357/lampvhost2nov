   #!/bin/bash

    #check mysql installed or not
    echo "enter your package name"
    read name

    dpkg -s $name &> /dev/null

    if [ echo $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install $name

        else
            echo    "installed"
    fi
~                                       
