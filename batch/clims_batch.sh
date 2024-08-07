#!/usr/bin/ksh

. /usr/IBM/WebSphere/cms_sit/batch/setclassenv.sh


CLIMS_BATCH_LOG_FILE_HOME=/usr/IBM/WebSphere/cms_sit/logs
CLIMS_BATCH_DATE_LOG_FILE=clims_batch_`date '+%Y%m%d'`
CLIMS_BATCH_LOCK_FILE=clims_batch
CLIMS_BATCH_FILE_HOME=/usr/IBM/WebSphere/cms_sit/batch


#function to exit batch job
exit_batch () {
	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] clims_batch [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
	exit 0
}



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] clims_batch [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



#check if existing batch job is running
if [ -f "$CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_LOCK_FILE}.lock" ]
then
  PROCESS_ID=`cat $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_LOCK_FILE}.lock`
  FLAG=`ps -ef|awk '{print $2}'|grep $PROCESS_ID`
  if [ -z "$FLAG" ]
  then
        DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
        echo "[$DATE_SUFFIX] [info] clims_batch [ORPHAN LOCK FILE] deleted" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
        rm $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_LOCK_FILE}.lock
   else
        DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
        echo "[$DATE_SUFFIX] [info] clims_batch [NO_PROCEED] existing batch still running [LOCK FILE] exists" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
        exit_batch
  fi
else
   DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
   echo "[$DATE_SUFFIX] [info] clims_batch [PROCEED] batch continuing to run" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
fi



#create new lock file
echo $$ >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_LOCK_FILE}.lock

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] clims_batch [LOCK FILE] created" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



counter=0

while [ "$counter" -lt 3 ]
do



	prevcount=$(cat $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log | grep ssh | wc -l)

	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
    echo "[$DATE_SUFFIX] [info] clims_batch count [FAILURE CONNECTIONS] to [DB SERVER] is [$prevcount] " >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
    echo "[$DATE_SUFFIX] [info] clims_batch is trying to [CONNECT] to [DB SERVER] " >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



	# ssh to db server and execute db batch job
	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] si_run_all_controller [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

#	RETURN_STATUS=$(ssh -n -o ServerAliveInterval=1800 cmssit@172.16.106.129 /cms/batch/system-interface/monitor/si_run_all_controller.sh)
    RETURN_STATUS=$(ssh -n -o ServerAliveInterval=1800 climssit@172.16.106.129 /cms/batch/system-interface/monitor/si_run_all_controller.sh)

	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] si_run_all_controller [END] with [STATUS] [$RETURN_STATUS]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log


	currentcount=$(cat $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log | grep ssh | wc -l)

    DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
    echo "[$DATE_SUFFIX] [info] clims_batch count [FAILURE CONNECTIONS] to [DB SERVER] is [$currentcount] " >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



    if [ "$prevcount" -ne "$currentcount" ]
	then
    	counter=`expr $counter + 1`
    	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
    	echo "[$DATE_SUFFIX] [info] clims_batch is starting to go in [INTERVAL] for [1 MINUTE] before trying to [CONNECT] to [DB SERVER]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
    	sleep 60
    	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
    	echo "[$DATE_SUFFIX] [info] clims_batch has finished being in [INTERVAL] for [1 MINUTE] and going to try to [CONNECT] to [DB SERVER]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
    else
    	break
    fi



done

#@CTC - temp

# execute app batch jobs
if [ "$RETURN_STATUS" == "SUCCESS" ]
then

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] persisting ASOA Host Parameters to actual tables [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

CP=/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/properties.jar:/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/cms.jar:/usr/IBM/WebSphere/AppServer/profiles/AppSrv02/installedApps/AppSvrNode02Cell/cms.ear/integrobase.jar

"$JAVA_HOME"/bin/java $JAVA_OPTS -cp $CP com.integrosys.cms.ui.eventmonitor.EventMonitorClient parameterLoaderBatchJob

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] persisting ASOA Host Parameters to actual tables [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] valuation_new [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/valuation/valuation_new.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] valuation_new [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_lmt_book_update_expired [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/event/event_monitor_lmt_book_update_expired.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_lmt_book_update_expired [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_aggregate_exposure [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/event/event_monitor_aggregate_exposure.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_aggregate_exposure [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_conc_reports [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/report/batch_conc_reports.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_conc_reports [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/event/event_monitor.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] rv [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/rv/rv.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] rv [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



#DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
#echo "[$DATE_SUFFIX] [info] threshold_calc [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log
#
#$CLIMS_BATCH_FILE_HOME/event/threshold_calc.sh
#
#DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
#echo "[$DATE_SUFFIX] [info] threshold_calc [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



#DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
#echo "[$DATE_SUFFIX] [info] event_monitor_coverage [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

#$CLIMS_BATCH_FILE_HOME/event/event_monitor_coverage.sh

#DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
#echo "[$DATE_SUFFIX] [info] event_monitor_coverage [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log


DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_security_coverage [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

/usr/IBM/WebSphere/cms_sit/batch/event/event_monitor_security_coverage.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] event_monitor_security_coverage [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log


DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_mis_reports [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/report/batch_mis_reports.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_mis_reports [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] recurrent_covenant_due [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/event/recurrent_covenant_due.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] recurrent_covenant_due [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_system_reports [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/report/batch_system_reports.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_system_reports [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] mon_enable_disable_user [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/event/mon_enable_disable_user.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] mon_enable_disable_user [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_grp_reports [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/report/batch_grp_reports.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_grp_reports [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_conc_reports_adhoc [START]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log

$CLIMS_BATCH_FILE_HOME/report/batch_conc_reports_adhoc.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] batch_conc_reports_adhoc [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



fi



# remove lock file
rm $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_LOCK_FILE}.lock

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] clims_batch [LOCK FILE] deleted" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log



DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] clims_batch [END]" >> $CLIMS_BATCH_LOG_FILE_HOME/${CLIMS_BATCH_DATE_LOG_FILE}.log


chmod 664 $CLIMS_BATCH_LOG_FILE_HOME/*.log*
