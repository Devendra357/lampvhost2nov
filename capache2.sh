#!/bin/bash
ps cax | grep php9
if [ $? -eq 0 ]; then
  echo "process is running."
  else
  echo "process is not running."
  fi
