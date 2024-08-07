#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating MIG Report 4 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/mig_report_4.sql -l "$LOG_PATH"/mig_report_4.log

echo "-------------------------------------";
echo "Exporting MIG Report 4 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_4.sql -l "$LOG_PATH"/generate_report_4.log

echo "-------------------------------------";
echo "Moving MIG Report 4 ... ";

mkdir ../reports/mig_Report_4
mv mig_4_*.csv ../reports/mig_Report_4
