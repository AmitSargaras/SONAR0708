#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L \(	1 1,	2 33,	34 34,	35 134,	135 135\) NULL INDICATORS \(	0, 	0, 	0, 	0, 	0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_TSPR_CA010 \(	RECORD_TYPE,	LIMIT_ID,	TYPE,	SUPPLIER_BUYER_NAME,	UPDATE_STAT_IND\) NONRECOVERABLE INDEXING MODE AUTOSELECT