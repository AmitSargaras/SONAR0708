@echo off

call ..\setenv.cmd

echo -------------------------------------
echo %date% - %time% Connect to database ...

call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Start validation and migration scripts part 2 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Facility Related Procedures Part 1  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_1', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_1', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_2_BNM', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_2_BNM', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_3_OFF', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_3_OFF', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_4_REL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_4_REL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_5_INS', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_5_INS', 'ANY');


echo %date% - %time% Validate: Credit Facility Master ...
db2 CALL MIG_VALIDATE_CA003_1
echo %date% - %time% Migrate: Credit Facility Master ...
db2 CALL MIG_RUN_CA003_1

echo %date% - %time% Validate: Credit Facility BNM ...
db2 CALL MIG_VALIDATE_CA003_2_BNM
echo %date% - %time% Migrate: Credit Facility BNM ...
db2 CALL MIG_RUN_CA003_2_BNM

echo %date% - %time% Validate: Credit Facility Officer ...
db2 CALL MIG_VALIDATE_CA003_3_OFF
echo %date% - %time% Migrate: Credit Facility Officer ...
db2 CALL MIG_RUN_CA003_3_OFF

echo %date% - %time% Validate: Credit Facility Relationship ...
db2 CALL MIG_VALIDATE_CA003_4_REL
echo %date% - %time% Migrate: Credit Facility Relationship ...
db2 CALL MIG_RUN_CA003_4_REL

echo %date% - %time% Validate: Credit Facility Insurance ...
db2 CALL MIG_VALIDATE_CA003_5_INS
echo %date% - %time% Migrate: Credit Facility Insurance ...
db2 CALL MIG_RUN_CA003_5_INS

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Facility Related Procedures Part 2  ...
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_6_MUL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_6_MUL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_7_ISL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_7_ISL', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_8_BBA', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_8_BBA', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA004', 'ANY');
db2 CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA004', 'ANY');

echo %date% - %time% Validate: Credit Facility Multi Tier Financing ...
db2 CALL MIG_VALIDATE_CA003_6_MUL
echo %date% - %time% Migrate: Credit Facility Multi Tier Financing ...
db2 CALL MIG_RUN_CA003_6_MUL

echo %date% - %time% Validate: Credit Facility Islamic Master ...
db2 CALL MIG_VALIDATE_CA003_7_ISL
echo %date% - %time% Migrate: Credit Facility Islamic Master ...
db2 CALL MIG_RUN_CA003_7_ISL

echo %date% - %time% Validate: Credit Facility BBA Vari Package ...
db2 CALL MIG_VALIDATE_CA003_8_BBA
echo %date% - %time% Migrate: Credit Facility BBA Vari Package ...
db2 CALL MIG_RUN_CA003_8_BBA

echo %date% - %time% Validate: CA - Limit Account Info ...
db2 CALL MIG_VALIDATE_CA004
echo %date% - %time% Migrate: CA - Limit Account Info ...
db2 CALL MIG_RUN_CA004

echo %date% - %time% Migrate: Create transaction ...
db2 CALL AUTO_CREATE_TRANSACTION_SET2

echo %date% - %time% Migrate: Create STP transaction ...
db2 CALL AUTO_CREATE_STP_TRANS_FAC

echo -------------------------------------
echo %date% - %time% Generating qc reports for migration part 2 ...

echo %date% - %time% Generating QC Report Set 2 ...
db2 -tf qc_report_set_2.sql -l qc_report_set_2.log

echo %date% - %time% Exporting QC Report Set 2 ... 
db2 -tf generate_report_set_2.sql -l generate_report_set_2.log

echo %date% - %time% Moving QC Report Set 2 ... 

mkdir "%QC_PATH%"/QC_Report_Set_2
move QC_*.csv "%QC_PATH%"/QC_Report_Set_2
move *.log %QC_LOG_PATH%

echo -------------------------------------
echo %date% - %time% Script end.