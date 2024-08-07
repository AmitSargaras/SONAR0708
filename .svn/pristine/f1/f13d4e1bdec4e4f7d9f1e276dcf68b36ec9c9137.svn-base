#!/bin/bash

DB2_HOME=/opt/IBM/db2/V9.1
DB_NAME=EONCMS
DB_USER=eoncms
DB_PASSWD=eoncms
DB_SCHEMA=EONCMS

FILE_PATH=/batch/eoncms_patches/mukim_district_patches/MUKIM
DUMP_PATH=/batch/eoncms_patches/mukim_district_patches/logs/MUKIM.dmp
LOAD_LOG=/batch/eoncms_patches/mukim_district_patches/logs/MUKIM.log
LOG_PATH=$LOAD_LOG
TEMPFILE_PATH=/batch/eoncms_patches/mukim_district_patches/logs

"$DB2_HOME"/bin/db2 CONNECT TO $DB_NAME USER $DB_USER USING $DB_PASSWD
"$DB2_HOME"/bin/db2 set CURRENT SCHEMA = $DB_SCHEMA
"$DB2_HOME"/bin/db2 set CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,$DB_SCHEMA

# if [ -z $1 ]; then
	# echo "[error] Please specify input file"
	# return
# fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L \(1 20, 21 71\) MESSAGES "$LOG_PATH" TEMPFILES PATH "$TEMPFILE_PATH" REPLACE INTO "$DB_SCHEMA".LOAD_CO009_PT \(SECURITY_ID, SIBS_PROPERTY_ADDRESS\) NONRECOVERABLE INDEXING MODE AUTOSELECT

 #. ./load_property.sh $MSG_DIR/MUKIM $DUMPPATH/MUKIM.dmp $LOAD_LOG/MUKIM.log