#!/bin/sh

if [ -f /etc/lsb-release -a -f /etc/debian_version ]; then
  CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
  LINUXPKG="linux-(image|headers|ubuntu-modules|restricted-modules)"
  METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
  OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)

  sudo aptitude purge $OLDKERNELS
fi
