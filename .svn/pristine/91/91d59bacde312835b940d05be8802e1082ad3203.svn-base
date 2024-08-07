#!/bin/sh

. set_env.sh

echo "-------------------------------------";
echo "Generating Branch Rationalization Audit Report ... ";
"$DB2_HOME"/bin/db2 call BR_RUN_RPT_ALL

echo "-------------------------------------";
echo "Extracting Audit Data ... ";
"$DB2_HOME"/bin/db2 -tf br_generate_report.sql -l "$LOG_PATH"/br_generate_report.log

echo "-------------------------------------";
echo "Gathering Audit Reports ... ";

mv *.csv $RPT_PATH
mv *.msg $LOG_PATH
