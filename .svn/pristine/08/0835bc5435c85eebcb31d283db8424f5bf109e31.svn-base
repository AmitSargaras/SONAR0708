@echo off
SETLOCAL

echo [info] This transfers compiled EJBs from ejb\migrate\wls2was to ejb\websphere
echo [info] It will based on name in ejb\ejb_list.txt to pick up

if "%INTEGRO_HOME%" == "" (
	echo [error] Please assign value for INTEGRO_HOME variable.
	goto :end
)

if not exist %INTEGRO_HOME% (
	echo [warn] %INTEGRO_HOME% doesn't exists.
	goto :end
)

for /f %%i in ( %INTEGRO_HOME%\config\ejb\ejb_list.txt ) do (
	echo [info] Transferring %%i from ejb\migrate\wls2was\ to ejb\websphere\
	xcopy /s /y %INTEGRO_HOME%\config\ejb\migrate\wls2was\%%i %INTEGRO_HOME%\config\ejb\websphere\%%i
	echo [info] Transfered %%i from ejb\migrate\wls2was\ to ejb\websphere\
)

:end

ENDLOCAL