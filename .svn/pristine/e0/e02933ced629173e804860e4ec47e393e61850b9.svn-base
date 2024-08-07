@echo off

SETLOCAL

REM ---------------------------------------------------------------
REM Gateway between the actual migration and caller for EJB.
REM 
REM Create a task folder at current directory, then create
REM a 'run.cmd' which accept only one argument which
REM shall be one of the folder name in \config\ejb\[server]\
REM 
REM Working directory will be in the 'task' folder, so the
REM actual migration can do like copy the descriptor from
REM the specific EJB folder to itself and start running.
REM
REM 2 Arguments needed:
REM 1. Task name (one of the folder at current directory)
REM 2. EJB folder name (one of the folder in \config\ejb\[server]\
REM
REM How to run:
REM migrate.cmd [task] [ejb]
REM Example: migrate.cmd wls2was checklist
REM ---------------------------------------------------------------

if "%1" == "" (
	echo [error] Task folder name must be provided.
	goto :showtask
)

if not exist "%CD%\%1" (
	echo [error] The task "%1" doesn't exist.
	goto :showtask
)
goto :checkejb

:showtask
echo [info] It has to be one of the following: 
for /f "usebackq" %%i in (`dir /b /ad-h "%CD%"`) do echo [info] - %%i
goto :end

:checkejb
if "%2" == "" (
	echo [error] EJB folder name must be provided.
	goto :end
)

SET TASK_NAME=%1
SET EJB_FOLDER=%2

pushd %CD%\%TASK_NAME%
call run.cmd %2
popd

:end
ENDLOCAL