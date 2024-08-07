DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

echo "----------------------------------------------";
echo "export database schema ... ";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2move "$DB_SCHEMA" export -sn "$DB_SCHEMA"