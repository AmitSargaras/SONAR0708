#!/bin/sh

if [ -z $DB_SCHEMA ]; then
  . ./connect.sh
fi

echo "-------------------------------------";
echo "Generating MIG Report 3h ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/mig_report_3h.sql -l "$LOG_PATH"/mig_report_3h.log

echo "-------------------------------------";
echo "Exporting MIG Report 3h ... ";
"$DB2_HOME"/bin/db2 -tf ../sql/generate_report_3h.sql -l "$LOG_PATH"/generate_report_3h.log

echo "-------------------------------------";
echo "Moving MIG Report 3h ... ";

mkdir ../reports/mig_Report_3h
mv mig_3h_*.csv ../reports/mig_Report_3h
