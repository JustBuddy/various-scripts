#!/bin/bash

# Simple image backup script.
# Used on a raspberry pi, edit line 22 and 31 to stop/start specific services
# Must be run as su - sudo crontab -e -> 0 7 * * 1 /home/pi/scripts/image_backup.sh

# Variables - Edit here!
BACKUP_PATH="/mnt/hdd02/Backup/backup_rpi"
BACKUP_COUNT="5"
BACKUP_NAME="rpi_backup"
BACKUP_TIME=$(date +%Y%m%d-%H%M%S)
# End editable variables.

# Print Variables in case script gets called manually
echo Starting image backup!
echo Target: ${BACKUP_PATH}/${BACKUP_NAME}-${BACKUP_TIME}.img
echo Preserving the last ${BACKUP_COUNT} copies...
echo ...

# Halts services before backup
echo Stopping services...
systemctl stop ASF.service unifi.service plexmediaserver.service

# Create a backup using dd and save it to BACKUP_Path
echo Image backup to target location running...
dd if=/dev/mmcblk0 of=${BACKUP_PATH}/${BACKUP_NAME}-${BACKUP_TIME}.img bs=1M
echo Done!

# Start up services after backup
echo Start services...
systemctl start ASF.service unifi.service plexmediaserver.service

#Compress backup
echo Compress backup image to preserve space...
gzip ${BACKUP_PATH}/${BACKUP_NAME}-${BACKUP_TIME}.img ${BACKUP_PATH}/

# Purge old backups in accordance to BACKUP_COUNT
echo Purge oldest backup...
pushd ${BACKUP_PATH}; ls -tr ${BACKUP_PATH}/${BACKUP_NAME}* | head -n -${BACKUP_COUNT} | xargs rm; popd
echo Process complete, exiting...
