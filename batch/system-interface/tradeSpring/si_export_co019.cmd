@echo off

set OUTPUT_DIR=%1
IF "%OUTPUT_DIR%" == "" (
	echo [error] Please specify output directory
	goto end
)

set LOG_PATH=%2
IF "%LOG_PATH%" == "" (
	echo [warn] Log file not specified, default to log_file.txt
	set LOG_PATH=log_file.txt
)

set FILENAME=CO019TSPR
echo [info] Output file name: CO019TSPR

call ..\set_db2_env.cmd

db2 export to %OUTPUT_DIR%\%FILENAME%_HDR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "values 'H'||%DB_SCHEMA%.dt_fmt(current date,'ddmmyyyy')||char('',3)||'CO019'||char('',3)||'TSPR'||char('',90)"

db2 export to %OUTPUT_DIR%\%FILENAME%_DTL.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "select ('D'||char(lmt_id,32)||substr(digits(cms_collateral_id),6,14)||char(type_name,50)||substr(digits(cmv),4,17)) as COL from %DB_SCHEMA%.VIEW_SI_CO019_TSPR"

db2 export to %OUTPUT_DIR%\%FILENAME%_TLR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "select 'T'||digits(count(*))||char('',103) from %DB_SCHEMA%.VIEW_SI_CO019_TSPR"

db2 connect reset

rem perl -pi.bak -e "tr/\"//d" %OUTPUT_DIR%\%FILENAME%_HDR.tmp
rem perl -pi.bak -e "tr/\"//d" %OUTPUT_DIR%\%FILENAME%_DTL.tmp
rem perl -pi.bak -e "tr/\"//d" %OUTPUT_DIR%\%FILENAME%_TLR.tmp
rem del %OUTPUT_DIR%\*.bak

copy /Y %OUTPUT_DIR%\%FILENAME%_HDR.tmp+%OUTPUT_DIR%\%FILENAME%_DTL.tmp+%OUTPUT_DIR%\%FILENAME%_TLR.tmp %OUTPUT_DIR%\%FILENAME%
del %OUTPUT_DIR%\*.tmp

:end
