#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 3 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_3.sql -l "$LOG_PATH"/qc_report_3.log

echo "-------------------------------------";
echo "Exporting QC Report 3 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3.sql -l "$LOG_PATH"/generate_report_3.log

echo "-------------------------------------";
echo "Moving QC Report 3 ... ";

mkdir ../reports/QC_Report_3
mv QC_3_*.csv ../reports/QC_Report_3
