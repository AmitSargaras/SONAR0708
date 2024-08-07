#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 5 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_5.sql -l "$LOG_PATH"/qc_report_5.log

echo "-------------------------------------";
echo "Exporting QC Report 5 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_5.sql -l "$LOG_PATH"/generate_report_5.log

echo "-------------------------------------";
echo "Moving QC Report 5 ... ";

mkdir ../reports/QC_Report_5
mv QC_5_*.csv ../reports/QC_Report_5
