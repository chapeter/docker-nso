#!/bin/bash

NSO_SIGNED_BIN=$(ls nso*signed.bin)
#TODO need to dynamically find this version number
#NSO_VERSION=4.5.3
#NSO_DIR=/opt/ncs-$NSO_VERSION
NSO_DIR=/opt/ncs
NCS_INSTALL_DIR=/opt/ncs-run
source $NSO_DIR/ncsrc

#Check to see if NCS is installed.  If not install it
if [ ! -f /opt/ncs-run/ncs.conf ]; then
  echo "NSO not installed"
  if [ ! -d $NSO_DIR ]; then
    echo "NSO not unpacked"
    echo "Unpacking NSO from $NSO_SIGNED_BIN"
    bash $NSO_SIGNED_BIN

    NSO_BIN=$(ls nso*installer.bin)
    echo "Installing NSO from $NSO_BIN"
    #bash $NSO_BIN /opt/ncs-$NSO_VERSION --local-install
    bash $NSO_BIN /opt/ncs --local-install
  else
    echo "NSO already unpacked"
  fi
  source $NSO_DIR/ncsrc
  ncs-setup --dest $NCS_INSTALL_DIR
else
  echo "NSO installed"
fi

#Install neds
ncs --stop
cd /tmp/neds
NEDS=$(ls *.signed.bin)

for NED in $NEDS; do
  cd /tmp/neds/
  cp /tmp/neds/$NED /tmp/build
  cd /tmp/build
  bash $NED
  tar zxvf *tar.gz -C /opt/ncs-run/packages
  rm -rf /tmp/build/*
done


#cp /tmp/neds/$NED /tmp/build
#cd /tmp/build
#bash $NED
#tar zxvf *tar.gz -C /opt/ncs-run/packages
#cp -r /tmp/neds/cisco-ios /opt/ncs-run/packages

##Start NCS
cd $NCS_INSTALL_DIR
ncs --with-package-reload
sleep 5
tail -f /opt/ncs-run/logs/ncs.log
