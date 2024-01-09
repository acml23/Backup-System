# Backup-System
### These scripts are in a very early state, so caution is advised.
### **Proper documentation will be provided at a later date.**

A collection of Bash scripts for generating backup archives; these scripts are primarily intended for personal servers.

Currently, the scripts and their documentation are a work-in-progress.

Eventually, the documentation will be located in `/DOCUMENTATION`.

## Summary
### Current method of documentation.

To archive the files, the scripts use 7-zip, then they copy the files to another directory (preferably another drive) using Rsync; the archive-name contains the time of the backup.

### Required Software

- 7-zip
- Rsync
- ionice
- nice
- systemd
- sudo

Install:

```
$ apt install 7z
$ apt install rsync
$ apt install sudo
```

- At the moment, each dependency must be installed manually; however, a script will be provided later to automate this process.
- To run the backup automatically, create a cronjob:
	`$ crontab -e`
	
	Add the following:
	`0 5 * * * sudo bash /path/to/scope.sh`

- For the time being, each script will require manual configuration:
	- Replace each `/path/to/...` with your desired directory.
	- Edit `SCOPE.SH` to allocate a greater amount of the RAM and CPU, as the default values are too low.
   
