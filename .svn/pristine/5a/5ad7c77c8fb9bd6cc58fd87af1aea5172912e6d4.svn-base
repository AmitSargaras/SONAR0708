@echo off
SETLOCAL

REM -----------------------------------------------------------------
REM Utility Tool to migrate the EJB descriptor files
REM 
REM ie, ejb-jar.xml, weblogic-jar.xml, weblogic-cmp-rdbms-jar.xml
REM from Weblogic (8.1) specific to Websphere (6.1) one
REM
REM Websphere specific files:
REM 1. ejb-jar.xml, with '@id'
REM 2. ibm-ejb-jar-bnd.xml, for the JNDI name
REM 3. ibm-ejb-jar-ext.xml, for the access intents
REM 4. Map.mapxmi, mapping between ejb-jar.xml and TopDown1.dbm
REM 5. TopDown1.dbm, the table, column and constraints
REM 
REM Note: For the DB mapping, will be using 'DB2UDB_V91' for vendor
REM Note: Weblogic specific files will be copied to current directory
REM So, don't run concurrently, or mess around the files.
REM
REM How to run:
REM run [ejb-folder-name-of-weblogic]
REM example: run checklist
REM This will migrate \config\ejb\weblogic\checklist
REM Result will be stored in current directory as 'checklist'
REM
REM Environment variable required:
REM 1. WAS_APP_HOME, for the websphere ejbdeploy.bat and java
REM 2. INTEGRO_HOME, for the classes
REM
REM Files required: (for classpath)
REM 1. \build\dist\cms.jar
REM 2. \3rdpartylib\ofacomp.jar
REM 3. \3rdpartylib\integrobase.jar
REM -----------------------------------------------------------------

FOR %%i IN (%WAS_APP_HOME%) DO SET WAS_APP_HOME=%%~i

REM SET WAS_APP_HOME=d:\ibm\WebSphere\AppServer
if "%WAS_APP_HOME%" == "" (
	echo [error] 'WAS_APP_HOME' environment variable is not set
	goto :end
)

if "%INTEGRO_HOME%" == "" (
	echo [error] 'INTEGRO_HOME' environment variable is not set
	goto :end
)

if "%1" == "" (
	echo [error] EJB folder name is not provided
	echo [info] It has to be one of the following: 
	for /f "usebackq" %%i in (`dir /b "%INTEGRO_HOME%\config\ejb\weblogic"`) do echo %%i
	goto :end
)

if not exist "%INTEGRO_HOME%\config\ejb\weblogic\%1\META-INF" (
	echo [error] The folder for EJB descriptor does not exist
	echo [error] Which is ["%INTEGRO_HOME%\config\ejb\weblogic\%1\META-INF"]
	echo [info] It has to be one of the following: 
	for /f "usebackq" %%i in (`dir /b "%INTEGRO_HOME%\config\ejb\weblogic"`) do echo %%i
	goto :end
)


SET EJB_FOLDER_NAME=%1
SET EJB_FULL_PATH=%INTEGRO_HOME%\config\ejb\weblogic\%EJB_FOLDER_NAME%
SET JAVA_HOME=%WAS_APP_HOME%\java
SET WASCP=%INTEGRO_HOME%\build\dist\cms.jar;%INTEGRO_HOME%\3rdpartylib\ofacomp.jar;%INTEGRO_HOME%\3rdpartylib\integrobase.jar

REM If different backend database is used, change below
REM Consult WAS ejbdeploy.bat spec for more information.
REM SET DB_VENDOR=DB2UDB_V91
REM SET BACKENDS_ID=DB2UDBNT_V91_1

SET DB_VENDOR=ORACLE_V11G
SET BACKENDS_ID=ORACLE_V11_1

echo -----------------------------------------------------------------------------
echo [info] Migrating Weblogic 8.1 EJB descriptor to WebSphere 6.1 EJB Descriptor
echo [info] Weblogic EJB descriptor files found in [%EJB_FULL_PATH%]
echo [info] Running migrator in [%CD%]
echo -----------------------------------------------------------------------------
echo.

REM prepare ejb-jar.xml (with id, and ejb-ql modified), and ibm-ejb-jar-bnd.xmi and ibm-ejb-jar-ext.xmi, 
REM need original ejb-jar.xml and weblogic-ejb-jar.xml
echo [info] Copying files below into current directory
for /f "usebackq" %%i in (`dir /b %EJB_FULL_PATH%\META-INF\*.xml`) do echo [info] - %%i
copy %EJB_FULL_PATH%\META-INF\*.xml . >NUL

echo [info] Generating IBM compliance ejb-jar.xml
"%JAVA_HOME%\bin\java" -jar ..\saxon9.jar -strip:all -versionmsg:off -s:ejb-jar.xml -xsl:ejbjar2ibmejbjar.xslt -o:ibm-ejb-jar.xml
del /Q ejb-jar.xml
ren ibm-ejb-jar.xml ejb-jar.xml

echo [info] Generating IBM EJB binding file, ibm-ejb-jar-bnd.xmi
"%JAVA_HOME%\bin\java" -jar ..\saxon9.jar -strip:all -versionmsg:off -s:ejb-jar.xml -xsl:ejbjar2ibmbnd.xslt -o:ibm-ejb-jar-bnd.xmi

