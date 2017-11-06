#!/bin/bash -uex
PM2_DIR=/opt/pm2

if [ ! -d "$PM2_DIR" ]; then
    sudo useradd --home-dir $PM2_DIR --no-create-home --system --shell /bin/false pm2 -g pm2
    sudo mkdir $PM2_DIR
    sudo useradd -d $PM2_DIR -M -r -s /bin/false pm2
    sudo chown pm2:pm2 /opt/pm2
    sudo chmod 770 /opt/pm2
    echo "PM2_HOME=$PM2_DIR" | sudo tee -a /etc/environment
fi

. /etc/environment

iif command -v pm2 &>/dev/null; then
    echo "pm2 not installed"
    npm install -g pm2
    sudo pm2 startup -u pm2 --hp $PM2_DIR
    export HOST=$(hostname)
    echo pm2 link <key1> <key2> $HOST
fi