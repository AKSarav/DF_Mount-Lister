#!/bin/sh
# Author: AKSARAV
# Date: 25 October 2017

BASE_DIR=`dirname $0`
IN_FILE=$BASE_DIR"/serverlist"
PASSFILE=$BASE_DIR"/password.txt"
username=$1

if [ $# -ne 1 ]
then
        echo "Script must be started with the username"
        exit 4;
fi

if [ -e $IN_FILE -a  -s $IN_FILE ]
then
        echo "Server List file present"
else
        echo  "ERROR: serverlist File is NOT PRESENT or EMPTY"
        exit 8;
fi

if [ -e $PASSFILE -a -s $PASSFILE ]
then
        echo "Password file is present"
else
        echo "ERROR: Password file is NOT PRESENT or EMPTY"
        exit 9;
fi

function getdata
{

#REMOVE ALL DATAFILES BEFORE PROCESSING
rm -rf *.OUT

for LINE in `cat $IN_FILE`
do
        OUT_FILE="DFDATA_"$LINE".OUT";
        #sshpass -f password.txt ssh  sthangar@dldbmtomcat05 "df -hPT"
        echo -e "\nConnecting to the server: $LINE"
        echo -e "\nOutput file Generated:  $OUT_FILE"
        sshpass -f$PASSFILE ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $username@$LINE "df -hPT" > $OUT_FILE

done
echo -e "\nRemoving the password.txt file for Security purpose"
rm -rf password.txt
if [ $? -eq 0 ]
then
        echo -e "\nDone!";
else
        echo -e "\nFAILURE : PLEASE MANULLAY REMOVE THE password.txt FILE"
fi

}
getdata
