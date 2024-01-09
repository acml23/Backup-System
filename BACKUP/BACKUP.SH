#!/bin/bash
# Primary backup script containing incremental backup commands.

# More comments will be added in the future.

# Backup Script

version="v0.1.0-a.1"

# Add "-a" flag between "--bwlimit=1000" and "--backup" for async (higher CPU usage).

# Color-Coding

white='\e[0;37m'
green='\e[0;32m'
yellow='\e[0;33m'
red='\e[0;31m'

echo -e "${white}"

echo -e "${yellow}Running ${green}${version}${white}\n"

# Remove Existing Archives

echo -e "${yellow}Removing old archives.${white}\n"

sudo rm /path/to/service/services.7z
sudo rm /path/to/service/services.7z.*

sudo rm /var/www/html.7z
sudo rm /var/www/html.7z.*

sudo rm /opt/opt.7z
sudo rm /opt/opt.7z.*

echo -e "\n${green}Finished.${white}\n"

# Incremental Backups

echo -e "${yellow}Creating backup archives.${white}\n"

cd /path/to/service
sudo nice -n11 ionice --class 2 7zz a services

sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /path/to/service/services.7z /path/to/backups/path/to/service.7z

#cd /var/www/html
#sudo nice -n11 ionice --class 2 sudo 7zz a html
#sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /var/www/html/html.7z /path/to/backups/var/www/html.7z

cd /opt
sudo nice -n11 ionice --class 2 7zz a opt
sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /opt/opt.7z /path/to/backups/opt.7z

sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /var/spool/cron root/backup/var/spool/cron
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/fstab root/backup/etc/fstab
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/sudoers root/backup/etc/sudoers
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/apt/sources.list /path/to/backups/etc/apt

# Full Backups

sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /path/to/service/services.7z /path/to/full-backups/path/to/service.7z
sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /var/www/html/html.7z /path/to/full-backups/var/www/html.7z
sudo nice -n11 ionice --class 2 rsync --bwlimit=1000 -a --backup --whole-file --suffix=`date +'.%F_%H-%M'` /opt/opt.7z /path/to/backups/opt.7z

sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /var/spool/cron /path/to/full-backups/var/spool/cron
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/fstab /path/to/full-backups/etc/fstab
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/sudoers /path/to/full-backups/etc/sudoers
sudo nice -n11 ionice --class 2 sudo rsync -rtDvz /etc/apt/sources.list /path/to/full-backups/etc/apt

echo -e "\n${green}Complete.${white}\n"

# Remove Leftovers

echo -e "${yellow}Removing leftovers.${white}\n"

sudo rm /path/to/service/services.7z
sudo rm /path/to/service/services.7z.*

sudo rm /var/www/html.7z
sudo rm /var/www/html.7z.*

sudo rm /opt/opt.7z
sudo rm /opt/opt.7z.*

echo -e "\n${green}Complete.${white}\n"
