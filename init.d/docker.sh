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
    wget -qO- https://get.docker.com/gpg | sudo apt-key add -
    wget -qO- https://get.docker.com/ | sh
fi

gpasswd -a $INIT_USER docker
    


