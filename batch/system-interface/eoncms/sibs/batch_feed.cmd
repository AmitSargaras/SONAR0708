@echo off
set DEV_BIN=%INTEGRO_HOME%\bin
call %DEV_BIN%\setenv.cmd
call %DEV_BIN%\setlocalenv.cmd

set MSG_DIR=%INTEGRO_HOME%\config\test\simessage\sibs

rem ----------- START SIBS CU003 -------------
call ..\set_si_env.cmd %MSG_DIR%\CU003SIBS
set IS_PROCEED_CU003=%IS_PROCEED%
rem ----------- END SIBS CU003 ---------------

rem ----------- START SIBS CU001 -------------
call ..\set_si_env.cmd %MSG_DIR%\CU001SIBS
set IS_PROCEED_CU001=%IS_PROCEED%
rem ----------- END SIBS CU001 ---------------

rem ----------- START SIBS CA001 -------------
call ..\set_si_env.cmd %MSG_DIR%\CA001SIBS

IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 129,17 146,18
)
set IS_PROCEED_CA001=%IS_PROCEED%
rem ----------- END SIBS CA001 ---------------

rem ----------- START SIBS CA004 -------------
call ..\set_si_env.cmd %MSG_DIR%\CA004SIBS
set IS_PROCEED_CA004=%IS_PROCEED%
rem ----------- END SIBS CA004 ---------------

rem ----------- START SIBS CO001 -------------
call ..\set_si_env.cmd %MSG_DIR%\CO001SIBS

IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 40,19 63,17
)
set IS_PROCEED_CO001=%IS_PROCEED%
rem ----------- END SIBS CO001 ---------------

rem ----------- START SIBS CO002 -------------
call ..\set_si_env.cmd %MSG_DIR%\CO002SIBS

IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 2,19 91,17
)
set IS_PROCEED_CO002=%IS_PROCEED%
rem ----------- END SIBS CO002 ---------------

rem ---------------------------------------------------------------------------------------------------------

echo [Info] -- Process SIBS CU003 Batch Job ?? -- "%IS_PROCEED_CU003%"
echo [Info] -- Process SIBS CU001 Batch Job ?? -- "%IS_PROCEED_CU001%"
echo [Info] -- Process SIBS CA001 Batch Job ?? -- "%IS_PROCEED_CA001%"
echo [Info] -- Process SIBS CA004 Batch Job ?? -- "%IS_PROCEED_CA004%"
echo [Info] -- Process SIBS CO001 Batch Job ?? -- "%IS_PROCEED_CO001%"
echo [Info] -- Process SIBS CO002 Batch Job ?? -- "%IS_PROCEED_CO002%"

IF NOT "%IS_PROCEED_CU003%"=="true" (
    echo [Info] -- Exit SIBS CU003 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CU003 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsCustomerFusinFeedsLoaderBatchJob
)

IF NOT "%IS_PROCEED_CU001%"=="true" (
    echo [Info] -- Exit SIBS CU001 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CU001 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsCustomerUpdateFeedsLoaderBatchJob
)

IF NOT "%IS_PROCEED_CA001%"=="true" (
    echo [Info] -- Exit SIBS CA001 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CA001 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsOverdrafAndTermLoanFeedsLoaderBatchJob
)

IF NOT "%IS_PROCEED_CA004%"=="true" (
    echo [Info] -- Exit SIBS CA004 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CA004 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsClosedAndNplAccountFeedsLoaderBatchJob
)

IF NOT "%IS_PROCEED_CO001%"=="true" (
    echo [Info] -- Exit SIBS CO001 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CO001 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsFixedDepositFeedsLoaderBatchJob
)

IF NOT "%IS_PROCEED_CO002%"=="true" (
    echo [Info] -- Exit SIBS CO002 Batch Job ! --
) ELSE (
    echo [Info] -- Process SIBS CO002 Batch Job ! --
    "%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient sibsShareMarginFinanceFeedsLoaderBatchJob
)

:end