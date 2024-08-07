@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" STRIPTBLANKS NULLINDCHAR=Y METHOD L (1 1, 2 20, 21 140, 141 220, 221 223, 224 273, 274 275, 276 278, 279 318, 319 321, 322 361, 362 362, 363 367, 368 407, 408 408, 409 458, 459 508, 509 558, 559 608, 609 617, 618 619) NULL INDICATORS (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_QUAN_CU008 (RECORD_TYPE, CIF_ID, CUST_NAME_LONG, CUST_NAME_SHORT, CUST_CLASS_CODE, CUST_CLASS_DESC, ID_ISSUE_COUNTRY, ID_TYPE_CODE, ID_NUMBER, SECONDARY_ID_TYPE_CODE, SECONDARY_ID_NUMBER, CUST_TYPE_CODE, CUST_SEGMENT_CODE,	CUST_SEGMENT_DESC, PRIMARY_ADD_TYPE_CODE, PRIMARY_ADD_1, PRIMARY_ADD_2, PRIMARY_ADD_3, PRIMARY_ADD_4, PRIMARY_POSTCODE, PRIMARY_COUNTRY) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end