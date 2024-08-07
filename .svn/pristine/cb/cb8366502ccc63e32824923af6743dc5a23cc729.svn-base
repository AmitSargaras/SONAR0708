@echo off
SETLOCAL

REM ----------------------------------------------------------------------------------
REM Utility tools to invoke websphere ejbdeploy.bat
REM 
REM It will take EJB descriptor files from \config\ejb\websphere\[ejb]\META-INF
REM and start the ejbdeploy.bat utility
REM
REM * Make sure the EJB descriptor files get migrated from weblogic one if there is
REM   any changes, see \config\ejb\migrate
REM 
REM Following jar must be present in order the ejbdeploy.bat to take the .class
REM for deployment purpose.
REM 1. cms.jar (build from \build\classes)
REM 2. integrobase.jar (from \3rdpartylib)
REM 3. ofacomp.jar (from \3rdpartylib)
REM
REM Some environment variables required:
REM 1. INTEGRO_HOME
REM 2. WAS_APP_HOME (for the websphere)
REM 3. JAVA_HOME (for the jar utility)
REM ----------------------------------------------------------------------------------

echo [info] --------------------------------------------------------------------------
echo [info] WebSphere EJB Deployment
echo [info] Must use WebSphere 6.1 ejbdeploy.bat to do this task.
echo [info] Please use IBM JDK 5 and above to run the EJB deployment.
echo [info] --------------------------------------------------------------------------

REM clear surrounding double quotes
FOR %%i IN (%WAS_APP_HOME%) DO SET WAS_APP_HOME=%%~i

if "%WAS_APP_HOME%" == "" (
	echo [error] Please specify WAS_APP_HOME variable for WebSphere's AppServer folder
	echo [info] Example: D:\ibm\WebSphere\AppServer
	goto :end
)

if not defined JAVA_HOME (
	echo [error] Please specify JAVA_HOME variable for Jar Utitlity Usage.
	goto :end
)

if not exist "%INTEGRO_HOME%\config\ejb\websphere\%1" (
	echo [error] EJB %1 doesn't exists in [%INTEGRO_HOME%\config\ejb\websphere].
	goto :end
)

if not exist "%WAS_APP_HOME%\bin\ejbdeploy.bat" (
	echo [error] [ejbdeploy.bat] doesn't exists in "%WAS_APP_HOME%\bin".
	goto :end
)

if "%~2" == "" (
	echo [error] Please specify the place holder for the Deployed_%1.jar.
	echo [info] Example: D:\dev\eon\cms\dev\wsjars
	goto :end
)

if not exist "%~2" (
	echo [error] Place holder for the Deployed_%1.jar doesn't exists.
	goto :end
)

if not exist "%INTEGRO_HOME%\build\dist\cms.jar" (
	echo [error] %INTEGRO_HOME%\build\dist\cms.jar is required for the EJB deployment, but doesn't exists
	goto :end
)

SET EJB_NAME=%1
SET DEST=%2
SET IS_NO_EXIT=%3

echo [info] --------------------------------------------------------------------------
echo [info] ******* Starting EJB Deployment [%EJB_NAME%] ******
echo [info] --------------------------------------------------------------------------

pushd %INTEGRO_HOME%\config\ejb\websphere\%EJB_NAME%

set WASCP=%INTEGRO_HOME%\build\dist\cms.jar;%INTEGRO_HOME%\3rdpartylib\ofacomp.jar;%INTEGRO_HOME%\3rdpartylib\integrobase.jar

REM prepare EJB descriptor holder for eclipse projects
REM clear any temp folder created before
echo [info] Copying [%CD%\META-INF] to [%CD%\temp] without those '/.svn/'
if exist temp rmdir /S/Q temp
mkdir temp\META-INF
xcopy META-INF temp\META-INF /A /S >NUL
cd temp

REM preparing jar with EJB descriptor files
"%JAVA_HOME%\bin\jar" -cf ejb_%EJB_NAME%.jar META-INF

REM call actual process
call "%WAS_APP_HOME%\bin\ejbdeploy.bat" ejb_%EJB_NAME%.jar . Deployed_%EJB_NAME%.jar -cp %WASCP% -noinform > ejb_output.log
for /f "usebackq" %%i IN (`findstr /R /C:"Errors, [0123456789]* Warnings" %CD%\ejb_output.log`) do call :docheckejb %%i
goto :end

:docheckejb
if "%1" == "0" goto :continue
echo [error] There are '%1' error(s) when running ejbdeploy.bat, output as below:
echo ==================================================================================================================
type ejb_output.log
echo ==================================================================================================================

REM clean up any files left
del /Q ejb_output.log
cd ..
rmdir /S/Q temp
goto :end

:continue
del /Q ejb_output.log
echo [info] Copying [%CD%\Deployed_%EJB_NAME%.jar] to [%DEST%]
copy Deployed_%EJB_NAME%.jar %DEST% >NUL

REM clear EJB descriptor holder folders
cd ..
if exist temp rmdir /S/Q temp

popd

echo [info] --------------------------------------------------------------------------
echo [info] ******* COMPLETED EJB Deployment [%EJB_NAME%] ******
echo [info] --------------------------------------------------------------------------

:end

if "%IS_NO_EXIT%" == "-noexit" (
	echo [info] Websphere EJB deployment Batch Program window stay
) else (
	pause
	exit
)

ENDLOCAL