#!/bin/sh

. ../setenv.sh
. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Dropping and creating mig report table ...

"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema_8.log

echo `date +"%Y/%m/%d %H:%M:%S"` Generating qc reports 8 ...

"$DB2_HOME"/bin/db2 -tf qc_report_8.sql -l qc_report_8.log

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Exporting QC Report 8 ... 

"$DB2_HOME"/bin/db2 -tf generate_report_8.sql -l generate_report_8.log

# echo -------------------------------------
# echo `date +"%Y/%m/%d %H:%M:%S"` Sorting QC Report 8 by Cif Id ... 

# . ./sort_file_8.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Moving QC Report 8 ... 

mkdir "$QC_PATH"/QC_Report_8
# mkdir "$QC_PATH"/QC_Report_8_Unsorted

# mv sorted/QC_8_*.csv "$QC_PATH"/QC_Report_8

mv QC_8_*.csv "$QC_PATH"/QC_Report_8
mv *.log $QC_LOG_PATH

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.