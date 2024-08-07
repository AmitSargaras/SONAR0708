@echo off
SETLOCAL

echo [info] This routine EJB compile all the modules in %INTEGRO_HOME%\config\ejb\websphere
echo [info] It will based on name in %INTEGRO_HOME%\config\ejb\ejb_list.txt to pick up
echo [info] which EJB to be compiled.

if "%INTEGRO_HOME%" == "" (
	echo [error] Please assign value for INTEGRO_HOME variable.
	goto :end
)

if not exist %INTEGRO_HOME% (
	echo [warn] %INTEGRO_HOME% doesn't exists.
	goto :end
)

for /f %%i in ( %INTEGRO_HOME%\config\ejb\ejb_list.txt ) do call %INTEGRO_HOME%\bin\websphere\ws_ejbdeploy.bat %%i %INTEGRO_HOME%\build\dist -noexit

:end

ENDLOCAL