#!/bin/bash -uex

echo 'Apt update & upgrade and install some basics'
if [[ `whoami` != "root" ]]; then
    echo "You ran me as not root! Do run me as root!"
    exit 1
fi

apt-get update -y -qq && apt-get upgrade -y -qq
apt-get install -y -qq curl vim sudo htop unzip tree
