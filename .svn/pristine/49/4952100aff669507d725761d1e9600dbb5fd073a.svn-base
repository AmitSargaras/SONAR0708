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
echo `date +"%Y/%m/%d %H:%M:%S"` Setting up db - schema and procedures ... 

"$DB2_HOME"/bin/db2 -tf setup.sql -l setup.log


echo "----------------------------------------------";
echo "Loading Checklist Template Item Setup.....";

echo `date +"%Y/%m/%d %H:%M:%S"` Loading CC Setup Items ... 
"$DB2_HOME"/bin/db2 "LOAD FROM cc.csv OF DEL modified by dumpfile="cc.dmp" dumpfileaccessall dateformat=\"YYYYMMDD\" timestampformat = \"YYYYMMDD\" coldel0x2C method P (3,4,5,6,7,8) savecount 200000 messages "cc.log" insert into TMP_DOCUMENT_GLOBALLIST (IS_PRE_APPROVE, DOC_VERSION, IS_FOR_BORROWER, IS_FOR_PLEDGOR, DOCUMENT_CODE, DOCUMENT_DESCRIPTION) FOR EXCEPTION ERR_DOCUMENT_GLOBALLIST NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE"

"$DB2_HOME"/bin/db2 "UPDATE TMP_DOCUMENT_GLOBALLIST SET CATEGORY = 'CC' WHERE CATEGORY IS NULL"


echo `date +"%Y/%m/%d %H:%M:%S"` Loading Security Setup Items ... 
"$DB2_HOME"/bin/db2 "LOAD FROM sec.csv OF DEL modified by dumpfile="sec.dmp" dumpfileaccessall dateformat=\"YYYYMMDD\" timestampformat = \"YYYYMMDD\" coldel0x2C method P (3,4,5,6,7) savecount 200000 messages "sec.log" insert into TMP_DOCUMENT_GLOBALLIST (IS_PRE_APPROVE, DOC_VERSION, LOAN_APP_TYPE, DOCUMENT_CODE, DOCUMENT_DESCRIPTION) FOR EXCEPTION ERR_DOCUMENT_GLOBALLIST NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE"

"$DB2_HOME"/bin/db2 "UPDATE TMP_DOCUMENT_GLOBALLIST SET CATEGORY = 'S' WHERE CATEGORY IS NULL"



echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Calling procedure to load to actual .....

"$DB2_HOME"/bin/db2 CALL LOAD_DOC_GLOBAL_ITEM


echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs to logs folder

mkdir logs
mv *.log ./logs/


echo "----------------------------------------------";
echo `date +"%Y/%m/%d %H:%M:%S"` Loading Completed ... 
