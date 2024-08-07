@echo off

set MSG_DIR=C:\dev\abcms\trunk\simessage\arbs

call ..\set_db2_env.cmd

call si_load_cu001.cmd %MSG_DIR%\CU001ARBS
call si_load_cu002.cmd %MSG_DIR%\CU002ARBS
call si_load_cu003.cmd %MSG_DIR%\CU003ARBS
call si_load_ca001.cmd %MSG_DIR%\CA001ARBS
call si_load_ca002.cmd %MSG_DIR%\CA002ARBS
call si_load_ca003.cmd %MSG_DIR%\CA003ARBS
call si_load_ca004.cmd %MSG_DIR%\CA004ARBS
call si_load_ca005.cmd %MSG_DIR%\CA005ARBS
call si_load_ca019.cmd %MSG_DIR%\CA019ARBS
call si_load_pf003.cmd %MSG_DIR%\PF003ARBS
call si_load_co001.cmd %MSG_DIR%\CO001ARBS
call si_load_co002.cmd %MSG_DIR%\CO002ARBS
call si_load_co003.cmd %MSG_DIR%\CO003ARBS
call si_load_co004.cmd %MSG_DIR%\CO004ARBS
call si_load_co005.cmd %MSG_DIR%\CO005ARBS
call si_load_co006.cmd %MSG_DIR%\CO006ARBS
call si_load_co007.cmd %MSG_DIR%\CO007ARBS
call si_load_co008.cmd %MSG_DIR%\CO008ARBS
call si_load_co009.cmd %MSG_DIR%\CO009ARBS
call si_load_co010.cmd %MSG_DIR%\CO010ARBS
call si_load_co011.cmd %MSG_DIR%\CO011ARBS
call si_load_co012.cmd %MSG_DIR%\CO012ARBS
call si_load_co013.cmd %MSG_DIR%\CO013ARBS
call si_load_co014.cmd %MSG_DIR%\CO014ARBS
call si_load_co015.cmd %MSG_DIR%\CO015ARBS
call si_load_co016.cmd %MSG_DIR%\CO016ARBS
call si_load_co017.cmd %MSG_DIR%\CO017ARBS
call si_load_co018.cmd %MSG_DIR%\CO018ARBS

rem echo running ARBS stored proc 
rem db2 call CLIMS_LOCAL.SI_RUN_ALL_ARBS