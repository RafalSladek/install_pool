#!/bin/bash -uex

echo 'Install node with nvm'
if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi


sudo nvm install v6.9.2
node -v
npm -v
