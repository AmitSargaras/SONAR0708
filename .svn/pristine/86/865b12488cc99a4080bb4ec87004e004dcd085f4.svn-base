@echo off
:BEGIN
set PROGRAM_HOME=D:\dev\abcms\branches\CLIMS_P3\mock\simulator

set ANT_HOME=C:\Progra~1\apache-ant-1.8.1
set JAVA_HOME=C:\Progra~1\Java\jdk1.5.0_01

rem set JAVA_HOME=C:\bea\jdk142_08

set PATH=%CLASSPATH%;%ANT_HOME%\bin

call ant deploy

if ERRORLEVEL 1 goto error

if NOT ERRORLEVEL 1 goto success

:success
set PROGRAM_CLASSPATH=%PROGRAM_HOME%\config
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\TCPSimulator.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\integrobase.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\castor.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\com.ibm.mq.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\com.ibm.mqjms.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jms.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\spring-jms-2.5.6.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\com.ibm.mq.jmqi.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\dhbcore.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jta.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\log4j.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\spring.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jcl-over-slf4j.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\slf4j-api.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\slf4j-log4j12.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jdom.jar

@echo on

%JAVA_HOME%\bin\java -classpath %PROGRAM_CLASSPATH% com.integrosys.simulator.host.mq.MQMessageCenter

:error
ECHO Build Unsuccessful!!!Please Configure the XML and OB Correctly!!!
goto end
:END
pause
