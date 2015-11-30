#!/bin/sh
# This is the common lib for package manager
# 
# Different distrabution has different package manager
# If you want to use package manager, you should not reference the 
# distrabution default package manager, for it may run error at 
# other distrabution
#  
# Author Mephis Pheies
# Email mephistommm@gmail.com

#define package manager method
export PACKAGE_UPDATE="apt-get update"
export PACKAGE_INSTALL="apt-get install -y"
export PACKAGE_REMOVE="apt-get remove -y"
export PACKAGE_REMOVE_STRICT="apt-get remove --purge -y"

function change_pkg_manager_by_sys(){ 
    #other sys use other package manager

    if [ $(uname -r | grep 'ARCH') != "" ] ; then
        export PACKAGE_UPDATE="pacman -Syy --noconfirm"
        export PACKAGE_INSTALL="pacman -S --noconfirm"
        export PACKAGE_REMOVE="pacman -R --noconfirm"
        export PACKAGE_REMOVE_STRICT="pacman -Rnc --noconfirm"
    fi

}
function install_packages(){
    sh -c "$PACKAGE_INSTALL $*"
}
function remove_packages(){
    # $1 == "1" , use strict mode
    # else normal mode
    if [ $1 == "1" ]; then
        FUNC_REMOVE_PACKAGE=$PACKAGE_REMOVE_STRICT
    else
        FUNC_REMOVE_PACKAGE=$PACKAGE_REMOVE
    fi
    # delete $1
    shift 
    sh -c "$FUNC_REMOVE_PACKAGE $*"
}
function update_packages(){
    sh -c "$PACKAGE_UPDATE $*"
}

change_pkg_manager_by_sys
