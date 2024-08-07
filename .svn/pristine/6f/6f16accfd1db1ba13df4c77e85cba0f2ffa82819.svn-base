@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start post migration procedures ...

echo %date% - %time% Reorg table ...
call reorg_all.cmd

echo %date% - %time% Runstat on indexes ...
call runstat_all.cmd

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Post Migration Procedures ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_STP_TRANS_FAC', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_STP_TRANS_COL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_POPULATE_VAL_TO_SEC_TBL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_CHECKLIST', 'ANY');


echo %date% - %time% Migrate: Create STP transaction ...
db2 CALL AUTO_CREATE_STP_TRANS_FAC

echo %date% - %time% Migrate: Create STP transaction ...
db2 CALL AUTO_CREATE_STP_TRANS_COL

echo %date% - %time% Start updating valuation details to security table ...
db2 CALL MIG_POPULATE_VAL_TO_SEC_TBL

echo %date% - %time% Migrate: Create checklist ...
db2 CALL AUTO_CREATE_CHECKLIST

echo -------------------------------------
echo %date% - %time% Script end.