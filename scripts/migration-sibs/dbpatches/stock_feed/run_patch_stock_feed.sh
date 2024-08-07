#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Execute stock feed patches ...

"$DB2_HOME"/bin/db2 -tf CMS_PRICE_FEED_HISTORY.sql -l CMS_PRICE_FEED_HISTORY.log

"$DB2_HOME"/bin/db2 -tf CMS_PRICE_FEED.sql -l CMS_PRICE_FEED.log

"$DB2_HOME"/bin/db2 -tf CMS_STAGE_PRICE_FEED.sql -l CMS_STAGE_PRICE_FEED.log

"$DB2_HOME"/bin/db2 -tf CMS_CREDIT_RISK_PARAM.sql -l CMS_CREDIT_RISK_PARAM.log

"$DB2_HOME"/bin/db2 -tf CMS_STAGE_CREDIT_RISK_PARAM.sql -l CMS_STAGE_CREDIT_RISK_PARAM.log


# echo "-------------------------------------"
# echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

# mkdir logs
# mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
