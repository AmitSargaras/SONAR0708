#!/usr/bin/ksh

. /cms/batch/system-interface/set_si_run_env.sh

#function to check SI message arrival time
incoming_check() {
	CUR_TIME=`date "+%H%M"`
	
	while : ; 
	do
		if [ $CUR_TIME -ge $1 ]
		then
			break;
		fi
		
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		echo "[$DATE_SUFFIX] [debug] Sleep for $INTERVAL seconds" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
  		sleep $INTERVAL
  		
  		#refresh current time
  		CUR_TIME=`date "+%H%M"`
	done
}

#function to check daily cutoff time
cutoff_check () {
	CUR_TIME=`date "+%H%M"`
	
	if [ $CUT_OFF -lt $CUR_TIME ]
	then
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		echo "[$DATE_SUFFIX] [info] $1 [STOPPED] Cut off time exceeded." >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
		exit_batch
	fi
}

exit_batch () {
	backup_si
	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] si_run_all_controller [END]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
	exit 0
}

backup_si () {
	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] begin SI message backup." >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
	/cms/batch/system-interface/monitor/si_msg_listener_arbs.sh
	/cms/batch/system-interface/monitor/si_msg_listener_quan.sh
	/cms/batch/system-interface/monitor/si_msg_listener_sema.sh
	/cms/batch/system-interface/monitor/si_msg_listener_bost.sh
	/cms/batch/system-interface/monitor/si_msg_listener_stbg.sh
	/cms/batch/system-interface/monitor/si_msg_listener_tspr.sh
	/cms/batch/system-interface/monitor/si_msg_listener_asoa.sh	
	DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
	echo "[$DATE_SUFFIX] [info] completed SI message backup." >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
}

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] si_run_all_controller [START]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log

#check if existing batch is running
#count=$(ps -ef|grep si_run_all_controller.sh|wc -l)
#if [ $count -gt 2 ]
#then
#	echo "[$DATE_SUFFIX] [info] si_run_all_controller [NO_PROCEED] existing batch still running." >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
#	exit 0
#fi

SI_RUN_ALL_CONTROLLER_LOCK_FILE=si_run_all_controller

if [ -f $SI_HOME/monitor/log/${SI_RUN_ALL_CONTROLLER_LOCK_FILE}.lock ]
then
  PROCESS_ID=`cat $SI_HOME/monitor/log/${SI_RUN_ALL_CONTROLLER_LOCK_FILE}.lock`
  FLAG=`ps -ef|awk '{print $2}'|grep $PROCESS_ID`
  if [ -z "$FLAG" ]
  then
        DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
        echo "[$DATE_SUFFIX] [info] si_run_all_controller [ORPHAN LOCK FILE] deleted" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
        rm $SI_HOME/monitor/log/${SI_RUN_ALL_CONTROLLER_LOCK_FILE}.lock
   else
        DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
        echo "[$DATE_SUFFIX] [info] si_run_all_controller [NO_PROCEED] existing batch still running [LOCK FILE] exists" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log 
        exit 0
  fi
else
   DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
   echo "[$DATE_SUFFIX] [info] si_run_all_controller [PROCEED] batch continuing to run" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
fi

echo $$ >> $SI_HOME/monitor/log/${SI_RUN_ALL_CONTROLLER_LOCK_FILE}.lock

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] si_run_all_controller [LOCK FILE] created" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log

#run Stock Banking PF001 adhoc
cutoff_check si_adhoc_stbg_pf001
run_adhoc PF001STBG
if [ $? -eq 0 ]
then
	exit_batch
fi

#incoming ARBS and SEMA SI time checking
incoming_check $TIME_CHECK1

#run ARBS SI
cutoff_check si_msg_listener_arbs
/cms/batch/system-interface/monitor/si_msg_listener_arbs.sh
/opt/IBM/db2/V9.1/bin/db2 CALL "SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'CMS.SI_RUN_TEMP_ARBS_CA001', 'ANY')";
/opt/IBM/db2/V9.1/bin/db2 CALL "SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'CMS.SI_RUN_TEMP_ARBS_CO014', 'ANY')";
/opt/IBM/db2/V9.1/bin/db2 CALL "SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'CMS.SI_AUTO_UPDATE_VALUATION', 'ANY')";
cutoff_check si_run_procedure_arbs
run_proc arbs
if [ $? -eq 0 ]
then
	exit_batch
fi

#run Quantum SI
cutoff_check si_msg_listener_quan
/cms/batch/system-interface/monitor/si_msg_listener_quan.sh
cutoff_check si_run_procedure_quan
run_proc quan
if [ $? -eq 0 ]
then
	exit_batch
fi

#run SEMA SI
cutoff_check si_msg_listener_sema
/cms/batch/system-interface/monitor/si_msg_listener_sema.sh
/opt/IBM/db2/V9.1/bin/db2 CALL "SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'CMS.SI_RUN_TEMP_SEMA_CU002', 'ANY')";
/opt/IBM/db2/V9.1/bin/db2 CALL "SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'CMS.SI_RUN_TEMP_SEMA_CA012', 'ANY')";
#/opt/IBM/db2/V9.1/bin/db2 runstats on table CMS.SI_TEMP_SEMA_CA012;
#/opt/IBM/db2/V9.1/bin/db2 reorg table CMS.SI_TEMP_SEMA_CA012;
cutoff_check si_run_procedure_sema
run_proc sema
if [ $? -eq 0 ]
then
	exit_batch
fi

#incoming BOST and STBG SI time checking
incoming_check $TIME_CHECK2

#run Bostract SI
cutoff_check si_msg_listener_bost
/cms/batch/system-interface/monitor/si_msg_listener_bost.sh
cutoff_check si_run_procedure_bost
run_proc bost
if [ $? -eq 0 ]
then
	exit_batch
fi

#run Stock Banking SI
cutoff_check si_msg_listener_stbg
/cms/batch/system-interface/monitor/si_msg_listener_stbg.sh
cutoff_check si_run_procedure_stbg
run_proc stbg
if [ $? -eq 0 ]
then
	exit_batch
fi

#run Trade Spring SI, uncomment when TSPR-CLIMS go live
cutoff_check si_msg_listener_tspr
/cms/batch/system-interface/monitor/si_msg_listener_tspr.sh
cutoff_check si_run_procedure_tspr
run_proc tspr
if [ $? -eq 0 ]
then
	exit_batch
fi

cutoff_check si_collateral_perfector
/cms/batch/system-interface/monitor/si_collateral_perfector.sh

#run ASOA Host Parameter batch
cutoff_check si_msg_listener_asoa
/cms/batch/system-interface/monitor/si_msg_listener_asoa.sh

rm $SI_HOME/monitor/log/${SI_RUN_ALL_CONTROLLER_LOCK_FILE}.lock

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] si_run_all_controller [LOCK FILE] deleted" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
echo "[$DATE_SUFFIX] [info] si_run_all_controller [END]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log

chmod 664 $SI_HOME/monitor/log/*${DATE_LOG_FILE}*

echo "SUCCESS"
