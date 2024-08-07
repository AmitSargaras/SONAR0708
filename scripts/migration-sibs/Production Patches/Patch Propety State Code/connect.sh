#!/bin/sh

. ./setenv.sh

# Establish connection
# "$DB2_HOME"/bin/db2 ACTIVATE DATABASE $DB_NAME

"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD

"$DB2_HOME"/bin/db2 set CURRENT SCHEMA = $DB_SCHEMA

"$DB2_HOME"/bin/db2 set CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,$DB_SCHEMA