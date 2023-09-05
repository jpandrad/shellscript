#!/bin/bash
# Description: Script for Compress and clean log file
# Author: João Paulo de Andrade

# Path Log File
LogPath="/opt/jboss/server/application/log"

# Number of Days for Log Retention
BackupRetention='2'

# Compress Log File
Data=$(date -d 'yesterday' '+%Y-%m-%d')
gzip $LogPath/server.log.$Data

# Clean Log File
find $LogPath/*.gz -daystart -mtime "+$BackupRetention" -exec rm -fr {} \; > /dev/null 2>&1
