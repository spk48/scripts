#!/bin/sh
#
########################################################################
# Install paco
#  $1 = version
#  $2 = not save to src
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v1.3 9/16,2010
#       Refactoring.
#  v1.2 3/7,2010
#       Refactoring and update to 2.0.7.
#  v1.1 12/15,2008
#       Keep sources.
#  v1.0 12/4,2008
#       Stable.
########################################################################

setup_environment() {
    test -n "$1" || PACO_VERSION=2.0.9
    test -n "$1" && PACO_VERSION=$1
}

save_sources() {
    sudo mkdir -p /usr/local/src/paco
    sudo cp -av paco-$PACO_VERSION /usr/local/src/paco/
    sudo chown -R root:root /usr/local/src/paco
}

install_paco() {
    setup_environment $*
    mkdir install_paco
    cd install_paco
    wget http://downloads.sourceforge.net/paco/paco-$PACO_VERSION.tar.gz
    tar xzvf paco-$PACO_VERSION.tar.gz
    cd paco-$PACO_VERSION
    ./configure --disable-gpaco
    make
    sudo make install
    sudo make logme
    cd ..
    test -n "$2" || save_sources
    cd ..
    rm -rf install_paco
}

ping -c 1 id774.net > /dev/null 2>&1 || exit 1
install_paco $*
