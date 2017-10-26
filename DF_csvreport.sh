#!/bin/bash
# Author: AKSARAV
# Date: 25-Oct-2017

BASEDIR=`dirname $0`

cd $BASEDIR

egrep -iv  "^Filesystem" *.OUT|sed -e 's/DFDATA_//g' -e 's/.OUT:/ /g'|awk 'BEGIN{printf "%s,%s,%s,%s\n","SERVER_NAME","FILESYSTEM","TYPE","MOUNTED ON" ;}{printf "%s,%s,%s,%s\n",$1,$2,$3,$8;}' > DFREPORT_`date +%H%M%S-%d%h%y`.csv

echo "Report Generated : DFREPORT_`date +%H%M%S-%d%h%y`.csv"
