#!/bin/bash -uex

echo 'Install nvm'
if [[ `whoami` == "root" ]]; then
    echo "You ran me as root! Do not run me as root!"
    exit 1
fi
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | NVM_DIR=/usr/local/nvm PROFILE=/usr/local/nvm.profile bash
&& echo 'export NVM_DIR=/usr/local/nvm' >> /etc/profile.d/nvm.sh
&& echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> /etc/profile.d/nvm.sh
&& echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completio' >> /etc/profile.d/nvm.sh
&& source /etc/profile.d/nvm.sh
&& command -v nvm
