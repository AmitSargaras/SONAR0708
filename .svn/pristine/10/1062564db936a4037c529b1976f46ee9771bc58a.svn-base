#!/bin/sh

. ../setenv.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "Connecting to database " $DB_NAME " ... "
"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD

echo `date +"%Y/%m/%d %H:%M:%S"` "Forcing of all connection ... "
"$DB2_HOME"/bin/db2 QUIESCE DATABASE IMMEDIATE FORCE CONNECTIONS
"$DB2_HOME"/bin/db2 CONNECT RESET

echo `date +"%Y/%m/%d %H:%M:%S"` "Offline backup database in progress ... "
"$DB2_HOME"/bin/db2 BACKUP DATABASE $DB_NAME TO $DB_DUMPPATH WITH 2 BUFFERS BUFFER 1024 PARALLELISM 1 COMPRESS  WITHOUT PROMPTING

echo `date +"%Y/%m/%d %H:%M:%S"` "Activating the database " $DB_NAME " ... "
"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD
"$DB2_HOME"/bin/db2 UNQUIESCE DATABASE
"$DB2_HOME"/bin/db2 CONNECT RESET

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "Backup process completed."