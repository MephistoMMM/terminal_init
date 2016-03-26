#!/bin/bash
#
# The script init other things!
# --------
# python3 
# python-pip
# python3-pip
# w3m
# nodejs 5.x
# ----------
#
# CreateDate: 2015/11/30
# ChangeDate: 2015/11/30
# Author Mephis Pheies
# Email mephistommm@gmail.com

source $GENPATH/lib/package.sh

install_packages python3 
install_packages python3-pip python-pip
install_packages w3m

if [ $IS_ARCHLINUX == "1" ] ; then 
    curl -sL https://deb.nodesource.com/setup_5.x | /bin/bash -c -
    install_packages nodejs
else
    install_packages nodejs npm
fi
