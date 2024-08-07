#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup clean report schema and validation ...

"$DB2_HOME"/bin/db2 -tf data_cleanup_report_schema.sql -l data_cleanup_report_schema.log

"$DB2_HOME"/bin/db2 -td@ -f data_cleanup_procedures.sql -l data_cleanup_procedures.log


echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Customer Information ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CU001_CU

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Application Information ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA001_AA

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit CA - Joint Borrowers Info ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA002_JB

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Master ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_1_FAC

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility BNM ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_2_BNM

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Officer ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_3_OFF

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Relationship ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_4_REL

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Insurance ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_5_INS

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Multi Tier Financing ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_6_MUL

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility Islamic Master ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_7_ISL

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Credit Facility BBA Vari Package ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA003_8_BBA

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: CA - Limit Account Info ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CA004


echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Asset Based - Vehicle, Plant and Equipment ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO001_AB

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Asset Based - Gold ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO002_AB_GOLD

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Deposit ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO005_CS

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral - Marketable Security - Stocks ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO008_MS

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Property ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO009_PT

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Guarantees ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO010_GT

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Others ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO011_OT

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Insurance Protection ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO012_IN

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Clean ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO014_CL


echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Valuation Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO015_VL

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Insurance Policy Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO016_IN

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Charge Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO017_CD

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Pledgor Detail ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO018_PG

echo `date +"%Y/%m/%d %H:%M:%S"` Cleanup: Collateral Pledge Information ...
"$DB2_HOME"/bin/db2 CALL MIG_CLEANUP_CO019_PL

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for data cleanup ...

"$DB2_HOME"/bin/db2 -tf data_cleanup_populate_report.sql -l data_cleanup_populate_report.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report for data cleanup

"$DB2_HOME"/bin/db2 -tf data_cleanup_generate_report.sql -l data_cleanup_generate_report.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report for data cleanup ... 

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

mkdir QC_Report_Data_Cleanup
mkdir log
mv DATA_CLEANUP_*.csv QC_Report_Data_Cleanup
mv *.log log

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 