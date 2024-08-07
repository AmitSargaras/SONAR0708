@echo off

call ..\set_mig_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L ( 1 1, 2 44, 45 63, 64 66, 67 85, 86 88, 89 93, 94 94, 95 105) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".MIG_CA003_6_MUL (RECORD_TYPE, LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, LMT_FAC_SEQ, TIER_SEQ_NO, TIER_TERM, TIER_TERM_CODE, RATE) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end