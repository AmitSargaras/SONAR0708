@echo off
set DEV_BIN=%INTEGRO_HOME%\bin
call %DEV_BIN%\setenv.cmd
call %DEV_BIN%\setlocalenv.cmd

set MSG_DIR=%INTEGRO_HOME%\config\test\simessage\ccrd

rem ----------- START SEMA CA002 -------------
call ..\set_si_env.cmd %MSG_DIR%\CCCMSOU

IF EXIST "%FILE_PATH%.ht" (
call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 70,19
)

IF NOT "%IS_PROCEED%"=="true" (
    echo [Info] -- Exit SEMA CA002 Batch Job ! --
	goto end
)
rem ----------- END SEMA CA002 ---------------

"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient semaFacilityLoaderBatchJob

:end
