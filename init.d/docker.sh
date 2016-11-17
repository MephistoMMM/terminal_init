#!/bin/bash
# 
# This script install docker 
# arch user should start docker server by systemctl
#
# CreateDate: 2015/12/10
# ChangeDate: 2015/12/10
# Author Mephis Pheies
# Email mephistommm@gmail.com
source $GENPATH/lib/package.sh

is_archlinux

if [ $? -eq 0 ]; then
    install_packages docker
else
    curl -sSL https://get.daocloud.io/docker | sh
fi

gpasswd -a $INIT_USER docker
    
#to install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose



