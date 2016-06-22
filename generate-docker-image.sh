#!/bin/bash

help() {
   echo "Syntax: $0 <input.tar.gz> <output.tar.gz>"
}

if [ $# -lt 2 ] ; then
   help
   echo "Missing parameters"
   exit 255
fi

if ! file -L $1 | grep -q 'gzip compressed data' ; then
   echo "Input file ($1) is not a compressed tarball"
fi

# Uncompress the file
temp=$(tempfile)
gunzip -c $1 > $temp
tar --delete -f $temp ./etc/systemd/system/getty.target.wants                                        
gzip -c $temp > $2

rm $temp
