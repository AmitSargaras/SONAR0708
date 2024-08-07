#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 3f ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_3f.sql -l "$LOG_PATH"/qc_report_3f.log

echo "-------------------------------------";
echo "Exporting QC Report 3f ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3f.sql -l "$LOG_PATH"/generate_report_3f.log

echo "-------------------------------------";
echo "Moving QC Report 3f ... ";

mkdir ../reports/QC_Report_3f
mv QC_3f_*.csv ../reports/QC_Report_3f
