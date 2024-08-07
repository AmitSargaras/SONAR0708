@echo off
SETLOCAL
echo ------------------------------------------------------------------------
echo Starting Migrate EJB for all module listed in ejb_list.txt
echo.
echo JAVA_HOME to be used for the migration will be replaced by the 
echo WebSphere one, which is IBM JDK 5
echo ------------------------------------------------------------------------
pushd %INTEGRO_HOME%\config\ejb\migrate
for /f %%i in ( %INTEGRO_HOME%\config\ejb\ejb_list.txt ) do call migrate.cmd wls2was %%i -noexit
popd
endlocal
