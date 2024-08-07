#!/bin/sh

. ./setenv.sh

DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_schema.sql -l "$LOG_PATH"/qc_report_schema.log
