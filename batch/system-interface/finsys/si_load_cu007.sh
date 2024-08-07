. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" STRIPTBLANKS NULLINDCHAR=Y METHOD L \(1 1,2 20,21 100,101 102,103 105,106 145,146 185,186 188,189 228,229 268\) NULL INDICATORS \(0, 0, 0, 0, 0, 0, 0, 0, 0, 0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_FINS_CU007 \(RECORD_TYPE,CIF_ID,CUST_NAME_LONG,ID_ISSUE_COUNTRY,ID_TYPE_CODE,ID_TYPE_DESC,ID_NUMBER,SECONDARY_ID_TYPE_CODE,SECONDARY_ID_TYPE_DESC,SECONDARY_ID_NUMBER\) NONRECOVERABLE INDEXING MODE AUTOSELECT
