#!/bin/bash

FILE_NAME=$1
SCRIPT_NAME=$2
LOG_NAME=$3

# Feed file format type
FMT_TYPE=$4

SYSTEM_ID=${FILE_NAME:5:4}
INTERFACE_ID=${FILE_NAME:0:5}
INTERFACE_ID=`expr $INTERFACE_ID | tr '[A-Z]' '[a-z]'`
SI_FOLDER=$SYSTEM_ID

if [ "$SCRIPT_NAME" == "" ]; then
	SCRIPT_NAME="si_load_${INTERFACE_ID}.sh"
fi

if [ "$LOG_NAME" == "" ]; then
	LOG_NAME="log_db2load_${SYSTEM_ID}_${DATE_LOG_FILE}.txt"
fi

case $SYSTEM_ID in
	ARBS)
	    # checks for feeds from ASOA
	    if [ ${INTERFACE_ID:0:3} == "pf1" ]
	    then
            SCRIPT_FOLDER_NAME=asoa
            SI_FOLDER=ASOA
	    else
		    SCRIPT_FOLDER_NAME=arbs
		fi
	;;
	FINS)
		SCRIPT_FOLDER_NAME=finsys
	;;
	BOST)
		SCRIPT_FOLDER_NAME=bos-tracs
	;;
	STBG)
		SCRIPT_FOLDER_NAME=stockbanking
	;;
	TSPR)
	    # checks for feeds from ASOA
	    if [ ${INTERFACE_ID:0:3} == "pf2" ]
	    then
            SCRIPT_FOLDER_NAME=asoa
            SI_FOLDER=ASOA
	    else
		    SCRIPT_FOLDER_NAME=tradeSpring
		fi
	;;
	QUAN)
		SCRIPT_FOLDER_NAME=quantum
	;;
	MURX)
		SCRIPT_FOLDER_NAME=quantum
		SI_FOLDER=QUAN
	;;
	SEMA)
		SCRIPT_FOLDER_NAME=sema
	;;
	*)
		echo "[error] [listener] No System Id specified"
		return
	;;
esac

if [ -e $SI_MSG_HOME/$SI_FOLDER/$FILE_NAME ]; then
	pushd $SI_HOME/$SCRIPT_FOLDER_NAME > /dev/null
	
	# WLS: consolidate db2load messages by source Id

	if [ $SCRIPT_FOLDER_NAME == "asoa" ]
	then
	    . $SCRIPT_NAME $SI_MSG_HOME/$SI_FOLDER/$FILE_NAME /cms/batch/system-interface/dump_file.txt log_file.txt $FMT_TYPE >> $SI_HOME/monitor/log/$LOG_NAME
	else
	    . $SCRIPT_NAME $SI_MSG_HOME/$SI_FOLDER/$FILE_NAME >> $SI_HOME/monitor/log/$LOG_NAME
	fi
	rm $SI_MSG_HOME/$SI_FOLDER/$FILE_NAME
	rm $SI_MSG_HOME/$SI_FOLDER/$FILE_NAME.DONE
	popd > /dev/null
fi
