#!/bin/bash

# Создаем резервную копию
cd /home/volokzhanin/docker/dns/
tar cvpzf /mnt/backup/backup/vvy_dns/"$(date '+%Y-%m-%d').tar.gz" ./
# Удаляем архивы резервной копии старше n дней
find /mnt/backup/backup/vvy_dns/ -mtime +3 -type f -delete

# restore 
# cd /home/volokzhanin/docker/dns/ & tar xpvzf /mnt/backup/backup/vvy_dns/2021-10-09.tar.gz


