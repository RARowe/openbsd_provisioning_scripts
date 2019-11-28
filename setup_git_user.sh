#!/bin/ksh

groupadd -v git
useradd -mv -b /home/git -d /home/git -g git git
