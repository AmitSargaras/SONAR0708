@echo off
SETLOCAL

REM -------------------------------------------------------------------------------------
REM Utility tool to check if ejbdeploy.bat is required to run for a EJB module.
REM 
REM The checking will be based on the \config\ejb\websphere\[ejb]\META-INF
REM 1. ejb-jar.xml
REM 2. backends\DB2UDBNT_V91_1\TopDown1.dbm (if there is EntityBean)
REM 3. all the class inside <ejb-class> in ejb-jar.xml
REM  - search through \build\classes
REM  - or timestamp of integrobase.jar or ofacomp.jar
REM 
REM Basically, if the files to be checked having timestamp of today, then ejbdeploy.bat
REM will be invoked. Afterwhich ejbdeploy.bat wont be taken place if it has run in one
REM of the sequence shown above.
REM 
REM This utility tool will invoke ejbdeploy.bat, so some environment variables are
REM required, as below:
REM 1. INTEGRO_HOME
REM 2. JAVA_HOME
REM 3. WAS_APP_HOME
REM -------------------------------------------------------------------------------------

for /F "usebackq tokens=1,5" %%i IN (`dir "%INTEGRO_HOME%\3rdpartylib\ofacomp.jar"`) do call :assigndate %%i %%j
for /F "usebackq tokens=1,5" %%i IN (`dir "%INTEGRO_HOME%\3rdpartylib\integrobase.jar"`) do call :assigndate %%i %%j
goto :continue

:assigndate
if "%2" == "integrobase.jar" set OFABASE_JAR_DATE=%1
if "%2" == "ofacomp.jar" set OFACOMP_JAR_DATE=%1
goto :end

:continue
for /F "tokens=2" %%i IN ("%DATE%") do set TODAY_DATE=%%i

echo [info] Timestamp: Today [%TODAY_DATE%]; ofacomp.jar [%OFACOMP_JAR_DATE%] integrobase.jar [%OFABASE_JAR_DATE%]

for /f %%i in ( %INTEGRO_HOME%\config\ejb\ejb_list.txt ) do call :checkrequired %%i
goto :end

:checkrequired
set EJB_NAME=%1
set HAS_RUN_EJBDEPLOY=false
echo [info] Requirement check on ejb [%EJB_NAME%]

if exist "%INTEGRO_HOME%\build\dist\Deployed_%EJB_NAME%.jar" goto :docheckrequired
echo [info] There is no Deployed_%EJB_NAME%.jar in %INTEGRO_HOME%\build\dist
echo [info] Proceed to do ejbdeploy on ejb [%EJB_NAME%]
goto :doejbdeploy

:docheckrequired
pushd %INTEGRO_HOME%\config\ejb\websphere\%EJB_NAME%\META-INF
if exist "%CD%\ejb-jar.xml" for /F "usebackq tokens=1,5" %%i IN (`dir "%CD%\ejb-jar.xml"`) do call :checkdescdate %%i %%j
if exist "%CD%\ibm-ejb-jar-ext.xml" for /F "usebackq tokens=1,5" %%i IN (`dir "%CD%\ibm-ejb-jar-ext.xml"`) do call :checkdescdate %%i %%j
if exist "%CD%\ibm-ejb-jar-bnd.xml" for /F "usebackq tokens=1,5" %%i IN (`dir "%CD%\ibm-ejb-jar-bnd.xml"`) do call :checkdescdate %%i %%j
if exist "%CD%\backends\DB2UDBNT_V91_1\TopDown1.dbm" for /F "usebackq tokens=1,5" %%i IN (`dir "%CD%\backends\DB2UDBNT_V91_1\TopDown1.dbm"`) do call :checkdescdate %%i %%j
goto :checkejbclass

:checkdescdate
if "%2" == "ejb-jar.xml" call :predoejbdeploy %1 %2
if "%2" == "ibm-ejb-jar-ext.xml" call :predoejbdeploy %1 %2
if "%2" == "ibm-ejb-jar-bnd.xml" call :predoejbdeploy %1 %2
if "%2" == "TopDown1.dbm" call :predoejbdeploy %1 %2
goto :end

:predoejbdeploy
if not "%1" == "%TODAY_DATE%" goto :end
echo [info] The file [%2] for ejb [%EJB_NAME%] is modified today
goto :doejbdeploy

:checkejbclass
findstr "ejb-class" %INTEGRO_HOME%\config\ejb\websphere\%EJB_NAME%\META-INF\ejb-jar.xml > ejb-class.txt
if not exist "ejb-class.txt" goto :end
for /F "tokens=3  delims=<>" %%i in (ejb-class.txt) do call :docheckejbclass %%i
goto :end

:docheckejbclass
set EJB_CLASS=%1
set EJB_CLASS=%EJB_CLASS:.=\%
if not exist "%INTEGRO_HOME%\build\classes\%EJB_CLASS%.class" goto :checkbasejar
for /F "usebackq tokens=1,5" %%i IN (`dir "%INTEGRO_HOME%\build\classes\%EJB_CLASS%.class"`) do call :checkclassdate %%i %%j
goto :end

:checkbasejar
"%JAVA_HOME%\bin\jar" -xf %INTEGRO_HOME%\3rdpartylib\integrobase.jar %EJB_CLASS%.class
if not exist "%EJB_CLASS%.class" goto :checkcompjar
if not "%OFABASE_JAR_DATE%" == "%TODAY_DATE%" goto :end
echo [info] The file [integrobase.jar] is modified today
goto :doejbdeploy

:checkcompjar
if not "%OFACOMP_JAR_DATE%" == "%TODAY_DATE%" goto :end
echo [info] The file [ofacomp.jar] is modified today
goto :doejbdeploy

:checkclassdate
set EJB_CLASS_DATE=%1
set EJB_CLASS_FLAT_NAME=%2
if "%EJB_CLASS_FLAT_NAME%" == "" goto :end
echo %EJB_CLASS%.class > ejb-class-name.txt
for /f "usebackq" %%i in (`findstr "%EJB_CLASS_FLAT_NAME%" "%CD%\ejb-class-name.txt"`) do call :docheckclassdate %%i
goto :end

:docheckclassdate
if not "%1" == "" (if not "%TODAY_DATE%" == "%EJB_CLASS_DATE%" goto :end)
echo [info] The file [%EJB_CLASS%.class] is modified today
goto :doejbdeploy

:doejbdeploy
if "%HAS_RUN_EJBDEPLOY%" == "false" goto :run-ws-ejbdeploy
echo [info] ejbdelpoy.bat has been invoked for ejb [%EJB_NAME%], this step will skip
goto :end

:run-ws-ejbdeploy 
call "%INTEGRO_HOME%\bin\websphere\ws_ejbdeploy.bat" %EJB_NAME% %INTEGRO_HOME%\build\dist -noexit
set HAS_RUN_EJBDEPLOY=true
goto :end

:end

if exist com rmdir /S/Q com
if exist ejb-class.txt del /Q ejb-class.txt
if exist ejb-class-name.txt del /Q ejb-class-name.txt
popd

ENDLOCAL