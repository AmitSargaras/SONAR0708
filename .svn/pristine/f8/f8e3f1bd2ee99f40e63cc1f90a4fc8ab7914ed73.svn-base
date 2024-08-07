@echo off
set DEV_BIN=C:\dev\eoncms\trunk\bin
call %DEV_BIN%\setenv.cmd
call %DEV_BIN%\setlocalenv.cmd

set MSG_DIR=C:\dev\eoncms\trunk\config\test\simessage\mimb

rem ----------- START MIMB PF002 -------------
call ..\set_si_env.cmd %MSG_DIR%\PF002MIM csv
rem ----------- END MIMB PF002 ---------------

"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient stockPriceFileLoaderBatchJob

:end