#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start validation and migration scripts part 4 ...


echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Linkage Related Procedures Part 1  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO019_PL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO019_PL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO015_VL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO015_VL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO016_IN', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO016_IN', 'ANY')";

echo `date +"%Y/%m/%d %H:%M:%S"` Update: Collateral Pledge Information ...
"$DB2_HOME"/bin/db2 CALL MIG_UPD_CO019_PL
echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Pledge Information ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO019_PL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Pledge Information ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO019_PL

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Valuation Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO015_VL
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Valuation Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO015_VL

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Insurance Policy Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO016_IN
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Insurance Policy Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO016_IN


echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Collateral Linkage Related Procedures Part 2  ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO017_CD', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO017_CD', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_VALIDATE_CO018_PG', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_RUN_CO018_PG', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Charge Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO017_CD
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Charge Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO017_CD

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Collateral Pledgor Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_VALIDATE_CO018_PG
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Collateral Pledgor Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_RUN_CO018_PG

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for migration part 4 ...

echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...
"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_4.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating QC Report Set 4 ...
"$DB2_HOME"/bin/db2 -tf qc_report_set_4.sql -l qc_report_set_4.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report Set 4 ... 
"$DB2_HOME"/bin/db2 -tf generate_report_set_4.sql -l generate_report_set_4.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report Set 4 ... 

mkdir "$QC_PATH"/QC_Report_Set_4
mv QC_*.csv "$QC_PATH"/QC_Report_Set_4
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.