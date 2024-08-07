#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 3a ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_3a.sql -l "$LOG_PATH"/qc_report_3a.log

echo "-------------------------------------";
echo "Exporting QC Report 3a ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3a.sql -l "$LOG_PATH"/generate_report_3a.log

echo "-------------------------------------";
echo "Moving QC Report 3a ... ";

mkdir ../reports/QC_Report_3a
mv QC_3a_*.csv ../reports/QC_Report_3a
