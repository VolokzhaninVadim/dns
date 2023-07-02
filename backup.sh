#!/bin/sh

# Create variables
FILE=$(date '+%Y-%m-%d_%H_%M_%S.tgz')
DIRECTORY_SOURCE='/home/volokzhanin/server/repos/cloud/dns'
DIRECTORY_TARGET='/mnt/backup/backup/dns'

GPG_KEY=634064C6

# Create archive
tar --create \
    --gzip \
    --file=$DIRECTORY_TARGET/$FILE \
    --ignore-failed-read \
    --preserve-permissions \
    --verbose \
$DIRECTORY_SOURCE

# Create encrypted archive
gpg --recipient $GPG_KEY \
    --symmetric \
    --batch \
    --passphrase $GPG_PASSPHRASE \
    --encrypt $DIRECTORY_TARGET/$FILE
rm $DIRECTORY_TARGET/$FILE

# Delete files older than n days
find $DIRECTORY_TARGET -mtime +0 -type f -delete
