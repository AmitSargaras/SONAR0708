OUTPUT_DIR=$1
if [ -z $1 ]
then
	echo "[error] Please specify output directory"
	return
else
  export OUTPUT_DIR
fi

LOG_PATH=$2
if [ -z $2 ]
then
	echo "[warn] Log file not specified, default to log_file.txt"
	LOG_PATH=log_file.txt
	export LOG_PATH
fi

FILENAME=CO019TSPR
export FILENAME
echo "[info] Output file name: CO019TSPR"

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" values 'H'||"$DB_SCHEMA".dt_fmt(current date,'ddmmyyyy')||char('',3)||'CO019'||char('',3)||'TSPR'||char('',90)
"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" select ('D'||char(lmt_id,32)||substr(digits(cms_collateral_id),6,14)||char(type_name,50)||substr(digits(cmv),4,17)) as COL from "$DB_SCHEMA".VIEW_SI_CO019_TSPR
"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" select 'T'||digits(count(*))||char('',103) from "$DB_SCHEMA".VIEW_SI_CO019_TSPR
"$DB2_HOME"/bin/db2 connect reset

# perl -pi.bak -e "tr/\"//d" "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp
# perl -pi.bak -e "tr/\"//d" "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp
# perl -pi.bak -e "tr/\"//d" "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp
# rm "$OUTPUT_DIR"/*.bak

cat "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp > "$OUTPUT_DIR"/"$FILENAME"

rm "$OUTPUT_DIR"/*.tmp
