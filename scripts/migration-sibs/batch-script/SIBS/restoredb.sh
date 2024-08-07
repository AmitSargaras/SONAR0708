#!/bin/sh

. ../setenv.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "Connecting to database " $DB_NAME " ... "
"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD

echo `date +"%Y/%m/%d %H:%M:%S"` "Forcing of all connection ... "
"$DB2_HOME"/bin/db2 QUIESCE DATABASE IMMEDIATE FORCE CONNECTIONS
"$DB2_HOME"/bin/db2 CONNECT RESET

echo `date +"%Y/%m/%d %H:%M:%S"` "Restore database in progress ... "
"$DB2_HOME"/bin/db2 RESTORE DATABASE $DB_NAME FROM $DB_RESTOREPATH WITH 2 BUFFERS BUFFER 1024 REPLACE EXISTING WITHOUT ROLLING FORWARD WITHOUT PROMPTING

echo `date +"%Y/%m/%d %H:%M:%S"` "Activating the database " $DB_NAME " ... "
"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD
"$DB2_HOME"/bin/db2 UNQUIESCE DATABASE
"$DB2_HOME"/bin/db2 CONNECT RESET

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "Restore process completed."