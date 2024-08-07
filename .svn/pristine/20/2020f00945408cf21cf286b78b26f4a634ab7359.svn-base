#!/bin/sh

. ../setenv.sh
. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...

"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_7.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports 7 ...

"$DB2_HOME"/bin/db2 -tf qc_report_7.sql -l qc_report_7.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report 7 ... 

"$DB2_HOME"/bin/db2 -tf generate_report_7.sql -l generate_report_7.log

# echo -------------------------------------
# echo `date +"%Y/%m/%d %H:%M:%S"` Sorting QC Report 7 by Cif Id ... 

# . ./sort_file_7.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report 7 ... 

mkdir "$QC_PATH"/QC_Report_7
# mkdir "$QC_PATH"/QC_Report_7_Unsorted

# mv sorted/QC_7_*.csv "$QC_PATH"/QC_Report_7

mv QC_7_*.csv "$QC_PATH"/QC_Report_7
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.