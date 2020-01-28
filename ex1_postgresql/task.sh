#!/bin/bash

_self="${0##*/}"


date=$(date '+%Y%m%d_%H%M%S')


line="************************ $(date): $_self | Build postgres image***********************"
echo $line
echo $line >> ./log
docker build -t anyvision_postgres .


line="************************ $(date): $_self | Run postgres instance***********************"
echo $line
echo $line >> ./log
currentContainerName=anyvision_postgres_$date
docker run --name $currentContainerName -v /AnyVision/ex1_postgresql/efs:/backup -v /AnyVision/ex1_postgresql/db_utils:/db_utils  -e POSTGRES_PASSWORD=Qaz123456789 -e POSTGRES_DB=anyVision -d anyvision_postgres

sleep 4

line="************************ $(date): $_self | Create backup of anyVision DB***********************"
echo $line
echo $line >> ./log
docker exec $currentContainerName /db_utils/db_backup/create_backup.sh

slep 4

line="************************ $(date): $_self | Clean old backups***********************"
echo $line
echo $line >> ./log
(cd ./efs && ls -1t | tail -n +11 | xargs rm -f)










