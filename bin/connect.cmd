@echo off

REM ------------------------------------------------------
REM Utility tool to shortcut run the db2 connect, db2start
REM etc. 
REM 
REM This file can be placed in Desktop, then run db2cmd
REM and change directory to Desktop
REM 
REM Add more db2 connect options as you wish.
REM ------------------------------------------------------

SETLOCAL
:begin
cls
set choose=
echo DB2 control centre
echo ---------------------
echo 1. CONNECT EONCMS
echo 2. CONNECT EOMCMS_M
echo 3. DISCONNECT ALL
echo 4. START DB2 instance
echo 5. STOP DB2 instance
echo 6. EXIT
echo ---------------------
echo Please choose:
set /P choose=

if "%choose%" == "" (
	goto :begin
)

if "%choose%" == "1" (
	db2 connect to eoncms user eoncms_local using eoncms_local
	prompt EONCMS $g
	title # DB2 # @ EONCMS
	echo connected !
	goto :end
)

if "%choose%" == "2" (
	echo connecting ...
	db2 connect to eoncms_m user integro_eon using integro_eon
	db2 set current schema = EONCMS_DEV
	db2 set current function path = EONCMS_DEV
	prompt EONCMS_M $g
	title # DB2 # @ EONCMS_M
	echo connected !
	goto :end
)

if "%choose%" == "3" (
	db2 disconnect eoncms
	db2 disconnect eoncms_m
	prompt $p$g
	title # DB2 #
	echo - Good Bye -
	goto :end
)

if "%choose%" == "4" (
	db2 db2start
	goto :end
)

if "%choose%" == "5" (
	db2 db2stop
	goto :end
)

if "%choose%" == "6" (
	goto :end
)

goto :begin

:end

ENDLOCAL