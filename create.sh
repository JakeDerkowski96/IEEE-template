#!/bin/bash
# DRIVER: IEEE workspace creator

. scripts/functions.sh


echo -e "Make sure this is the directory you want your paper in!"
echo "\nEnter Control+C is in wrong directory";
sleep 2;

echo "Checking requirements..."
# .scripts/loading.sh
bash 'scripts/requirements.sh'
