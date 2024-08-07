@echo off

call ..\set_mig_env.cmd %*

REM IF EXIST "%FILE_PATH%.ht" (
  REM call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 276,15 297,15 312,16
REM )

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L (1 1, 2 20, 21 24, 25 59, 60 78, 79 79, 80 87, 88 89, 90 94, 95 102, 103 122, 123 130, 131 132, 133 135) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".MIG_CA001_AA (RECORD_TYPE, CIF_ID, CIF_SOURCE, LOS_BCA_REF_NUM, AA_NUMBER, JOINT_BORROWER_IND, AA_APPROVED_DATE, ORI_LOC_COUNTRY, ORI_LOC_ORG_CODE, ANNUAL_REVIEW_DATE, AA_STAT, AA_CREATE_DATE, APPLICATION_TYPE, APPLICATION_LAW_TYPE) NONRECOVERABLE INDEXING MODE AUTOSELECT


:end