#!/bin/bash
    dpkg -s php5.8 &> /dev/null  

    if [ $? -ne 0 ]

        then
            echo "not installed"  
            sudo apt-get update
            sudo apt-get install php5.8

        else
            echo    "installed"
    fi
