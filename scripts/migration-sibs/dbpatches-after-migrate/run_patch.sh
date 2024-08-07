#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Execute collateral data patches ...

"$DB2_HOME"/bin/db2 -tf data_patch.sql -l data_patch.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

mkdir logs
mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
