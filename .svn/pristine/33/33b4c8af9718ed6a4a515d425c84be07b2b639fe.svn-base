#!/bin/sh

. ../setenv.sh
. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...

"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_6.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports 6 ...

"$DB2_HOME"/bin/db2 -tf qc_report_6.sql -l qc_report_6.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report 6 ... 

"$DB2_HOME"/bin/db2 -tf generate_report_6.sql -l generate_report_6.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report 6 ... 

mkdir "$QC_PATH"/QC_Report_6
mv QC_6_*.csv "$QC_PATH"/QC_Report_6
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.