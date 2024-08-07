#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start validation and migration scripts part 2 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Facility Related Procedures Part 1  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_1', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_1', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_2_BNM', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_2_BNM', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_3_OFF', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_3_OFF', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_4_REL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_4_REL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_5_INS', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_5_INS', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Master ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_1
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Master ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_1

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility BNM ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_2_BNM
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility BNM ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_2_BNM

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Officer ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_3_OFF
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Officer ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_3_OFF

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Relationship ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_4_REL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Relationship ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_4_REL

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Insurance ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_5_INS
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Insurance ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_5_INS

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Facility Related Procedures Part 2  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_6_MUL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_6_MUL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_7_ISL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_7_ISL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA003_8_BBA', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA003_8_BBA', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA004', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA004', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Multi Tier Financing ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_6_MUL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Multi Tier Financing ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_6_MUL

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility Islamic Master ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_7_ISL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility Islamic Master ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_7_ISL

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Facility BBA Vari Package ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA003_8_BBA
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Facility BBA Vari Package ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA003_8_BBA

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: CA - Limit Account Info ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA004
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: CA - Limit Account Info ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA004

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Reorg table ...
. ./reorg_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat on indexes ...
. ./runstat_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Create Transaction  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_TRANSACTION_SET2', 'ANY')";

echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create transaction ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_TRANSACTION_SET2

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for migration part 2 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...
"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_2.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating QC Report Set 2 ...
"$DB2_HOME"/bin/db2 -tf qc_report_set_2.sql -l qc_report_set_2.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report Set 2 ... 
"$DB2_HOME"/bin/db2 -tf generate_report_set_2.sql -l generate_report_set_2.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report Set 2 ... 

mkdir "$QC_PATH"/QC_Report_Set_2
mv QC_*.csv "$QC_PATH"/QC_Report_Set_2
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.