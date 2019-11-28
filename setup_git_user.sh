#!/bin/ksh

groupadd -v git
useradd -mv -b /home/git -d /home/git -g git git
chown -R git /var/www/htdocs/
chown -R git /var/www/htdocs/*
