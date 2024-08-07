#!/bin/sh
. /opt/IBM/WebSphere/cmsuat/batch/setclassenv.sh

# OUTPUT_DIR=$1
OUTPUT_DIR=/opt/IBM/WebSphere/cmsuat/simessage/ccrd
if [ -z OUTPUT_DIR ]
then
	echo "[error] Please specify output directory"
	return
else
  export OUTPUT_DIR
fi

# LOG_PATH=$2
LOG_PATH=/opt/IBM/WebSphere/cmsuat/simessage/ccrd/CO005.log
if [ -z LOG_PATH ]
then
	echo "[warn] Log file not specified, default to log_file.txt"
	LOG_PATH=log_file.txt
	export LOG_PATH
fi

SYSTEM_INTERFACE_HOME=/opt/IBM/WebSphere/cmsuat/batch
FILENAME=CCCMSIN
export FILENAME
echo "[info] Output file name:" $FILENAME

# if [ -z $DB_SCHEMA ]; then
	. $SYSTEM_INTERFACE_HOME/set_db2_env.sh
# fi

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "VALUES 'H' || TS_FMT(CURRENT TIMESTAMP, 'yyyymmdd') || REPEAT(' ', 3) || 'CO005' || REPEAT(' ', 3) || 'CCRD' || REPEAT(' ', 20) || 'T'"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "SELECT 'D' || LEFT(los_bca_ref_num, 21) || RIGHT(deposit_receipt_number, 7) || RIGHT(LEFT(CHAR(pledged_amount), 27), 15) || 'T' from VIEW_SI_SEMA_CO005_FD"

perl $SYSTEM_INTERFACE_HOME/hash_total.pl gen "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME".ht.tmp 30,15

perl $SYSTEM_INTERFACE_HOME/gen_trailer.pl "$OUTPUT_DIR"/"$FILENAME".ht.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME".trailer.tmp

echo '                  T' >> "$OUTPUT_DIR"/"$FILENAME".trailer.tmp

cat "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME".trailer.tmp > "$OUTPUT_DIR"/"$FILENAME"

rm "$OUTPUT_DIR"/*.tmp

# ----------- Ftp Batch File ----------- outgoing
. /opt/IBM/WebSphere/cmsuat/batch/system-interface/cms_ftp.sh outgoing /opt/IBM/WebSphere/cmsuat/simessage/ccrd /data/cmsuat/simessage/ccrd
