DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=climssit
DB_SCHEMA=climssit

export DB2_HOME;
export DB_NAME;
export DB_SCHEMA;

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" > /dev/null

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA" > /dev/null

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA" > /dev/null