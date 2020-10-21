  #!/bin/bash

    #check apache2 installed or not
    echo "enter your package name"
    read name

    dpkg -s $name &> /dev/null
d
    if [ echo $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install $name

        else
            echo    "installed"
    fi

    #check apache2 installed or not
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

