if [ -z $DB_SCHEMA ]; then
	. set_db2_env.sh
fi

FILE_PATH=$1
if [ -z $1 ]; then
	echo "[error] Please specify input file"
	return
else
	echo "[info] Backup file to $1_yyyymmdd_hhmm"
	#. ../create_backup.sh "$FILE_PATH"
	# perl ../gather_info.pl "$FILE_PATH" sh $4

	#if [ ! -e "$1.go" ]; then
	#	echo "[error] Data Integrity Checking fail."
	#	IS_PROCEED=false
	#	export IS_PROCEED
	#	return
	#fi
	
	# rm "$1.go"
	
	if [ -e "$1.db2.sh" ]; then
		echo "[info] Running necessary db2 scripts."
		. "$1.db2.sh"
		rm "$1.db2.sh"
	fi
fi

DUMP_PATH=$2
if [ -z "$2" ]; then
	echo "[warn] Dump file not specified, default to dump_file.txt"
	DUMP_PATH=/usr/cms_uat/system-interface/dump_file.txt
fi

LOG_PATH=$3
if [ -z "$3" ]; then
	echo "[warn] Log file not specified, default to log_file.txt"
	LOG_PATH=log_file.txt
fi

export FILE_PATH
export DUMP_PATH
export LOG_PATH

IS_PROCEED=true
export IS_PROCEED