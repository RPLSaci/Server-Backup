#!/bin/bash
if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

date=$(ls /var/lib/pterodactyl/backups/ | grep tar)

echo $date
cp /var/lib/pterodactyl/backups/$date backup.tar.gz

tar -xf /home/Tsukari/Server-Backup/backup.tar.gz -C /home/Tsukari/Server-Backup/unzip

rm backup.tar.gz
rm /var/lib/pterodactyl/backups/$date
git add .
git commit -m "minecraft"
git push
