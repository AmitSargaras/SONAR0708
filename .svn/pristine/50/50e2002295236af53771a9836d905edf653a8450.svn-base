IF "%DB_SCHEMA%" == "" (
	call ..\system-interface\set_db2_env.cmd
)

set FILE_PATH=%1
IF "%FILE_PATH%" == "" (
	echo [error] Please specify input file
	goto end
) ELSE (
	rem echo [info] Backup file to "%FILE_PATH%"_yyyymmdd_hhmm
	rem call create_backup.cmd "%FILE_PATH%" .\backup
	perl gather_info.pl %FILE_PATH% cmd

)

set DUMP_PATH=%2
IF "%2" == "" (
	echo [warn] Dump file not specified, default to dump_file.txt
	set DUMP_PATH=dump_file.txt
)

set LOG_PATH=%3
IF "%3" == "" (
	echo [warn] Log file not specified, default to log_file.txt
	set LOG_PATH=log_file.txt
)

set IS_PROCEED=true

:end
