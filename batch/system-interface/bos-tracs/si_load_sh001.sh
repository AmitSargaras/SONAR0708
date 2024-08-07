#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" STRIPTBLANKS IMPLIEDDECIMAL NULLINDCHAR=Y METHOD L \(1 1,2 15,16 29,30 49,50 52,53 54,55 72,73 73,74 113\) NULL INDICATORS \(0, 0, 0, 0, 0, 0, 0, 0, 0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_BOST_SH001 \(RECORD_TYPE,COUNTER_CODE,STOCK_CODE,ISIN_CODE,STOCK_EXCHANGE_CODE,STOCK_EXCHANGE_COUNTRY,TOTAL_NO_OF_UNIT,SIGN_OF_UNIT,ISSUER_NAME\) NONRECOVERABLE INDEXING MODE AUTOSELECT
