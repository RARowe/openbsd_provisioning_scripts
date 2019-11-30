#!/bin/ksh

if [ $(id -u) -ne 0 ]
then
  echo "Must be run as su."
  exit
fi

set -A SCRIPTS\
  "install_packages.sh"\
  "ssh_setup.sh"\
  "httpd_setup.sh"

for script in ${SCRIPTS[@]}
do
  ksh scripts/$script
done
