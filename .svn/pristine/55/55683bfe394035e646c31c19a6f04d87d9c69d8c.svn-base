DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cmsuat
DB_USER=cmsuat
DB_PASSWD=cmsuat789
DB_SCHEMA=cmsuat

export DB2_HOME;
export DB_NAME;
export DB_USER;
export DB_PASSWD;
export DB_SCHEMA;

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"