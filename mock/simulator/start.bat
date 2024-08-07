@echo off
:BEGIN
set PROGRAM_HOME=F:\development\eon\eoncms\mock\simulator

set ANT_HOME=F:\Programs\apache-ant-1.7.1
set JAVA_HOME=C:\bea\jdk150_12

set PATH=%CLASSPATH%;%ANT_HOME%\bin

call ant deploy

if ERRORLEVEL 1 goto error

if NOT ERRORLEVEL 1 goto success

:success
set PROGRAM_CLASSPATH=%PROGRAM_HOME%\config
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\TCPSimulator.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\integrobase.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jdom.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\bcel.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\jibx-bind.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\jibx-extras.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\jibx-run.jar

set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\qdox-1.6.1.jar

set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\stax-api.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\wstx-asl.jar

set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\xmlpull_1_1_4.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jibx\xpp3.jar
@echo on

%JAVA_HOME%\bin\java -classpath %PROGRAM_CLASSPATH% com.integrosys.simulator.host.tcp.TCPServer 9001

:error
ECHO Build Unsuccessful!!!Please Configure the XML and OB Correctly!!!
goto end
:END
pause
