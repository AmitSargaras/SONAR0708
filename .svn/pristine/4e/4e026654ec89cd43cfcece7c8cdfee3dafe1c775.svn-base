DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cmsuat
DB_SCHEMA=cmsuat
DB_USER=cmsuat
DB_PASSWD=cmsuat123
DB_SCHEMA=CMSUAT

export DB2_HOME;
export DB_NAME;
export DB_SCHEMA;

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD" > /dev/null

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA" > /dev/null

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA" > /dev/null
