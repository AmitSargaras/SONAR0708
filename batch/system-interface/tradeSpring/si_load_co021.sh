#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L \(	1 1,	2 33,	34 48,	49 51,	52 81,	82 89\) NULL INDICATORS \(	0, 	0, 	0, 	0, 	0, 	0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_TSPR_CO021 \(	RECORD_TYPE,	FACILITY_ID,	FD_RECEIPT_NO,	FD_DEPOSIT_AMT_CURRENCY,	FD_DEPOSIT_AMT,	FD_DEPOSIT_DATE\) NONRECOVERABLE INDEXING MODE AUTOSELECT