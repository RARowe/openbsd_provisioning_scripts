#!/bin/sh

set -A packages git rsync

for package in ${packages[@]}
do
  if ! type $package > /dev/null
  then
    echo "Package '$package' not detected... adding..."
    pkg_add -v $package
    echo "Added!"
  else
    echo "Package '$package' already installed! Skipping..."
  fi
done
