#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 2a ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_2a.sql -l "$LOG_PATH"/qc_report_2a.log

echo "-------------------------------------";
echo "Exporting QC Report 2a ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_2a.sql -l "$LOG_PATH"/generate_report_2a.log

echo "-------------------------------------";
echo "Moving QC Report 2a ... ";

mkdir ../reports/QC_Report_2a
mv QC_2a_*.csv ../reports/QC_Report_2a
