#!/bin/bash

_self="${0##*/}"


date=$(date '+%Y%m%d_%H%M%S')


line="************************ $(date): $_self | Create pipe bucket and upload to minio server***********************"
echo $line
echo $line >> ./log
sudo ansible-playbook create_and_copy_bucket_to_minio.yml
