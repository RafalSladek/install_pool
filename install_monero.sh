#!/bin/bash -uex

echo 'Setup monero deamon'
if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi

monero_path=/opt/monero/monerod

user=rsladek
echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

adduser --group $user
adduser \
   --shell /bin/bash \
   --gecos 'User for managing monero' \
   --ingroup $user \
   --disabled-password \
   --home /home/$user \
   $user

usermod -aG sudo $user
groups $user

pushd /home/$user/
#increasing history
sed -i "s/HISTSIZE=1000/HISTSIZE=50000/g" .bashrc
sed -i "s/HISTFILESIZE=2000/HISTFILESIZE=50000/g" .bashrc



echo '[Unit]
Description=Monero Daemon
After=network.target

[Service]
Type=forking
GuessMainPID=no
ExecStart=$monero_path --rpc-bind-ip 127.0.0.1 --detach --restricted-rpc
Restart=always
User=$user

[Install]
WantedBy=multi-user.target' > /lib/systemd/system/monero.service

mkdir $monero_path
curl -L https://github.com/RafalSladek/monero/releases/download/v0.11.1.0/monero.zip | unzip