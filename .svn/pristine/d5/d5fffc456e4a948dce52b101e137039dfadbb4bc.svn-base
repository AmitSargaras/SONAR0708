#!/bin/sh

. ../setenv.sh
. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports 2 ...

"$DB2_HOME"/bin/db2 -tf qc_report_2.sql -l qc_report_2.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report 2 ... 

"$DB2_HOME"/bin/db2 -tf generate_report_2.sql -l generate_report_2.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report 2 ... 

mkdir "$QC_PATH"/QC_Report_2
mv QC_2_*.csv "$QC_PATH"/QC_Report_2
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.