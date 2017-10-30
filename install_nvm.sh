#!/bin/bash -uex

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | NVM_DIR=/usr/local/nvm PROFILE=/usr/local/nvm.profile bash

echo 'export NVM_DIR="$HOME/.nvm"' >> /etc/profile.d/nvm.sh
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> /etc/profile.d/nvm.sh
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completio' >> /etc/profile.d/nvm.sh

source ~/.bashrc
command -v nvm
