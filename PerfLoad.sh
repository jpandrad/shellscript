#!/bin/bash
#
# Simple Content Load. Created for populate NGINX cache base by list of request.
# Author: Joao Paulo de Andrade
#
rootDir="/root/PerfLoad/"
input="$rootDir/data/ContenList01.txt"

while IFS= read -r line
do
curl -s -k -o /dev/null -H "Pragma: <HEADER_HERE>" --user-agent "Linux" "https://$line"

done < "$input"
