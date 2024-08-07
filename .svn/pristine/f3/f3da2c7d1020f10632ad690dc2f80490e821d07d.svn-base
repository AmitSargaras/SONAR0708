#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start validation and migration scripts part 1 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Customer, AA, JB Procedures  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CU001_CU', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CU001_CU', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA001_AA', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA001_AA', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CA002_JB', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CA002_JB', 'ANY')";

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Customer Information ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CU001_CU
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Customer Information ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CU001_CU

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit Application Information ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA001_AA
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit Application Information ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA001_AA

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Credit CA - Joint Borrowers Info ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CA002_JB
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Credit CA - Joint Borrowers Info ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CA002_JB

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Reorg table ...
. ./reorg_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat on indexes ...
. ./runstat_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Create Transaction  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_TRANSACTION_SET1', 'ANY')";

echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create transaction ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_TRANSACTION_SET1

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for migration part 1 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...
"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_1.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating QC Report Set 1 ...
"$DB2_HOME"/bin/db2 -tf qc_report_set_1.sql -l qc_report_set_1.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report Set 1 ... 
"$DB2_HOME"/bin/db2 -tf generate_report_set_1.sql -l generate_report_set_1.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report Set 1 ... 

mkdir "$QC_PATH"/QC_Report_Set_1
mv QC_*.csv "$QC_PATH"/QC_Report_Set_1
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.