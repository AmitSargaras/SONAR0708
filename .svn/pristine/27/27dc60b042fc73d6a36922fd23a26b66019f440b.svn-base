@echo off

set MSG_DIR=C:\dev\abcms\trunk\simessage\quan

call ..\set_db2_env.cmd

call si_load_cu008.cmd %MSG_DIR%\CU008MURX
call si_load_cu002.cmd %MSG_DIR%\CU002MURX
call si_load_ca020.cmd %MSG_DIR%\CA020MURX


rem echo running QUAN stored proc 
rem db2 call CLIMS_LOCAL.SI_RUN_ALL_QUAN