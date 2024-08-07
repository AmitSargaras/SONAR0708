@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L (	1 1,	2 20,	21 100,	101 120,	121 123,	124 173,	174 175,	176 178,	179 228,	229 268,	269 276,	277 279,	280 329,	330 369,	370 370,	371 378,	379 383,	384 423,	424 424,	425 427,	428 467,	468 471,	472 591,	592 592,	593 632,	633 682,	683 732,	733 782,	783 832,	833 841,	842 843,	844 846,	847 896,	897 897,	898 937,	938 987,	988 1037,	1038 1087,	1088 1137,	1138 1146,	1147 1147) NULL INDICATORS (	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_ARBS_CU001 (	RECORD_TYPE,	CIF_ID,	CUST_NAME_L,	CUST_NAME_S,	CUST_CLASS_CODE,	CUST_CLASS_DESC,	ID_ISSUE_COUNTRY,	ID_TYPE_CODE,	ID_TYPE_DESC,	ID_NUMBER,	ID_IISSUE_DATE,	SECONDARY_ID_TYPE_CODE,	SECONDARY_ID_TYPE_DESC,	SECONDARY_ID_NUMBER,	CUST_TYPE,	CUST_START_DATE,	CUST_SEGMENT_CODE,	CUST_SEGMENT_DESC,	BLACKLISTED,	INCOME_GROUP_CODE,	INCOME_GROUP_DESC,	ISIC_CODE,	ISIC_DESC,	PRIMARY_ADD_TYPE_CODE,	PRIMARY_ADD_TYPE_DESC,	PRIMARY_ADD_1,	PRIMARY_ADD_2,	PRIMARY_ADD_3,	PRIMARY_ADD_4,	PRIMARY_POSTCODE,	PRIMARY_COUNTRY,	LANGUAGE_CODE,	LANGUAGE_DESC,	SECONDARY_ADD_TYPE_CODE,	SECONDARY_ADD_TYPE_DESC,	SECONDARY_ADD_1,	SECONDARY_ADD_2,	SECONDARY_ADD_3,	SECONDARY_ADD_4,	SECONDARY_POSTCODE,	UPDATE_STAT_IND) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end


