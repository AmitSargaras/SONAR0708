#!/bin/bash

if [ -z $DB_SCHEMA ]; then
	. ../system-interface/set_db2_env.sh
fi

FILE_PATH=$1
if [ -z $1 ]; then
	echo "[error] Please specify input file"
	return
else
	perl gather_info.pl "$FILE_PATH" sh
fi

DUMP_PATH=$2
if [ -z "$2" ]; then
	echo "[warn] Dump file not specified, default to dump_file.txt"
	DUMP_PATH=/cms/batch/branch-rationalization/dump_file.txt
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
