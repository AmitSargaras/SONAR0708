
DB2_HOME=/usr/IBM/db2/V9.1

DB_NAME=gcms
DB_USER=gcms
DB_PASSWD=gcms
DB_SCHEMA=GCMS

echo "----------------------------------------------";
echo "Dropping database.....";

"$DB2_HOME"/bin/db2 terminate
"$DB2_HOME"/bin/db2 db2stop force
"$DB2_HOME"/bin/db2 db2start 
"$DB2_HOME"/bin/db2 drop database "$DB_NAME"

echo "----------------------------------------------";
echo "Script ends.";
