#!/bin/bash
# Startup script for backups.

# More comments will be added in the future.

sudo systemd-run --scope --uid=0 -p CPUQuota=10% -p MemoryMax=512M bash /path/to/BACKUP.SH
