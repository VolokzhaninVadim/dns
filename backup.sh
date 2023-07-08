#!/bin/sh

# Create variables
FILE=$(date '+%Y-%m-%d_%H_%M_%S')
ARCHIVE_TYPE='.tgz'
GPG_TYPE='.gpg'
DIRECTORY_SOURCE='/home/volokzhanin/server/repos/cloud/dns'
DIRECTORY_TARGET='/mnt/backup/backup/dns'
DIRECTORY_S3='/mnt/s3/backup/dns'

GPG_KEY=634064C6

# Create archive
tar --create \
    --gzip \
    --file=$DIRECTORY_TARGET/$FILE$ARCHIVE_TYPE \
    --ignore-failed-read \
    --preserve-permissions \
    --verbose \
$DIRECTORY_SOURCE

# Create encrypted archive
gpg --recipient $GPG_KEY \
    --symmetric \
    --batch \
    --passphrase $GPG_PASSPHRASE \
    --encrypt $DIRECTORY_TARGET/$FILE$ARCHIVE_TYPE
rm $DIRECTORY_TARGET/$FILE$ARCHIVE_TYPE

# Move file
mv $DIRECTORY_TARGET/$FILE$ARCHIVE_TYPE$GPG_TYPE $DIRECTORY_S3

# Delete files older than n days
find $DIRECTORY_S3 -mtime +20 -type f -delete
