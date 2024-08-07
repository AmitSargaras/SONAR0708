#!/bin/ksh

. $SI_HOME/set_db2_env.sh

DATE_SUFFIX=`date '+%Y%m%d - %H%M'`

echo "[$DATE_SUFFIX] [info] prepare to run si_collateral_perfector" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
stat=$("$DB2_HOME"/bin/db2 call COLLATERAL_PERFECTOR)
stat=$(echo $stat | sed 's/\D//g')
		
DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
if [ "$stat" = "Return Status = 0" ]; then
	echo "[$DATE_SUFFIX] [info] si_collateral_perfector [SUCCEED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
else
	echo "[$DATE_SUFFIX] [info] si_collateral_perfector [FAILED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
	echo "[$DATE_SUFFIX] [error] si_collateral_perfector: $stat" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log	
fi
