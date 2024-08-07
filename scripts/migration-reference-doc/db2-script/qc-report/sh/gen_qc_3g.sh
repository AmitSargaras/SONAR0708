#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating QC Report 3g ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/qc_report_3g.sql -l "$LOG_PATH"/qc_report_3g.log

echo "-------------------------------------";
echo "Exporting QC Report 3g ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3g.sql -l "$LOG_PATH"/generate_report_3g.log

echo "-------------------------------------";
echo "Moving QC Report 3g ... ";

mkdir ../reports/QC_Report_3g
mv QC_3g_*.csv ../reports/QC_Report_3g
