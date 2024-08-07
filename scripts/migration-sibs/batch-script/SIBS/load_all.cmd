@echo off

call ..\setenv.cmd
call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start load scripts ...

echo %date% - %time% Load: Customer Information ...
call load_cu001.cmd %MSG_DIR%\CV001SIBS %DUMPPATH%\CV001SIBS.dmp %LOAD_LOG%\CV001SIBS.log

echo %date% - %time% Load: Credit Application Information ...
call load_ca001.cmd %MSG_DIR%\CV002SIBS %DUMPPATH%\CV002SIBS.dmp %LOAD_LOG%\CV002SIBS.log

echo %date% - %time% Load: Credit CA - Joint Borrowers Info ...
call load_ca002.cmd %MSG_DIR%\CV003SIBS %DUMPPATH%\CV003SIBS.dmp %LOAD_LOG%\CV003SIBS.log

echo %date% - %time% Load: Credit Facility Master ...
call load_ca003_1.cmd %MSG_DIR%\CV004SIBS %DUMPPATH%\CV004SIBS.dmp %LOAD_LOG%\CV004SIBS.log

echo %date% - %time% Load: Credit Facility BNM ...
call load_ca003_2.cmd %MSG_DIR%\CV005SIBS %DUMPPATH%\CV005SIBS.dmp %LOAD_LOG%\CV005SIBS.log

echo %date% - %time% Load: Credit Facility Officer ...
call load_ca003_3.cmd %MSG_DIR%\CV006SIBS %DUMPPATH%\CV006SIBS.dmp %LOAD_LOG%\CV006SIBS.log

echo %date% - %time% Load: Credit Facility Relationship ...
call load_ca003_4.cmd %MSG_DIR%\CV007SIBS %DUMPPATH%\CV007SIBS.dmp %LOAD_LOG%\CV007SIBS.log

echo %date% - %time% Load: Credit Facility Insurance ...
call load_ca003_5.cmd %MSG_DIR%\CV008SIBS %DUMPPATH%\CV008SIBS.dmp %LOAD_LOG%\CV008SIBS.log

echo %date% - %time% Load: Credit Facility Multi Tier Financing ...
call load_ca003_6.cmd %MSG_DIR%\CV009SIBS %DUMPPATH%\CV009SIBS.dmp %LOAD_LOG%\CV009SIBS.log

echo %date% - %time% Load: Credit Facility Islamic Master ...
call load_ca003_7.cmd %MSG_DIR%\CV010SIBS %DUMPPATH%\CV010SIBS.dmp %LOAD_LOG%\CV010SIBS.log

echo %date% - %time% Load: Credit Facility BBA Vari Package ...
call load_ca003_8.cmd %MSG_DIR%\CV011SIBS %DUMPPATH%\CV011SIBS.dmp %LOAD_LOG%\CV011SIBS.log

echo %date% - %time% Load: CA - Limit Account Info ...
call load_ca004.cmd %MSG_DIR%\CV016SIBS %DUMPPATH%\CV016SIBS.dmp %LOAD_LOG%\CV016SIBS.log

echo -------------------------------------
echo %date% - %time% Load: Collateral Asset Based - Vehicle, Plant and Equipment ...
call load_co001.cmd %MSG_DIR%\CV018SIBS %DUMPPATH%\CV018SIBS.dmp %LOAD_LOG%\CV018SIBS.log

echo %date% - %time% Load: Collateral Asset Based - Gold ...
call load_co002.cmd %MSG_DIR%\CV019SIBS %DUMPPATH%\CV019SIBS.dmp %LOAD_LOG%\CV019SIBS.log

echo %date% - %time% Load: Collateral Asset Based - Debenture (Miscellaneous) ...
call load_co003.cmd %MSG_DIR%\CV020SIBS %DUMPPATH%\CV020SIBS.dmp %LOAD_LOG%\CV020SIBS.log

