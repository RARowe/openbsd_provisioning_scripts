#!/bin/ksh

if [ $(id -u) -ne 0 ]
then
  echo "Must be run as su."
  exit
fi

MIRROR="https://cdn.openbsd.org/pub/OpenBSD"
set -A packages git rsync


echo "Using mirror '$MIRROR'..."
echo $MIRROR > /etc/installurl

for package in ${packages[@]}
do
  if ! type $package >> /dev/null
  then
    echo "Package '$package' not detected... adding..."
    pkg_add -v $package
    echo "Added!"
  else
    echo "Package '$package' already installed! Skipping..."
  fi
done
