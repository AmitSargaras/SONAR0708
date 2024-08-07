#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" STRIPTBLANKS IMPLIEDDECIMAL NULLINDCHAR=Y METHOD L \(1 1,2 11,12 61,62 64,65 71,72 74,75 94,95 99,100 139,140 142,143 153,154 170,171 187,188 195,196 198,199 199\) NULL INDICATORS \(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_STBG_PF001 \(RECORD_TYPE, STOCK_CODE, COUNTER_NAME, EXCHANGE_CODE, UNIT_PRICE, UNIT_PRICE_CURRENCY, ISIN_CODE, STOCK_EXCHG_TRAD_BOARD_CODE, STOCK_EXCHG_TRAD_BOARD_DESC, STOCK_TYPES, LISTED_SHARES_QUANTITY, PAR_VALUE, PAID_UP_CAPITAL, EXPIRY_DATE, SHARE_STAT, STOCK_EXCHG_SUSPEND_COUNT_IND\) NONRECOVERABLE INDEXING MODE AUTOSELECT

