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

set FILENAME=CLMPHYCOL%MMYYYY%.txt
echo [info] Output file name: %FILENAME%

call ..\set_db2_env.cmd

db2 export to %OUTPUT_DIR%\%FILENAME%_HDR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "values %DB_SCHEMA%.dt_fmt(current date,'ddmmyyyy')"

db2 export to %OUTPUT_DIR%\%FILENAME%_DTL.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "SELECT (CHAR(SOURCE_ID,4) || DIGITS(CMS_COLLATERAL_ID) || CHAR(SECURITY_TYPE_ID,2) || CHAR(SECURITY_SUB_TYPE_ID,5) || CHAR(SCI_SECURITY_CURRENCY,3) || CHAR(COALESCE(SUBTYPE_STANDARDISED_APPROACH,''),1) || CHAR(COALESCE(FIRB,''),1) || CHAR(COALESCE(AIRB,''),1) || CHAR(COALESCE(IS_LEGAL_ENFORCE,''),1) || CHAR(COALESCE(SI_TSFMT(IS_LEGAL_ENFORCE_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(SECURITY_MATURITY_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(VALUATION_DATE,'ddmmyyyy'),''),8) || DIGITS(DECIMAL(COALESCE(VALUATION_FREQUENCY,0),3,0)) || CHAR(COALESCE(VALUATION_FREQUENCY_UNIT,''),1) || CHAR(COALESCE(VALUATION_CURRENCY,''),3) || DIGITS(DECIMAL(COALESCE(CMV,0),17,2)) || DIGITS(DECIMAL(COALESCE(FSV,0),17,2)) || DIGITS(DECIMAL(COALESCE(RESERVE_PRICE,0),17,2)) || DIGITS(DECIMAL(COALESCE(PURCHASE_PRICE,0),17,2)) || CHAR(IRREVOCABLE_FLAG,1) || CHAR(HAIRCUT_SET_ID,5)) AS COL FROM VIEW_SI_DW002_CLMPHYCOL"

db2 export to %OUTPUT_DIR%\%FILENAME%_TLR.tmp of del modified by nochardel coldel0x2C messages %LOG_PATH% "select digits(count(*)) from %DB_SCHEMA%.VIEW_SI_DW002_CLMPHYCOL"

REM db2 connect reset

copy /Y %OUTPUT_DIR%\%FILENAME%_HDR.tmp+%OUTPUT_DIR%\%FILENAME%_DTL.tmp+%OUTPUT_DIR%\%FILENAME%_TLR.tmp %OUTPUT_DIR%\%FILENAME%
del %OUTPUT_DIR%\*.tmp

:end
