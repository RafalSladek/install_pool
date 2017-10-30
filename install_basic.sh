#!/bin/bash -uex
apt-get update -y -qq && apt-get upgrade -y -qq
apt-get install -y -qq curl vim sudo htop unzip tree