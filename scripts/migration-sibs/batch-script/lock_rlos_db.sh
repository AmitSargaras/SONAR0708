#!/bin/sh

# This locking method will result the user not able to connect to database with the bellow error
# SQL0752N  Connecting to a database is not permitted within a logical unit of
# work when the CONNECT type 1 setting is in use.  SQLSTATE=0A001

. ./setenv.sh

echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` "Forcing all active connection to close ... "
# "$DB2_HOME"/bin/db2 FORCE APPLICATION ALL
# "$DB2_HOME"/bin/db2 TERMINATE

# sleep 5

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "Connecting to database $RLOS_DB_NAME ... "
"$DB2_HOME"/bin/db2 CONNECT TO $RLOS_DB_NAME USER $RLOS_USERNAME USING $RLOS_PASSWORD

echo `date +"%Y/%m/%d %H:%M:%S"` "Forcing off all connection connected to $RLOS_DB_NAME ... "
"$DB2_HOME"/bin/db2 QUIESCE DATABASE IMMEDIATE FORCE CONNECTIONS
"$DB2_HOME"/bin/db2 CONNECT RESET

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "The $RLOS_DB_NAME database had been locked. To unlock please execute unlock_rlos_db.sh"