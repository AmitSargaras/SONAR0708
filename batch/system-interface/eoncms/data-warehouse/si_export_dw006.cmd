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

IF "%MMYYYY%" == "" (
  call set_mmyyyy.cmd
)

set FILENAME=CLMFACLNK%MMYYYY%.txt
echo [info] Output file name: %FILENAME%

call ..\set_db2_env.cmd

db2 export to %OUTPUT_DIR%\%FILENAME%_HDR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "values %DB_SCHEMA%.dt_fmt(current date,'ddmmyyyy')"

db2 export to %OUTPUT_DIR%\%FILENAME%_DTL.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "SELECT (DIGITS(COALESCE(CMS_COLLATERAL_ID,0)) || DIGITS(COALESCE(CMS_LSP_APPR_LMTS_ID,0)) || CHAR(COALESCE(SOURCE_ID,''),10) || DIGITS(DECIMAL(COALESCE(CHARGE_AMOUNT,0),17,2)) || DIGITS(DECIMAL(COALESCE(SECURITY_RANK,0),2,0)) || CHAR(COALESCE(SI_TSFMT(CREATE_DATE,'ddmmyyyy'),''),8) || DIGITS(DECIMAL(COALESCE(CMS_ACT_SEC_COVERAGE,0),5,2))) AS COL FROM VIEW_SI_DW006_CLMFACLNK"

db2 export to %OUTPUT_DIR%\%FILENAME%_TLR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "select digits(count(*)) from %DB_SCHEMA%.VIEW_SI_DW006_CLMFACLNK"

REM db2 connect reset

copy /Y %OUTPUT_DIR%\%FILENAME%_HDR.tmp+%OUTPUT_DIR%\%FILENAME%_DTL.tmp+%OUTPUT_DIR%\%FILENAME%_TLR.tmp %OUTPUT_DIR%\%FILENAME%
del %OUTPUT_DIR%\*.tmp

:end
