#!/bin/ksh

if [ $(id -u) -ne 0 ]
then
  echo "Must be run as su."
  exit
fi

RED="\033[0;31m"
NO_COLOR="\033[0m"
SSHD_CONFIG_PATH=/etc/ssh/sshd_config
set -A DISABLED_CONFIG_ITEMS\
  "PasswordAuthentication"\
  "ChallengeResponseAuthentication"

if test -f $SSHD_CONFIG_PATH
then
  echo "Disabling password login..."
  for config_item in ${DISABLED_CONFIG_ITEMS[@]}
  do
    echo "$config_item no" >> /etc/ssh/sshd_config
  done
    rcctl reload sshd
    echo "Done!"
else
  echo "$RED!!!WARNING: SSHD_CONFIG NOT IN EXPECTED LOCATION. SKIPPING!!!$NO_COLOR"
fi
