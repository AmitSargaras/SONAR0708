#!/usr/bin/ksh

run_adhoc ()
{
	FILE_NAME=`expr $1 | tr '[A-Z]' '[a-z]'`
	
	INTERFACE_ID=$(echo $FILE_NAME|cut -c1-5)
	SYSTEM_ID=$(echo $FILE_NAME|cut -c6-9)
	
	$SI_HOME/monitor/listen.sh $1
	. $SI_HOME/set_db2_env.sh
	
	num=$($DB2_HOME/bin/db2 -x select count\(*\) from si_temp_${SYSTEM_ID}_${INTERFACE_ID})
	num=$(echo $num | sed 's/\D//g')
	
	echo "[info] number of records in si_temp_${SYSTEM_ID}_${INTERFACE_ID} : [$num]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
	
	if [ "$num" != "0" ]; then
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		
		echo "[$DATE_SUFFIX] [info] prepare to run si batch for ${SYSTEM_ID} ${INTERFACE_ID}" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
		
		stat=$("$DB2_HOME"/bin/db2 call si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID})
		stat=$(echo $stat | sed 's/\D//g')
		
		DATE_SUFFIX=`date '+%Y%m%d - %H%M'`
		if [ "$stat" = "Return Status = 0" ]; then
			echo "[$DATE_SUFFIX] [info] si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID} [SUCCEED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			
			stat=$("$DB2_HOME"/bin/db2 call si_run_temp_${SYSTEM_ID}_${INTERFACE_ID})
			stat=$(echo $stat | sed 's/\D//g')
			
			if [ "$stat" = "Return Status = 0" ]; then
				echo "[$DATE_SUFFIX] [info] si_run_temp_${SYSTEM_ID}_${INTERFACE_ID} [SUCCEED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
				return 1
			else
				echo "[$DATE_SUFFIX] [info] si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID} [FAILED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
				echo "[$DATE_SUFFIX] [error] si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID}: $stat" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
				return 0
			fi
		else
			echo "[$DATE_SUFFIX] [info] si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID} [FAILED]" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			echo "[$DATE_SUFFIX] [error] si_validate_temp_${SYSTEM_ID}_${INTERFACE_ID}: $stat" >> $SI_HOME/monitor/log/si_run_${DATE_LOG_FILE}.log
			return 0
		fi
	else
		return 1
	fi
}