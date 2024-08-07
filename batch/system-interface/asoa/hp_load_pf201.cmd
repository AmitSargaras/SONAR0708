@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL USEDEFAULTS METHOD P (1, 2, 3, 4) MESSAGES "%LOG_PATH%" REPLACE INTO %DB_SCHEMA%.HP_TEMP_PF201(RECORD_TYPE, CODE, DESCRIPTION, IS_DELETED) NONRECOVERABLE INDEXING MODE AUTOSELECT





:end