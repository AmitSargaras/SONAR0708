call ..\..\setlocalenv.cmd

set PATH=%INTEGRO_HOME%\bin;%ANT_HOME%\bin;%PATH%;

call ..\..\setenv.cmd

rem echo %CLASSPATH%

%JAVA_HOME%\bin\java %PROPERTY_FILE_OPTIONS% com.integrosys.cms.ui.eventmonitor.EventMonitorClient valuationBatchJob country=SG sectype=AB