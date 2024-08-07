#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating MIG Report 5 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/mig_report_5.sql -l "$LOG_PATH"/mig_report_5.log

echo "-------------------------------------";
echo "Exporting MIG Report 5 ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_5.sql -l "$LOG_PATH"/generate_report_5.log

echo "-------------------------------------";
echo "Moving MIG Report 5 ... ";

mkdir ../reports/mig_Report_5
mv mig_5_*.csv ../reports/mig_Report_5
