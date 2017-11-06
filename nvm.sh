#!/bin/bash
NODE_VER=v6.9.2
NVM_VER=v0.33.6
NVM_DIR=/usr/local/nvm

if [ ! -f $NVM_DIR/nvm.sh ]; then
    # May need to be updated with the latest nvm release
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/$NVM_VER/install.sh | NVM_DIR=$NVM_DIR bash
fi
export NVM_DIR=$NVM_DIR
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if command -v node &>/dev/null; then
    echo "Node is not installed"
    nvm install $NODE_VER
    nvm alias default $NODE_VER
fi
echo "node ver: $(node -v)"
echo "npm ver: $(npm -v)"