@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start validation and migration scripts part 3 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Procedures Part 1  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO001_AB', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO001_AB', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO002_AB_GOLD', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO002_AB_GOLD', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO005_CS', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO005_CS', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO008_MS', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO008_MS', 'ANY');

echo %date% - %time% Validate: Collateral Asset Based - Vehicle, Plant and Equipment ...
db2 CALL MIG_VALIDATE_CO001_AB
echo %date% - %time% Migrate: Collateral Asset Based - Vehicle, Plant and Equipment ...
db2 CALL MIG_RUN_CO001_AB

echo %date% - %time% Validate: Collateral Asset Based - Gold ...
db2 CALL MIG_VALIDATE_CO002_AB_GOLD
echo %date% - %time% Migrate: Collateral Asset Based - Gold ...
db2 CALL MIG_RUN_CO002_AB_GOLD

echo %date% - %time% Validate: Collateral Deposit ...
db2 CALL MIG_VALIDATE_CO005_CS
echo %date% - %time% Migrate: Collateral Deposit ...
db2 CALL MIG_RUN_CO005_CS

echo %date% - %time% Validate: Collateral - Marketable Security - Stocks ...
db2 CALL MIG_VALIDATE_CO008_MS
echo %date% - %time% Migrate: Collateral - Marketable Security - Stocks ...
db2 CALL MIG_RUN_CO008_MS


echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Procedures Part 2  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO009_PT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO009_PT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO010_GT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO010_GT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO011_OT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO011_OT', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO012_IN', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO012_IN', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO014_CL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO014_CL', 'ANY');


echo %date% - %time% Validate: Collateral Property ...
db2 CALL MIG_VALIDATE_CO009_PT
echo %date% - %time% Migrate: Collateral Property ...
db2 CALL MIG_RUN_CO009_PT

echo %date% - %time% Validate: Collateral Guarantees ...
db2 CALL MIG_VALIDATE_CO010_GT
echo %date% - %time% Migrate: Collateral Guarantees ...
db2 CALL MIG_RUN_CO010_GT

echo %date% - %time% Validate: Collateral Others ...
db2 CALL MIG_VALIDATE_CO011_OT
echo %date% - %time% Migrate: Collateral Others ...
db2 CALL MIG_RUN_CO011_OT

echo %date% - %time% Validate: Collateral Insurance Protection ...
db2 CALL MIG_VALIDATE_CO012_IN
echo %date% - %time% Migrate: Collateral Insurance Protection ...
db2 CALL MIG_RUN_CO012_IN

echo %date% - %time% Validate: Collateral Clean ...
db2 CALL MIG_VALIDATE_CO014_CL
echo %date% - %time% Migrate: Collateral Clean ...
db2 CALL MIG_RUN_CO014_CL

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Transaction Procedures ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_TRANSACTION_SET3', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_STP_TRANS_COL', 'ANY');


echo %date% - %time% Migrate: Create transaction ...
db2 CALL AUTO_CREATE_TRANSACTION_SET3

echo %date% - %time% Migrate: Create STP transaction ...
db2 CALL AUTO_CREATE_STP_TRANS_COL

echo -------------------------------------
echo %date% - %time% Generating qc reports for migration part 3 ...

echo %date% - %time% Generating QC Report Set 3 ...
db2 -tf qc_report_set_3.sql -l qc_report_set_3.log

echo %date% - %time% Exporting QC Report Set 3 ... 
db2 -tf generate_report_set_3.sql -l generate_report_set_3.log

echo %date% - %time% Moving QC Report Set 3 ... 

mkdir "%QC_PATH%"/QC_Report_Set_3
move QC_*.csv "%QC_PATH%"/QC_Report_Set_3
move *.log %QC_LOG_PATH%

echo -------------------------------------
echo %date% - %time% Script end.