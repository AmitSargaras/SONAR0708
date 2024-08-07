@echo off
SETLOCAL

REM ----------------------------------------------------------------------------------
REM Utility tools to invoke Weblogic's weblogic.appc class
REM 
REM It will take EJB descriptor files from \config\ejb\weblogic\[ejb]\META-INF
REM and start the weblogic.appc utility
REM
REM Following jar must be present in order the ejbdeploy.bat to take the .class
REM for deployment purpose.
REM 1. cms.jar (build from \build\classes)
REM 2. integrobase.jar (from \3rdpartylib)
REM 3. ofacomp.jar (from \3rdpartylib)
REM 4. MANIFEST.MF from \config (can be created by ant manifest task)
REM
REM Some environment variables required:
REM 1. INTEGRO_HOME
REM 2. WEBLOGIC_HOME (for the weblogic)
REM 3. JAVA_HOME (for the jar utility)
REM ----------------------------------------------------------------------------------

echo [info] --------------------------------------------------------------------------
echo [info] Weblogic EJB Deployment
echo [info] Must use Weblogic 8.1 to do this task.
echo [info] Please use IBM JDK 4 to run the EJB deployment.
echo [info] --------------------------------------------------------------------------

REM clear surrounding double quotes
FOR %%i IN (%WEBLOGIC_HOME%) DO SET WEBLOGIC_HOME=%%~i

if "%WEBLOGIC_HOME%" == "" (
	echo [error] Please specify WEBLOGIC_HOME variable for Weblogic Application Server
	echo [info] Example: C:\bea\weblogic81
	goto :end
)

if not defined JAVA_HOME (
	echo [error] Please specify JAVA_HOME variable for Jar Utitlity Usage.
	goto :end
)

if not exist "%INTEGRO_HOME%\config\ejb\weblogic\%1" (
	echo [error] EJB %1 doesn't exists in ["%INTEGRO_HOME%\config\ejb\weblogic"].
	goto :end
)

if "%~2" == "" (
	echo [error] Please specify the place holder for the wls_%1.jar.
	echo [info] Example: D:\dev\eon\cms\dev\wsjars
	goto :end
)

if not exist "%~2" (
	echo [error] Place holder for the wls_%1.jar doesn't exists.
	goto :end
)

SET PLACE_HOLDER=%~f2

if not exist "%INTEGRO_HOME%\build\dist\cms.jar" (
	echo [error] "%INTEGRO_HOME%\build\dist\cms.jar" is required for the EJB deployment, but doesn't exists
	goto :end
)

echo [info] --------------------------------------------------------------------------
echo [info] ******* Starting EJB Deployment [%1] ******
echo [info] --------------------------------------------------------------------------

pushd %INTEGRO_HOME%\config\ejb\weblogic\%1

For %%A in ("%INTEGRO_HOME%\3rdpartylib\spring*") do (
call set "WLSCPtemp=%%WLSCPtemp%%%%~fA;"
)

set WLSCP=%INTEGRO_HOME%\build\dist\cms.jar;%INTEGRO_HOME%\3rdpartylib\ofacomp.jar;%INTEGRO_HOME%\3rdpartylib\integrobase.jar;%INTEGRO_HOME%\3rdpartylib\spring.jar;%INTEGRO_HOME%\3rdpartylib\uiinfrabase.jar;%WLSCPtemp%

REM prepare EJB descriptor holder for eclipse projects
REM clear any temp folder created before
echo [info] Copying [%CD%\META-INF] to [%CD%\temp] without those '/.svn/'
if exist temp rmdir /S/Q temp
mkdir temp\META-INF
xcopy META-INF\*.xml temp\META-INF /A /S >NUL
copy %INTEGRO_HOME%\config\MANIFEST.MF temp >NUL
cd temp

REM preparing jar with EJB descriptor files
"%JAVA_HOME%\bin\jar" -cfm ejb_%1.jar .\MANIFEST.MF META-INF

%JAVA_HOME%\bin\java.exe -Xmx1024m -cp %WEBLOGIC_HOME%\server\lib\weblogic.jar;%WLSCP% weblogic.appc -compiler %JAVA_HOME%\bin\javac.exe -output wls_%1.jar ejb_%1.jar

echo [info] Copying [%CD%\wls_%1.jar] to [%PLACE_HOLDER%]
copy wls_%1.jar %PLACE_HOLDER% >NUL

REM clear EJB descriptor holder folders
cd ..
if exist temp rmdir /S/Q temp

popd

echo [info] --------------------------------------------------------------------------
echo [info] ******* COMPLETED EJB Deployment [%1] ******
echo [info] --------------------------------------------------------------------------

:end

if "%3" == "-noexit" (
	echo [info] Weblogic EJB deployment Batch Program window stay
) else (
	pause
	exit
)

ENDLOCAL