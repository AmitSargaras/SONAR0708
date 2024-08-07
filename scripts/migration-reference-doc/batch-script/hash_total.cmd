perl ..\hash_total.pl %*

IF NOT EXIST "%FILE_PATH%.htgo" (
	echo [error] Hash Total Checking fail.
	set IS_PROCEED=false
)

IF EXIST "%FILE_PATH%.htgo" (
	del "%FILE_PATH%.htgo"
)

IF EXIST "%FILE_PATH%.ht" (
	del "%FILE_PATH%.ht"
)