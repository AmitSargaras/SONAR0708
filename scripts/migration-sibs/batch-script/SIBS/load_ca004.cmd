@echo off

call ..\set_mig_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L ( 1 1, 2 44, 45 63, 64 66, 67 85, 86 104, 105 105, 106 124, 125 126, 127 131) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".MIG_CA004 (	RECORD_TYPE,	LIMIT_ID,	AA_NUMBER,	FACILITY_CODE,	FACILITY_SEQ,	EXTERNAL_SYSTEM_ACCT_NO,	ACCT_TYPE,	ACCT_SEQ,	LOC_COUNTRY,	LOC_ORG_CODE) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end


