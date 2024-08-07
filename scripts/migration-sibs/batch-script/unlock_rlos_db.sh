#!/bin/sh

. ./setenv.sh

echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` "Forcing all active connection to close ... "
# "$DB2_HOME"/bin/db2 FORCE APPLICATION ALL
# "$DB2_HOME"/bin/db2 TERMINATE

# sleep 5

echo `date +"%Y/%m/%d %H:%M:%S"` "Activating the database " $RLOS_DB_NAME " ... "
"$DB2_HOME"/bin/db2 CONNECT TO $RLOS_DB_NAME USER $RLOS_USERNAME USING $RLOS_PASSWORD
"$DB2_HOME"/bin/db2 UNQUIESCE DATABASE
"$DB2_HOME"/bin/db2 CONNECT RESET

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` "The $RLOS_DB_NAME database had been unlocked."