#!/bin/sh

. ./connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup patching table and procedure ...

"$DB2_HOME"/bin/db2 -tf schema_setup.sql -l schema_setup.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup validation and update procedure ...

"$DB2_HOME"/bin/db2 -td@ -f validation_inspol.sql -l validation_inspol.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup qc report schema ...

"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

mkdir logs
mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
