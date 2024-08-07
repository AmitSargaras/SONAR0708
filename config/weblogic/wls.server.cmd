@ECHO OFF

@REM WARNING: This file is created by the Configuration Wizard.
@REM Any changes to this script may be lost when adding extensions to this configuration.

SETLOCAL

@REM *************************************************************************
@REM This script is used to start WebLogic Server for the domain in the
@REM current working directory.  This script simply sets the SERVER_NAME
@REM variable and starts server.
@REM 
@REM To create your own start script for your domain, all you need to set is
@REM SERVER_NAME, then starts the server.
@REM 
@REM Other variables that startWLS takes are:
@REM 
@REM WLS_USER     - cleartext user for server startup
@REM WLS_PW       - cleartext password for server startup
@REM PRODUCTION_MODE    - true for production mode servers, false for
@REM                development mode
@REM JAVA_OPTIONS - Java command-line options for running the server. (These
@REM                will be tagged on to the end of the JAVA_VM and MEM_ARGS)
@REM JAVA_VM      - The java arg specifying the VM to run.  (i.e. -server,
@REM                -hotspot, etc.)
@REM MEM_ARGS     - The variable to override the standard memory arguments
@REM                passed to java
@REM 
@REM For additional information, refer to the WebLogic Server Administration
@REM Console Online Help(http:\\e-docs.bea.com\wls\docs81\ConsoleHelp\startstop.html)
@REM *************************************************************************

@REM Initialize the common environment.

set WL_HOME=%WEBLOGIC_HOME%
for %%i in ("%WL_HOME%") do set WL_HOME=%%~fsi

set PRODUCTION_MODE=

set JAVA_VENDOR=Sun

set JAVA_HOME=%JAVA_HOME%
for %%i in ("%JAVA_HOME%") do set JAVA_HOME=%%~fsi

@REM Call commEnv here AFTER setting the java_vendor to get common environmental settings.

call "%WL_HOME%\common\bin\commEnv.cmd"

@REM Set SERVER_NAME to the name of the server you wish to start up.

set SERVER_NAME=myserver

set CLASSPATH=%WEBLOGIC_CLASSPATH%;%JAVA_HOME%\jre\lib\rt.jar;%WL_HOME%\server\lib\webservices.jar

@REM Call WebLogic Server

echo.
rem echo CLASSPATH=%CLASSPATH%
echo.
rem echo PATH=%PATH%
echo .
echo ***************************************************
echo *  To start WebLogic Server, use a username and   *
echo *  password assigned to an admin-level user.  For *
echo *  server administration, use the WebLogic Server *
echo *  console at http:\\[hostname]:[port]\console    *
echo ***************************************************

set DEBUG_OPTION=-Xint -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=7008

set JAVA_OPTIONS=%JAVA_OPTIONS% %DEBUG_OPTION%

start "DEV - EON Bank CMS Project" %JAVA_HOME%\bin\java %JAVA_VM% %MEM_ARGS% %JAVA_OPTIONS% -Dweblogic.Name=%SERVER_NAME% -Dweblogic.ProductionModeEnabled=%PRODUCTION_MODE% -Djava.security.policy="%WL_HOME%\server\lib\weblogic.policy" weblogic.Server


ENDLOCAL