@echo off

rem set OUTPUT_DIR=%1
rem set OUTPUT_DIR=C:/Workspace/eoncms/trunk/config/test/simessage/ccrd
set OUTPUT_DIR=C:\Workspace\eoncms\trunk\config\test\simessage\ccrd
IF "%OUTPUT_DIR%" == "" (
	echo [error] Please specify output directory
	goto end
)

rem set LOG_PATH=%2
set LOG_PATH=C:/Workspace/eoncms/trunk/config/test/simessage/ccrd/CO005.log
IF "%LOG_PATH%" == "" (
	echo [warn] Log file not specified, default to log_file.txt
	set LOG_PATH=log_file.txt
)

set FILENAME=CCCMSIN
echo [info] Output file name: %FILENAME%

call ..\set_db2_env.cmd

db2 export to %OUTPUT_DIR%\%FILENAME%_HDR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "VALUES 'H' || TS_FMT(CURRENT TIMESTAMP, 'yyyymmdd') || REPEAT(' ', 3) || 'CO005' || REPEAT(' ', 3) || 'CCRD' || REPEAT(' ', 20) || 'T'"

db2 export to %OUTPUT_DIR%\%FILENAME%_DTL.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "SELECT 'D' || LEFT(los_bca_ref_num, 21) || RIGHT(deposit_receipt_number, 7) || RIGHT(LEFT(CHAR(pledged_amount), 27), 15) || 'T' from VIEW_SI_SEMA_CO005_FD"

perl ..\hash_total.pl gen %OUTPUT_DIR%\%FILENAME%_DTL.tmp %OUTPUT_DIR%\CCCMSIN.ht.tmp 30,15

perl ..\gen_trailer.pl %OUTPUT_DIR%\%FILENAME%.ht.tmp %OUTPUT_DIR%\%FILENAME%_DTL.tmp %OUTPUT_DIR%\%FILENAME%.trailer.tmp

echo                   T>> %OUTPUT_DIR%\%FILENAME%.trailer.tmp

copy /Y %OUTPUT_DIR%\%FILENAME%_HDR.tmp +%OUTPUT_DIR%\%FILENAME%_DTL.tmp +%OUTPUT_DIR%\%FILENAME%.trailer.tmp %OUTPUT_DIR%\%FILENAME%

del %OUTPUT_DIR%\*.tmp


:end
