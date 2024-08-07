#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Execute common code category entry data patches ...

"$DB2_HOME"/bin/db2 -tf common_code_category_entry.sql -l common_code_category_entry.log


echo `date +"%Y/%m/%d %H:%M:%S"` Execute collateral data patches ...

"$DB2_HOME"/bin/db2 -tf collateral_patch.sql -l collateral_patch.log

# echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

# mkdir logs
# mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
