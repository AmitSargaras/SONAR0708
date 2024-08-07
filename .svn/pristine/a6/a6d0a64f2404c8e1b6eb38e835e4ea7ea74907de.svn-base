#SI message home directory
export SI_MSG_HOME=/cms/simessage

#SI shell home directory
export SI_HOME=/cms/batch/system-interface

#SI run and listener log date suffix
export DATE_LOG_FILE=`date '+%Y%m%d'`

#Poll interval, predefined as 5 mins
export INTERVAL=300

#SI message arrival time checking
#export TIME_CHECK1=0515
#export TIME_CHECK2=0715
export TIME_CHECK1=0000
export TIME_CHECK2=0000

#Batch job cutoff time, predefined 8pm
#export CUT_OFF=2000
export CUT_OFF=9999

#import adhoc and run procedure function
. $SI_HOME/monitor/si_adhoc_run_all.sh
. $SI_HOME/monitor/si_run_procedure.sh