echo %date% - %time% Load: Collateral Asset Based - Debenture (Bonds Debenture) ...
call load_co004.cmd %MSG_DIR%\CV021SIBS %DUMPPATH%\CV021SIBS.dmp %LOAD_LOG%\CV021SIBS.log

echo %date% - %time% Load: Collateral Deposit ...
call load_co005.cmd %MSG_DIR%\CV022SIBS %DUMPPATH%\CV022SIBS.dmp %LOAD_LOG%\CV022SIBS.log

echo %date% - %time% Load: Collateral - Marketable Security - Bonds ...
call load_co007.cmd %MSG_DIR%\CV023SIBS %DUMPPATH%\CV023SIBS.dmp %LOAD_LOG%\CV023SIBS.log

echo %date% - %time% Load: Collateral - Marketable Security - Stocks ...
call load_co008.cmd %MSG_DIR%\CV024SIBS %DUMPPATH%\CV024SIBS.dmp %LOAD_LOG%\CV024SIBS.log

echo %date% - %time% Load: Collateral Property ...
call load_co009.cmd %MSG_DIR%\CV025SIBS %DUMPPATH%\CV025SIBS.dmp %LOAD_LOG%\CV025SIBS.log

echo %date% - %time% Load: Collateral Guarantees ...
call load_co010.cmd %MSG_DIR%\CV026SIBS %DUMPPATH%\CV026SIBS.dmp %LOAD_LOG%\CV026SIBS.log

echo %date% - %time% Load: Collateral Others ...
call load_co011.cmd %MSG_DIR%\CV027SIBS %DUMPPATH%\CV027SIBS.dmp %LOAD_LOG%\CV027SIBS.log

echo %date% - %time% Load: Collateral Insurance Protection ...
call load_co012.cmd %MSG_DIR%\CV028SIBS %DUMPPATH%\CV028SIBS.dmp %LOAD_LOG%\CV028SIBS.log

REM echo %date% - %time% Load: Collateral Documentation ...
REM call load_co013.cmd %MSG_DIR%\CV029SIBS %DUMPPATH%\CV029SIBS.dmp %LOAD_LOG%\CV029SIBS.log

echo %date% - %time% Load: Collateral Clean ...
call load_co014.cmd %MSG_DIR%\CV030SIBS %DUMPPATH%\CV030SIBS.dmp %LOAD_LOG%\CV030SIBS.log

echo %date% - %time% Load: Collateral Valuation Detail ...
call load_co015.cmd %MSG_DIR%\CV031SIBS %DUMPPATH%\CV031SIBS.dmp %LOAD_LOG%\CV031SIBS.log

echo %date% - %time% Load: Collateral Insurance Policy Detail ...
call load_co016.cmd %MSG_DIR%\CV032SIBS %DUMPPATH%\CV032SIBS.dmp %LOAD_LOG%\CV032SIBS.log

echo %date% - %time% Load: Collateral Charge Detail ...
call load_co017.cmd %MSG_DIR%\CV033SIBS %DUMPPATH%\CV033SIBS.dmp %LOAD_LOG%\CV033SIBS.log

echo %date% - %time% Load: Collateral Pledgor Detail ...
call load_co018.cmd %MSG_DIR%\CV034SIBS %DUMPPATH%\CV034SIBS.dmp %LOAD_LOG%\CV034SIBS.log

echo %date% - %time% Load: Collateral Pledge Information ...
call load_co019.cmd %MSG_DIR%\CV035SIBS %DUMPPATH%\CV035SIBS.dmp %LOAD_LOG%\CV035SIBS.log

echo -------------------------------------
echo %date% - %time% Reorg table ...
call reorg_all.cmd

echo %date% - %time% Runstat on indexes ...
call runstat_all.cmd

echo -------------------------------------
echo %date% - %time% Load: Script end.

echo -------------------------------------
echo %date% - %time% Start Validate Actual.

echo %date% - %time% Validate: Actual Table ...
db2 CALL AUTO_VALIDATE_ACTUAL_TABLE

echo -------------------------------------
echo %date% - %time% End Validate Actual.

