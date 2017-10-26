#!/bin/bash
# Author: AKSARAV
# Date: 25-Oct-2017

BASEDIR=`dirname $0`

cd $BASEDIR

echo -e "\n NFS REPORT:"
 grep -i NFS *.OUT|sed -e 's/DFDATA_//g' -e 's/.OUT:/ /g'| awk 'BEGIN{for(c=0;c<125;c++) printf "-"; printf "\n"; printf "%-20s %-80s %-10s %10s\n","SERVER_NAME","FILESYSTEM","TYPE","MOUNTED ON" ; for(c=0;c<125;c++) printf "-"; printf "\n";  }{printf "%-20s %-80s %-10s %10s\n",$1,$2,$3,$8;}'

echo -e "\n XFS REPORT:"
grep -i XFS *.OUT|sed -e 's/DFDATA_//g' -e 's/.OUT:/ /g'| awk 'BEGIN{for(c=0;c<125;c++) printf "-"; printf "\n"; printf "%-20s %-80s %-10s %10s\n","SERVER_NAME","FILESYSTEM","TYPE","MOUNTED ON" ; for(c=0;c<125;c++) printf "-"; printf "\n";  }{printf "%-20s %-80s %-10s %10s\n",$1,$2,$3,$8;}'

echo -e "\n OTHERS:"
egrep -iv  "XFS|NFS|^Filesystem" *.OUT|sed -e 's/DFDATA_//g' -e 's/.OUT:/ /g'| awk 'BEGIN{for(c=0;c<125;c++) printf "-"; printf "\n"; printf "%-20s %-80s %-10s %10s\n","SERVER_NAME","FILESYSTEM","TYPE","MOUNTED ON" ; for(c=0;c<125;c++) printf "-"; printf "\n";  }{printf "%-20s %-80s %-10s %10s\n",$1,$2,$3,$8;}'
