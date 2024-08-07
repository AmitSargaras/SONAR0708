@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" STRIPTBLANKS IMPLIEDDECIMAL NULLINDCHAR=Y METHOD L (1 1,2 28,29 47,48 66,67 70,71 120,121 122,123 162,163 165) NULL INDICATORS (0,0,0,0,0,0,0,0,0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_STBG_CO024 (RECORD_TYPE,SECURITY_ID,CIF_NUMBER,SETTLEMENT_ACCT_NUMBER,PLEDGOR_CIF_SOURCE,PLEDGOR_LEGAL_NAME,INCORPORATION_COUNTRY,ID_DESC,ID_TYPE) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end
