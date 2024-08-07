#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Execute clean up actual or staging table indexes ...

"$DB2_HOME"/bin/db2 -tf drop_actual_index.sql -l drop_actual_index.log

# echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

# mkdir logs
# mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
