#!/bin/sh

. ../setenv.sh
. ../connect.sh

chmod 777 $MSG_DIR
chmod 777 $LOAD_LOG
chmod 777 $QC_PATH
chmod 777 $QC_LOG_PATH

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Start load scripts ...

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Customer Information ...
. ./load_cu001.sh $MSG_DIR/CV001SIBS $DUMPPATH/CV001SIBS.dmp $LOAD_LOG/CV001SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Application Information ...
. ./load_ca001.sh $MSG_DIR/CV002SIBS $DUMPPATH/CV002SIBS.dmp $LOAD_LOG/CV002SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit CA - Joint Borrowers Info ...
. ./load_ca002.sh $MSG_DIR/CV003SIBS $DUMPPATH/CV003SIBS.dmp $LOAD_LOG/CV003SIBS.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Master ...
. ./load_ca003_1.sh $MSG_DIR/CV004SIBS $DUMPPATH/CV004SIBS.dmp $LOAD_LOG/CV004SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility BNM ...
. ./load_ca003_2.sh $MSG_DIR/CV005SIBS $DUMPPATH/CV005SIBS.dmp $LOAD_LOG/CV005SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Officer ...
. ./load_ca003_3.sh $MSG_DIR/CV006SIBS $DUMPPATH/CV006SIBS.dmp $LOAD_LOG/CV006SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Relationship ...
. ./load_ca003_4.sh $MSG_DIR/CV007SIBS $DUMPPATH/CV007SIBS.dmp $LOAD_LOG/CV007SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Insurance ...
. ./load_ca003_5.sh $MSG_DIR/CV008SIBS $DUMPPATH/CV008SIBS.dmp $LOAD_LOG/CV008SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Multi Tier Financing ...
. ./load_ca003_6.sh $MSG_DIR/CV009SIBS $DUMPPATH/CV009SIBS.dmp $LOAD_LOG/CV009SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility Islamic Master ...
. ./load_ca003_7.sh $MSG_DIR/CV010SIBS $DUMPPATH/CV010SIBS.dmp $LOAD_LOG/CV010SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Credit Facility BBA Vari Package ...
. ./load_ca003_8.sh $MSG_DIR/CV011SIBS $DUMPPATH/CV011SIBS.dmp $LOAD_LOG/CV011SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: CA - Limit Account Info ...
. ./load_ca004.sh $MSG_DIR/CV016SIBS $DUMPPATH/CV016SIBS.dmp $LOAD_LOG/CV016SIBS.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Asset Based - Vehicle, Plant and Equipment ...
. ./load_co001.sh $MSG_DIR/CV018SIBS $DUMPPATH/CV018SIBS.dmp $LOAD_LOG/CV018SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Asset Based - Gold ...
. ./load_co002.sh $MSG_DIR/CV019SIBS $DUMPPATH/CV019SIBS.dmp $LOAD_LOG/CV019SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Deposit ...
. ./load_co005.sh $MSG_DIR/CV022SIBS $DUMPPATH/CV022SIBS.dmp $LOAD_LOG/CV022SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral - Marketable Security - Stocks ...
. ./load_co008.sh $MSG_DIR/CV024SIBS $DUMPPATH/CV024SIBS.dmp $LOAD_LOG/CV024SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Property ...
. ./load_co009.sh $MSG_DIR/CV025SIBS $DUMPPATH/CV025SIBS.dmp $LOAD_LOG/CV025SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Guarantees ...
. ./load_co010.sh $MSG_DIR/CV026SIBS $DUMPPATH/CV026SIBS.dmp $LOAD_LOG/CV026SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Others ...
. ./load_co011.sh $MSG_DIR/CV027SIBS $DUMPPATH/CV027SIBS.dmp $LOAD_LOG/CV027SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Insurance Protection ...
. ./load_co012.sh $MSG_DIR/CV028SIBS $DUMPPATH/CV028SIBS.dmp $LOAD_LOG/CV028SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Clean ...
. ./load_co014.sh $MSG_DIR/CV030SIBS $DUMPPATH/CV030SIBS.dmp $LOAD_LOG/CV030SIBS.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Valuation Detail ...
. ./load_co015.sh $MSG_DIR/CV031SIBS $DUMPPATH/CV031SIBS.dmp $LOAD_LOG/CV031SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Insurance Policy Detail ...
. ./load_co016.sh $MSG_DIR/CV032SIBS $DUMPPATH/CV032SIBS.dmp $LOAD_LOG/CV032SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Charge Detail ...
. ./load_co017.sh $MSG_DIR/CV033SIBS $DUMPPATH/CV033SIBS.dmp $LOAD_LOG/CV033SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Pledgor Detail ...
. ./load_co018.sh $MSG_DIR/CV034SIBS $DUMPPATH/CV034SIBS.dmp $LOAD_LOG/CV034SIBS.log

echo `date +"%Y/%m/%d %H:%M:%S"` Load: Collateral Pledge Information ...
. ./load_co019.sh $MSG_DIR/CV035SIBS $DUMPPATH/CV035SIBS.dmp $LOAD_LOG/CV035SIBS.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Reorg table ...
. ./reorg_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat on indexes ...
. ./runstat_all.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Load: Script end.

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Start Validate Actual ...

echo `date +"%Y/%m/%d %H:%M:%S"` Validate: Actual Table ...
"$DB2_HOME"/bin/db2 CALL AUTO_VALIDATE_ACTUAL_TABLE

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` End Validate Actual ...

