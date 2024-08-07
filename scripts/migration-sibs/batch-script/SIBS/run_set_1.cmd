@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start validation and migration scripts part 1 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Customer, AA, JB Procedures  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CU001_CU', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CU001_CU', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA001_AA', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA001_AA', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA002_JB', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA002_JB', 'ANY');

echo %date% - %time% Validate: Customer Information ...
db2 CALL MIG_VALIDATE_CU001_CU
echo %date% - %time% Migrate: Customer Information ...
db2 CALL MIG_RUN_CU001_CU

echo %date% - %time% Validate: Credit Application Information ...
db2 CALL MIG_VALIDATE_CA001_AA
echo %date% - %time% Migrate: Credit Application Information ...
db2 CALL MIG_RUN_CA001_AA

echo %date% - %time% Validate: Credit CA - Joint Borrowers Info ...
db2 CALL MIG_VALIDATE_CA002_JB
echo %date% - %time% Migrate: Credit CA - Joint Borrowers Info ...
db2 CALL MIG_RUN_CA002_JB

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Create Transaction  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_TRANSACTION_SET1', 'ANY');

echo %date% - %time% Migrate: Create transaction ...
db2 CALL AUTO_CREATE_TRANSACTION_SET1

echo -------------------------------------
echo %date% - %time% Generating qc reports for migration part 1 ...

echo %date% - %time% Generating QC Report Set 1 ...
db2 -tf qc_report_set_1.sql -l qc_report_set_1.log

echo %date% - %time% Exporting QC Report Set 1 ... 
db2 -tf generate_report_set_1.sql -l generate_report_set_1.log

echo %date% - %time% Moving QC Report Set 1 ... 

mkdir "%QC_PATH%"/QC_Report_Set_1
move QC_*.csv "%QC_PATH%"/QC_Report_Set_1
move *.log %QC_LOG_PATH%

echo -------------------------------------
echo %date% - %time% Script end.