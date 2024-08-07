#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start validation and migration scripts part 3 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Procedures Part 1  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO002_AB_GOLD', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO002_AB_GOLD', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO008_MS', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO008_MS', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO005_CS', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO005_CS', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO011_OT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO011_OT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO014_CL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO014_CL', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Asset Based - Gold ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO002_AB_GOLD
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Asset Based - Gold ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO002_AB_GOLD

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral - Marketable Security - Stocks ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO008_MS
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral - Marketable Security - Stocks ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO008_MS

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Deposit ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO005_CS
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Deposit ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO005_CS

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Others ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO011_OT
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Others ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO011_OT

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Clean ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO014_CL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Clean ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO014_CL


echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Procedures Part 2  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO010_GT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO010_GT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO012_IN', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO012_IN', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO009_PT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO009_PT', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO001_AB', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO001_AB', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Guarantees ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO010_GT
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Guarantees ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO010_GT

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Insurance Protection ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO012_IN
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Insurance Protection ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO012_IN

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Property ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO009_PT
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Property ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO009_PT

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Asset Based - Vehicle, Plant and Equipment ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO001_AB
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Asset Based - Vehicle, Plant and Equipment ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO001_AB

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Reorg table ...
. ./reorg_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat on indexes ...
. ./runstat_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Create Transaction  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_TRANSACTION_SET3', 'ANY')";

echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create transaction ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_TRANSACTION_SET3

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for migration part 3 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...
"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_3.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating QC Report Set 3 ...
"$DB2_HOME"/bin/db2 -tf qc_report_set_3.sql -l qc_report_set_3.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report Set 2 ... 
"$DB2_HOME"/bin/db2 -tf generate_report_set_3.sql -l generate_report_set_3.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report Set 3 ... 

mkdir "$QC_PATH"/QC_Report_Set_3
mv QC_*.csv "$QC_PATH"/QC_Report_Set_3
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.