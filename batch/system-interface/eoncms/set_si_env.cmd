set FILE_PATH=%1
IF "%FILE_PATH%" == "" (
	echo [error] Please specify input file
	goto end
) ELSE (
	echo [info] Backup file to "%FILE_PATH%"_yyyymmdd_hhmm
	call ..\create_backup.cmd "%FILE_PATH%" .\backup
	perl ..\gather_info.pl %FILE_PATH% cmd %2%

	IF NOT EXIST "%FILE_PATH%.go" (
		echo [error] Data Integrity Checking fail.
		set IS_PROCEED=false
		goto end
	)
	
	del "%FILE_PATH%.go"
)

set IS_PROCEED=true

:end