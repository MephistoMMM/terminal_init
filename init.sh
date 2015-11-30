#!/bin/sh
# This is a script to init a linux sys's base env
#
# You should put your init script in ./init.d
# but your script name should be *.sh
# and make them execuable!(chmod u+x ./init.d/yourscript.sh)
# 
# the dir tmp is created for cache tmpfile
# the dir src is created for useful init file like config file(e.g. vimrc)
# 
# this init script init things for a user, so we need a parament to expact username
# if you do this, the INIT_USER=username , INIT_HOME=/home/username, otherwise 
# INIT_USER=root, INIT_HOME=/root
#
# Usage: 
#      init.sh [ username ] 
#
# Author Mephis Pheies
# Email mephistommm@gmail.com

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
[ $# -lt 1 ] && export INIT_USER="root" || export INIT_USER=$1
[ $INIT_USER == "root" ] && export INIT_HOME=/root || export INIT_HOME=/home/$INIT_USER

#check user 
if [ $(cut -d ':' -f1 /etc/passwd | grep "$INIT_USER" ) == "" ];then
    echo -e "User $INIT_USER don't exist!"
    exit 1
fi

#get genpath
cd $(dirname $0)
export GENPATH=$(pwd)

#create tmp dir
if [ ! -e $GENPATH/tmp ]; then
    mkdir $GENPATH/tmp
fi

#add package function lib
source $GENPATH/lib/package.sh

update_packages
install_packages git wget curl

for init_script in $GENPATH/init.d/*.sh; do
    if [ -x $init_script ]; then
        $init_script
    fi
done

echo -e "Congratulation!"; exit 0
