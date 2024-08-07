@echo off

call ..\set_si_env.cmd %*

IF EXIST "%FILE_PATH%.ht" (
  call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 228,14 243,14
)

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" STRIPTBLANKS IMPLIEDDECIMAL NULLINDCHAR=Y METHOD L (1 1,2 20,21 40,41 83,84 91,92 134,135 136,137 141,142 181,182 184,185 224,225 227,228 241,242 256) NULL INDICATORS (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_FINS_CA017 (RECORD_TYPE,CIF_ID,AA_NUMBER,LIMIT_ID,EXPIRY_DATE,OUTER_LIMIT_ID,ORI_LOC_COUNTRY,ORG_LOC_ORG_CODE,ORG_LOC_ORG_DESC,FACILITY_TYPE_CODE,FACILITY_TYPE_DESC,LIMIT_CURRENCY,LIMIT_AMT,OUTSTANDING_AMT) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end
