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
fi

is_centos
if [ $? -eq 0 ]; then
    remove_packages docker \
              docker-client \
              docker-client-latest \
              docker-common \
              docker-latest \
              docker-latest-logrotate \
              docker-logrotate \
              docker-selinux \
              docker-engine-selinux \
              docker-engine

    install_packages yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    install_packages docker-ce

    systemctl start docker
else
    remove_package 0 docker docker-engine docker.io
    # only for ubuntu
    install_packages apt-transport-https ca-certificates curl software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    update_packages

    install_packages docker-ce
fi

curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

gpasswd -a $INIT_USER docker
