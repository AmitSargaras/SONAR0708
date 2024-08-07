IF "%DB_SCHEMA%" == "" (
	call set_db2_env.cmd
)
echo [info] PATH = "%PATH%"
set FILE_PATH=%1
IF "%FILE_PATH%" == "" (
	echo [error] Please specify input file
	goto end
) ELSE (
	echo [info] Backup file to "%FILE_PATH%"_yyyymmdd_hhmm
	call create_backup.cmd "%FILE_PATH%"

	IF NOT EXIST "%FILE_PATH%" (
		echo [error] Data Backup fail.
		set IS_PROCEED=false
		goto end
	)
	
	rem del "%FILE_PATH%"

	IF EXIST "%FILE_PATH%.db2.cmd" (
		echo [info] Running necessary db2 command.
		call "%FILE_PATH%.db2.cmd"
		del "%FILE_PATH%.db2.cmd"
	)
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