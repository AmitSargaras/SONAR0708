@echo off

set PROGRAM_HOME=F:\development\eon\eoncms\mock\simulator
set JAVA_HOME=C:\bea\jdk150_12

set PROGRAM_CLASSPATH=%PROGRAM_HOME%\config
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\TCPSimulator.jar
set PROGRAM_CLASSPATH=%PROGRAM_CLASSPATH%;%PROGRAM_HOME%\lib\jdom.jar
set EXTRA_PROP1=-Djavax.net.ssl.keyStore=%PROGRAM_HOME%\config\mySrvKeystore
set EXTRA_PROP2=-Djavax.net.ssl.keyStorePassword=123456

set JAVA_OPTIONS=%JAVA_OPTIONS% %EXTRA_PROP1% %EXTRA_PROP2%

@echo on

call ant deploy

%JAVA_HOME%\bin\java %JAVA_OPTIONS% -classpath %PROGRAM_CLASSPATH% com.integrosys.sml.los.host.tcp.TCPSSLServer 9002

