#!/bin/bash -uex

echo 'Install datadog'
DD_API_KEY=19d35b31e85f1b37ef8c2d6cbed24f23 bash -c "$(wget -O- https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)"