echo [info] Generating IBM EJB extension file, ibm-ejb-jar-ext.xmi
"%JAVA_HOME%\bin\java" -jar ..\saxon9.jar -strip:all -versionmsg:off -s:ejb-jar.xml -xsl:ejbjar2ibmext.xslt -o:ibm-ejb-jar-ext.xmi

echo [info] Creating 'META-INF' for files ejb-jar.xml, ibm-ejb-jar-bnd.xmi, ibm-ejb-jar-ext.xmi, for ejbdeploy purpose
mkdir META-INF
copy ejb-jar.xml META-INF >NUL
copy ibm-ejb-jar-bnd.xmi META-INF >NUL
copy ibm-ejb-jar-ext.xmi META-INF >NUL

REM Top down approach to create Map.mapxmi and TopDown1.dbm (if there is Entity Bean)
REM Need WAS ejbdeploy command and jar program
REM afterwhich extract out the META-INF folder
echo [info] Running WebSphere ejbdeploy tool...
"%JAVA_HOME%\bin\jar" -cf ejb_%EJB_FOLDER_NAME%.jar META-INF
call "%WAS_APP_HOME%\bin\ejbdeploy.bat" ejb_%EJB_FOLDER_NAME%.jar . was_%EJB_FOLDER_NAME%.jar -cp %WASCP% -codegen -dbvendor %DB_VENDOR% -quiet -noinform > ejb_output.log
for /f "usebackq" %%i IN (`findstr /R /C:"Errors, [0123456789]* Warnings" %CD%\ejb_output.log`) do call :docheckejb %%i
goto :end

:docheckejb
if "%1" == "0" goto :continue
echo [error] There are '%1' error(s) when running ejbdeploy.bat, output as below:
echo ==================================================================================================================
type ejb_output.log
echo ==================================================================================================================

REM cleaup any files left.
del /Q ejb_output.log
del /Q ejb-jar.xml ibm-ejb-jar-bnd.xmi ibm-ejb-jar-ext.xmi weblogic-ejb-jar.xml weblogic-cmp-rdbms-jar.xml ejb_%EJB_FOLDER_NAME%.jar
rmdir /S/Q META-INF
for /f "usebackq" %%j in (`dir /b /ad-h "%CD%"`) do rmdir /S/Q %%j

goto :end

:continue
del /Q ejb_output.log
"%JAVA_HOME%\bin\jar" -xf was_%EJB_FOLDER_NAME%.jar META-INF
del /Q was_%EJB_FOLDER_NAME%.jar

if not exist META-INF\backends\%BACKENDS_ID% goto :nocmp

REM Modify TopDown1.dbm to use correct table and column name, 
REM Afterwhich correct TopDown1.dbm for the relationship
REM need ejb-jar.xml, weblogic-cmp-rdbms-jar.xml and Map.mapxmi
move /Y META-INF\backends\%BACKENDS_ID%\Map.mapxmi .
move /Y META-INF\backends\%BACKENDS_ID%\TopDown1.dbm .
move /Y META-INF\ejb-jar.xml .
move /Y META-INF\ibm-ejb-jar-bnd.xmi .
move /Y META-INF\ibm-ejb-jar-ext.xmi .
rmdir /S/Q META-INF

echo [info] Modifying TopDown1.dbm, fix column name and constraints
"%JAVA_HOME%\bin\java" -jar ..\saxon9.jar -strip:all -versionmsg:off -s:TopDown1.dbm -xsl:fixdbm.xslt -o:TopDown2.dbm
"%JAVA_HOME%\bin\java" -jar ..\saxon9.jar -strip:all -versionmsg:off -s:TopDown2.dbm -xsl:fixdbm_constraints.xslt -o:TopDown3.dbm

del /Q TopDown1.dbm
del /Q TopDown2.dbm
ren TopDown3.dbm TopDown1.dbm

REM create a %EJB_FOLDER_NAME%\META-INF folder

mkdir %EJB_FOLDER_NAME%\META-INF\backends\%BACKENDS_ID%
move /Y TopDown1.dbm %EJB_FOLDER_NAME%\META-INF\backends\%BACKENDS_ID%\
move /Y Map.mapxmi %EJB_FOLDER_NAME%\META-INF\backends\%BACKENDS_ID%\
move /Y ejb-jar.xml %EJB_FOLDER_NAME%\META-INF\
move /Y ibm-ejb-jar-bnd.xmi %EJB_FOLDER_NAME%\META-INF\
move /Y ibm-ejb-jar-ext.xmi %EJB_FOLDER_NAME%\META-INF\
goto :cleanup

:nocmp
mkdir %EJB_FOLDER_NAME%\META-INF
move /Y ejb-jar.xml %EJB_FOLDER_NAME%\META-INF\
move /Y ibm-ejb-jar-bnd.xmi %EJB_FOLDER_NAME%\META-INF\
move /Y ibm-ejb-jar-ext.xmi %EJB_FOLDER_NAME%\META-INF\
rmdir /S/Q META-INF

:cleanup
del /Q weblogic-ejb-jar.xml weblogic-cmp-rdbms-jar.xml
del /Q ejb_%EJB_FOLDER_NAME%.jar

echo [info] Success! The migrated result can be found in [%CD%\%EJB_FOLDER_NAME%]

:end
ENDLOCAL