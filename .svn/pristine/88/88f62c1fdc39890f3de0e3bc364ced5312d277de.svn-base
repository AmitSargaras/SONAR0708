@echo off
set DEV_BIN=C:\dev\eoncms\trunk\bin
call %DEV_BIN%\setenv.cmd
call %DEV_BIN%\setlocalenv.cmd

set MSG_DIR=C:\dev\eoncms\trunk\config\test\simessage\mimb

rem ----------- START MIMB CU002 -------------
call ..\set_si_env.cmd %MSG_DIR%\CU002MIM csv
rem ----------- END MIMB CU002 ---------------

rem ----------- START MIMB CA003 -------------
call ..\set_si_env.cmd %MSG_DIR%\CA003MIM csv
IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 8 9 10:11
)
rem ----------- END MIMB CA003 ---------------

rem ----------- START MIMB CO003 -------------
call ..\set_si_env.cmd %MSG_DIR%\CO003MIM csv
IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 24
)
rem ----------- END MIMB CO003 ---------------

rem ----------- START MIMB CO004 -------------
call ..\set_si_env.cmd %MSG_DIR%\CO004MIM csv
IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 18
)
rem ----------- END MIMB CO004 ---------------

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCustomerInfoLoaderBatchJob
"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbLimitInfoLoaderBatchJob
"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCollateralMarketableSecLoaderBatchJob
"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient mimbCollateralCashFileBatchJob

:end