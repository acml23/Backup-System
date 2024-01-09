#!/bin/bash
# Full system backup script.

# More comments will be added in the future.

# Full Backup

cd ../../../
sudo 7zz a root-backup
sudo rsync -a --backup --suffix=`date +'.%F_%H-%M'` root-backup.7z /path/to/backups/root-backup.7z
sudo rm root-backup.7z
