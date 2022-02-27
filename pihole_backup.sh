#!/bin/bash

# Создаем резервную копию
cd /home/volokzhanin/docker/pihole/
tar cvpzf /mnt/backup/backup/vvy_pihole/"$(date '+%Y-%m-%d').tar.gz" ./
# Удаляем архивы резервной копии старше n дней
find /mnt/backup/backup/vvy_pihole/ -mtime +3 -type f -delete

# restore 
# cd /home/volokzhanin/docker/pihole/ & tar xpvzf /mnt/backup/backup/vvy_pihole/2021-10-09.tar.gz


