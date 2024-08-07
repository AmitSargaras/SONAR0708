#!/bin/sh

#################################################################################################
# FTP shell script                                                                              #
# 1st parameter : incoming | outgoing                                                           #
#                 (1) incoming - from ftp server to application server                          #
#                 (2) outgoing - from application server to ftp server                          #
# 2nd parameter : Source file location                                                          #
# 3rd parameter : Destination file location                                                     #
#################################################################################################

HOST='172.18.254.105'
USER='ftpcms'
PASSWD='cmsftp01'
echo "[Info] -- 1st parameter (incoming/outgoing) --" $1;
echo "[Info] -- 2nd parameter (Source File Location) --" $2;
echo "[Info] -- 3rd parameter (Destination File Location) --" $3;

if [ -z "$1" ]; then 
       echo "[error] Please specify parameter"
       return
else 
       if [ ! "$1" = "incoming" ] && [ ! "$1" = "outgoing" ]; then
		echo "[error] Please specify valid parameter"
		return
       fi
fi

if [ -z "$2" ] || [ -z "$3" ]; then 
       echo "[error] Please specify required parameter(s)"
       return
fi

if [ "$1" = "incoming" ]; then
echo "[Info] -- INCOMING parameter --"; 
rm $3/*
ftp -i -n $HOST <<FTP_SCRIPT
quote USER $USER
quote PASS $PASSWD
lcd $3
cd $2
mget *
quit
FTP_SCRIPT
fi

if [ "$1" = "outgoing" ]; then
echo "[Info] -- OUTGOING parameter --";
ftp -i -n $HOST <<FTP_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd $3
lcd $2
mput *
quit
FTP_SCRIPT
fi

echo "[Info] -- End FTP here ! --";
# exit 0

