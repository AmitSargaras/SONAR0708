@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start validation and migration scripts part 4 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Linkage Related Procedures Part 1  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO019_PL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO019_PL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO015_VL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO015_VL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO016_IN', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO016_IN', 'ANY');


echo %date% - %time% Validate: Collateral Pledge Information ...
db2 CALL MIG_VALIDATE_CO019_PL
echo %date% - %time% Migrate: Collateral Pledge Information ...
db2 CALL MIG_RUN_CO019_PL

echo %date% - %time% Validate: Collateral Valuation Detail ...
db2 CALL MIG_VALIDATE_CO015_VL
echo %date% - %time% Migrate: Collateral Valuation Detail ...
db2 CALL MIG_RUN_CO015_VL

echo %date% - %time% Validate: Collateral Insurance Policy Detail ...
db2 CALL MIG_VALIDATE_CO016_IN
echo %date% - %time% Migrate: Collateral Insurance Policy Detail ...
db2 CALL MIG_RUN_CO016_IN

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Linkage Related Procedures Part 2  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO017_CD', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO017_CD', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO018_PG', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO018_PG', 'ANY');


echo %date% - %time% Validate: Collateral Charge Detail ...
db2 CALL MIG_VALIDATE_CO017_CD
echo %date% - %time% Migrate: Collateral Charge Detail ...
db2 CALL MIG_RUN_CO017_CD

echo %date% - %time% Validate: Collateral Pledgor Detail ...
db2 CALL MIG_VALIDATE_CO018_PG
echo %date% - %time% Migrate: Collateral Pledgor Detail ...
db2 CALL MIG_RUN_CO018_PG

echo -------------------------------------
echo %date% - %time% Generating qc reports for migration part 4 ...

echo %date% - %time% Generating QC Report Set 4 ...
db2 -tf qc_report_set_4.sql -l qc_report_set_4.log

echo %date% - %time% Exporting QC Report Set 4 ... 
db2 -tf generate_report_set_4.sql -l generate_report_set_4.log

echo %date% - %time% Moving QC Report Set 4 ... 

mkdir "%QC_PATH%"/QC_Report_Set_4
move QC_*.csv "%QC_PATH%"/QC_Report_Set_4
move *.log %QC_LOG_PATH%

echo -------------------------------------
echo %date% - %time% Script end.