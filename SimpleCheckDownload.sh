#!/bin/bash
# Simple check lag time to download content
# Author: Joao Paulo de Andrade
# v1.0
#
logFile="/root/curl/bin/output.log"
urlBase="https://domain.com"

#Content Info Example Using Epoch and Token
contentList="video.mp4"
ConnectionID="12345"
epoch=$(date +%s)
epochMD5=$(echo -n $epoch | md5sum | awk '{print $1}')
token=$(echo -n "$urlBase/$contentList?cid=$ConnectionID&ct=$epoch$epochMD5" | md5sum | awk '{print $1}')

curl -s --range 0-8000000 -o /dev/nul -H "Pragma: <HHEADER_HERE>" --user-agent "Simple Check" -w '%{url_effective} %{remote_ip} %{http_code} %{size_download} %{time_namelookup} %{time_connect} %{time_appconnect} %{time_pretransfer} %{time_redirect} %{time_starttransfer} %{time_total} \n' "$urlBase/$contentList?cid=$ConnectionID&ct=$epoch&token=$token" >> $logFile
