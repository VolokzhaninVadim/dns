#!/bin/bash

#sudo apt-get install p7zip-full
# Создаем резервную копию
cd /home/volokzhanin/docker/dns/
tar cvpzf /mnt/backup/backup/vvy_dns/"$(date '+%Y-%m-%d').tar.gz" ./
7za a -tzip -p$ARCHIVE_DNS -mem=AES256  /mnt/backup/backup/vvy_dns/"$(date '+%Y-%m-%d').zip" /mnt/backup/backup/vvy_dns/"$(date '+%Y-%m-%d').tar.gz"
rm /mnt/backup/backup/vvy_dns/"$(date '+%Y-%m-%d').tar.gz"
# Удаляем архивы резервной копии старше n дней
find /mnt/backup/backup/vvy_dns/ -mtime +0 -type f -delete

# restore
# 7za e /mnt/backup/backup/vvy_dns/2021-10-09.zip
# cd /home/volokzhanin/docker/dns/ & tar xpvzf /mnt/backup/backup/vvy_dns/2021-10-09.tar.gz

