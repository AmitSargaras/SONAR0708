@echo off

call ..\set_si_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL USEDEFAULTS METHOD P (1, 2, 3) MESSAGES "%LOG_PATH%" REPLACE INTO %DB_SCHEMA%.HP_TEMP_PF142(RECORD_TYPE, MSG_TYYPE_CODE, MSG_TEXT) NONRECOVERABLE INDEXING MODE AUTOSELECT



:end