#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating MIG Report 3f ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/mig_report_3f.sql -l "$LOG_PATH"/mig_report_3f.log

echo "-------------------------------------";
echo "Exporting MIG Report 3f ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3f.sql -l "$LOG_PATH"/generate_report_3f.log

echo "-------------------------------------";
echo "Moving MIG Report 3f ... ";

mkdir ../reports/mig_Report_3f
mv mig_3f_*.csv ../reports/mig_Report_3f
