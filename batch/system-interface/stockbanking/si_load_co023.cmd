@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" STRIPTBLANKS NULLINDCHAR=Y METHOD L (1 1, 2 20, 21 47, 48 96, 97 104, 105 105, 106 123, 124 124) NULL INDICATORS (0,0,0,0,0,0,0,0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_STBG_CO023 (RECORD_TYPE,CIF,SECURITY_ID,SHARE_ID,TRANSACTION_DATE,SHARES_TYPE,UNITS,SIGN_OF_UNITS) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end
