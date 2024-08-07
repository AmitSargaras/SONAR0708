@echo off
set DEV_BIN=%INTEGRO_HOME%\bin
call %DEV_BIN%\setenv.cmd
call %DEV_BIN%\setlocalenv.cmd


"%JAVA_HOME%/bin/java" -ms128m -mx640m -classpath %CLASSPATH% com.integrosys.cms.ui.eventmonitor.EventMonitorClient StpRefireLosRejectedFacilityBatchJob

:end