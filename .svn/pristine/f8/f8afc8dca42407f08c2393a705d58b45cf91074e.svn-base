@echo off

SETLOCAL

REM ------------------------------------------------------------------------
REM This routine is to update cms.ear to use the correct properties
REM for example, update 
REM		logging.xml into cms.ear!/properties.jar!/logging.xml
REM		web.xml into cms.ear!/cms.war!/WEB-INF/web.xml
REM 
REM Useful when there is multiple environment, and we kept all these files in 
REM one place only
REM 
REM One file which is the meta info for the update is required
REM format as below
REM [file_name];[jar_file_in_cms.ear];[location_in_jar_file]
REM 
REM for example for above
REM 	logging.xml;properties.jar;.\
REM		web.xml;cms.war;.\WEB-INF
REM
REM Required environment variable:
REM 1. JAVA_HOME (for jar command)
REM 2. INTEGRO_HOME
REM 3. EAR_UPDATE_INFO_DIR (for update.info the meta info file)
REM ------------------------------------------------------------------------

if "%EAR_UPDATE_INFO_DIR%" == "" (
	echo [error] Please define EAR_UPDATE_INFO_DIR variable for grabbing 'update.info'.
	echo [info] Example 1: d:\dev\eon\cms\dev\config\websphere\bank
	echo [info] Example 2: d:\dev\eon\cms\dev\config\websphere\bank\prod
	goto :end
)

if not exist %EAR_UPDATE_INFO_DIR% (
	echo [error] %EAR_UPDATE_INFO_DIR% doesn't exist for update.info, please provide.
	goto :end
)

if not exist %INTEGRO_HOME%\build\dist\cms.ear (
	echo [error] cms.ear doesn't exist in %INTEGRO_HOME%\build\dist, please provide.
	goto :end
)

if not exist %EAR_UPDATE_INFO_DIR%\update.info (
	echo [error] %EAR_UPDATE_INFO_DIR%\update.info doesn't exist, please provide.
	goto :end
)

for /F "tokens=1,2,3 delims=;" %%i in (%EAR_UPDATE_INFO_DIR%\update.info) do call :doupdate %%i %%j %%k
goto :end

:doupdate
SET FILE=%1
SET JAR_FILE=%2
SET LOCATION=%3

echo [info] Update [%FILE%] into [%JAR_FILE%] at [%LOCATION%]

IF NOT EXIST %EAR_UPDATE_INFO_DIR%\%FILE% (
	echo [error] %FILE% not found in [%EAR_UPDATE_INFO_DIR%]
	goto :end
)

%JAVA_HOME%\bin\jar -xf cms.ear %JAR_FILE%

IF NOT EXIST %JAR_FILE% (
	echo [error] %JAR_FILE% not found in [cms.ear].
	goto :end
)

IF "%LOCATION%" == ".\" (
	copy %EAR_UPDATE_INFO_DIR%\%FILE% .\
	%JAVA_HOME%\bin\jar -uf %JAR_FILE% %FILE%
	del /Q .\%FILE%
) ELSE (
	mkdir %LOCATION%
	copy %EAR_UPDATE_INFO_DIR%\%FILE% %LOCATION%
	%JAVA_HOME%\bin\jar -uf %JAR_FILE% %LOCATION%
	rmdir %LOCATION% /S /Q
)

%JAVA_HOME%\bin\jar -uf cms.ear %JAR_FILE%
del %JAR_FILE%

:end

ENDLOCAL
