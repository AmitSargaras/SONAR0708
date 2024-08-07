DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

echo "----------------------------------------------";
echo "import user setup... ";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 "select count(*) from transaction where transaction_type in ('USER', 'TEAM')"

"$DB2_HOME"/bin/db2 "delete from transaction where transaction_type in ('USER', 'TEAM')"

"$DB2_HOME"/bin/db2 "select count(*) from transaction where transaction_type in ('USER', 'TEAM')"

"$DB2_HOME"/bin/db2 import from user_team_trx.ixf of ixf messages imp_user_team_trx_log.txt insert into transaction

"$DB2_HOME"/bin/db2move "$DB_SCHEMA" import