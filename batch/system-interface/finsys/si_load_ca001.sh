. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" STRIPTBLANKS NULLINDCHAR=Y METHOD L \(1 1,2 20,21 24,25 44,45 45,46 53,54 55,56 60,61 100,101 108,109 128,129 136\) NULL INDICATORS \(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0\) MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".SI_TEMP_FINS_CA001 \(RECORD_TYPE,CIF_ID,CIF_SOURCE,AA_NUMBER,JOINT_BORROWER_IND,AA_APPROVED_DATE,ORI_LOC_COUNTRY,ORI_LOC_ORG_CODE,ORI_LOC_ORG_DESC,ANNUAL_REVIEW_DATE,AA_STAT,AA_CREATE_DATE\) NONRECOVERABLE INDEXING MODE AUTOSELECT
