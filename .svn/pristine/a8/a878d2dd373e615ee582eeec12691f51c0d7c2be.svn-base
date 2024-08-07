#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Execute clean up migration tablespace and bufferpool ...

"$DB2_HOME"/bin/db2 -tf drop_tablespace.sql -l drop_tablespace.log

# echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

# mkdir logs
# mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
