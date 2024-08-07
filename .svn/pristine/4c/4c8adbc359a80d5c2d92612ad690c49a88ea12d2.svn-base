@echo off
SETLOCAL

echo [info] Update %INTEGRO_HOME%\config\ejb\ejb_list.txt list based on param

if "%INTEGRO_HOME%" == "" (
	echo [error] Please assign value for INTEGRO_HOME variable.
	goto :end
)

if not exist %INTEGRO_HOME% (
	echo [warn] %INTEGRO_HOME% doesn't exists.
	goto :end
)
echo. > %INTEGRO_HOME%\config\ejb\ejb_list.txt
for %%a in (%ejb_list%) do (
echo %%a >> %INTEGRO_HOME%\config\ejb\ejb_list.txt
)


:end

ENDLOCAL