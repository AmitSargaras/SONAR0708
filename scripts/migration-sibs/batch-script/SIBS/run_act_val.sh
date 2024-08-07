#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ./connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start checking against actual table ...

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Actual Table ...
"$DB2_HOME"/bin/db2 CALL AUTO_VALIDATE_ACTUAL_TABLE

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.