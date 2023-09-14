#!/bin/bash
# Script created to check the latency on the NFS/SMB mounted point.
# Requirement: rsync

# MAN fallocate
# The length and offset arguments may be followed by the
#       multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
#       for GiB, TiB, PiB, EiB, ZiB, and YiB (the "iB" is optional, e.g.,
#       "K" has the same meaning as "KiB") or the suffixes KB (=1000), MB
#       (=1000*1000), and so on for GB, TB, PB, EB, ZB, and YB.

srcFile1mb=/tmp/1mb-file.txt
srcFile1gb=/tmp/1gb-file.txt
dstFile="/root/tranfers-test/"


fallocate -l 1048576 $srcFile1mb
fallocate -l 1073741824 $srcFile1gb

rsync -ah --progress $srcFile1mb $dstFile
rsync -ah --progress $srcFile1gb $dstFile
