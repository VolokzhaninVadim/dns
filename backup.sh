#!/bin/sh

# Create variables
FILE=$(date '+%Y-%m-%d_%H_%M_%S.tgz')
DIRECTORY='/mnt/backup/backup/dns'
GPG_KEY=634064C6

# Create archive
tar --create \
    --gzip \
    --file=$DIRECTORY/$FILE \
    --ignore-failed-read \
    --preserve-permissions \
    --verbose \
'/home/volokzhanin/docker/dns/'

# Create encrypted archive
gpg --recipient $GPG_KEY \
    --symmetric \
    --batch \
    --passphrase $GPG_PASSPHRASE \
    --encrypt $DIRECTORY/$FILE
rm $DIRECTORY/$FILE

# Delete files older than n days
find $DIRECTORY -mtime +0 -type f -delete
