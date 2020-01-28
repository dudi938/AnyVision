#!/bin/bash

_self="${0##*/}"


date=$(date '+%Y%m%d_%H%M%S')


line="************************ $(date): $_self | create 1000 files of 1k size***********************"
echo $line
echo $line >> ./log
sudo ansible-playbook create1000files_role.yml
