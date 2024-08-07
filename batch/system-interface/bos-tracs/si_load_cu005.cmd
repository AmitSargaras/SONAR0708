@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" STRIPTBLANKS IMPLIEDDECIMAL NULLINDCHAR=Y METHOD L (1 1,2 20,21 140,141 220,221 227,228 267,268 269,270 272,273 284,285 292,293 295,296 335,336 336,337 344,345 349, 350 350, 351 400, 401 450, 451 500, 501 550, 551 600, 601 609, 610 611, 612 615, 616 616) NULL INDICATORS (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_BOST_CU005 (RECORD_TYPE,CIF_ID,CUST_NAME_LONG,CUST_NAME_SHORT,CUST_CLASS_CODE,CUST_CLASS_DESC,ID_ISSUE_COUNTRY,ID_TYPE_CODE,ID_NUMBER,ID_ISSUE_DATE,SECONDARY_ID_TYPE_CODE,SECONDARY_ID_NUMBER,CUST_TYPE,CUST_START_DATE,CUST_SEGMENT_CODE,PRIMARY_ADD_TYPE_CODE,PRIMARY_ADD_1,PRIMARY_ADD_2,PRIMARY_ADD_3,PRIMARY_ADD_4,PRIMARY_ADD_5,PRIMARY_POSTCODE,PRIMARY_COUNTRY,ISIC_CODE,UPDATE_STAT_IND) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end
