#!/bin/sh

. ./setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ./connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start validation and update scripts ...

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Update Insurance Policy info from UniAsia ...
"$DB2_HOME"/bin/db2 CALL PATCH_VALIDATE_CO016_IN
echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Update Insurance Policy info from UniAsia ...
"$DB2_HOME"/bin/db2 CALL PATCH_RUN_CO016_IN

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports for patching ...

echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating qc report table ...
"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating QC Report ...
"$DB2_HOME"/bin/db2 -tf qc_report_inspol.sql -l qc_report_inspol.log

echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report ... 
"$DB2_HOME"/bin/db2 -tf qenerate_report_inspol.sql -l qenerate_report_inspol.log

echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report Set ... 

mkdir "$QC_PATH"/QC_Report
mv QC_*.csv "$QC_PATH"/QC_Report
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.