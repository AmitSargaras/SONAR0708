#!/usr/bin/ksh

run_proc () {
	if [ "$1" == "" ]; then
		echo "[error] no source system specified"
	else
		. $SI_HOME/set_db2_env.sh
	
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		echo "[$DATE_SUFFIX] [info] prepare to run si_run_all_$1" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log

		stat=$("$DB2_HOME"/bin/db2 call si_run_all_$1)
		stat=$(echo $stat | sed 's/\D//g')
		
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		if [ "$stat" = "Return Status = 0" ] ; then
			echo "[$DATE_SUFFIX] [info] si_run_all_$1 [SUCCEED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			return 1
		else
			echo "[$DATE_SUFFIX] [info] si_run_all_$1 [FAILED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			echo "[$DATE_SUFFIX] [error] si_run_all_$1: $stat" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			return 0
		fi
	
	fi
}