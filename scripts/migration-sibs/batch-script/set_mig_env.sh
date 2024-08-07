
FILE_PATH=$1
DUMP_PATH=$2
LOG_PATH=$3
if [ -z $1 ]; then
	echo "[error] Please specify input file"
	return
else
	echo "[info] Backup file to $1_yyyymmdd_hhmm"
	. ../create_backup.sh "$FILE_PATH" ./source_backup

	# Strip ^M character, resulted in SSH transfer
	tr -d "\015" < "$FILE_PATH" > "$FILE_PATH"_tmp
	mv "$FILE_PATH"_tmp "$FILE_PATH"
	chmod 774 "$FILE_PATH"
	
	perl ../gather_info.pl "$FILE_PATH" sh $4

#	if [ ! -e "$1.go" ]; then
#		echo "[error] Data Integrity Checking fail."
#		echo $FILE_PATH > "$LOAD_LOG"\fail_load.log
#		IS_PROCEED=false
#		export IS_PROCEED
#		return
#	fi

#	rm "$1.go"

#	if [ -e "$1.db2.sh" ]; then
#		echo "[info] Running necessary db2 scripts."
#		. "$1.db2.sh"
#		rm "$1.db2.sh"
#	fi
fi

export FILE_PATH
export DUMP_PATH
export LOG_PATH

IS_PROCEED=true
export IS_PROCEED