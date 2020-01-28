#!/bin/bash

_self="${0##*/}"


date=$(date '+%Y%m%d_%H%M%S')


line="************************ $(date): $_self | run ansible role - stop minio container***********************"
echo $line
echo $line >> ./log
sudo ansible-playbook compose_stop_role.yml
