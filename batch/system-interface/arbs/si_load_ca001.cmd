@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY NOROWWARNINGS TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L (	1 1,	2 20,	21 24,	25 43,	44 44,	45 52,	53 54,	55 59,	60 99,	100 107,	108 127,	128 135) NULL INDICATORS (	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0, 	0) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".SI_TEMP_ARBS_CA001 (	RECORD_TYPE,	CIF_ID,	CIF_SOURCE,	AA_NUMBER,	JOINT_BORROWER_IND,	AA_APPROVED_DATE,	ORI_LOC_COUNTRY,	ORI_LOC_ORG_CODE,	ORI_LOC_ORG_DESC,	ANNUAL_REVIEW_DATE,	AA_STAT,	AA_CREATE_DATE) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end

