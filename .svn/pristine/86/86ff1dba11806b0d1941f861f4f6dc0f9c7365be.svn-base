#!/bin/sh


echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Setting up environment variables ... 

DB2_HOME=/usr/IBM/db2/V9.1
DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Connecting to DB ... 

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"
"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"
"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"


echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Cleaning up temp tables and procedures ... 

"$DB2_HOME"/bin/db2 -tf cleanup.sql -l cleanup.log


echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Clean Up Done ...
