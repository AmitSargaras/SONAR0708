@echo off

call ..\set_si_env.cmd %*

IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 8 9
)

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="%DUMP_PATH%" TIMESTAMPFORMAT=\"DDMMYYYY\" METHOD P (1, 2, 3, 4, 5, 6, 7, 8, 9) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_QUAN_CA016 (RECORD_TYPE, COUNTER_PARTY_NAME, CIF_ID, AA_NUMBER, EXPIRY_DATE, OUTER_LIMIT_CIF_ID, ORI_LOC_ORG_CODE, LIMIT_AMOUNT, OUTSTANDING_AMOUNT) NONRECOVERABLE INDEXING MODE AUTOSELECT


:end