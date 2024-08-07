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

DT_SUFFIX=`date '+%m%Y'`
FILENAME=CLMFACLNK"$DT_SUFFIX".txt
export FILENAME
echo "[info] Output file name:" $FILENAME

if [ -z $DB_SCHEMA ]; then
	. ../set_db2_env.sh
fi

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "values "$DB_SCHEMA".dt_fmt(current date,'ddmmyyyy')"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "SELECT (DIGITS(CMS_COLLATERAL_ID) || DIGITS(CMS_LSP_APPR_LMTS_ID) || CHAR(SOURCE_ID,10) || DIGITS(DECIMAL(CHARGE_AMOUNT,17,2)) || DIGITS(DECIMAL(COALESCE(SECURITY_RANK,0),2,0)) || CHAR(COALESCE(SI_TSFMT(CREATE_DATE,'ddmmyyyy'),''),8) || DIGITS(DECIMAL(COALESCE(CMS_ACT_SEC_COVERAGE,0),5,2))) AS COL FROM $DB_SCHEMA.VIEW_SI_DW006_CLMFACLNK"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "select digits(count(*)) from $DB_SCHEMA.VIEW_SI_DW006_CLMFACLNK"

#"$DB2_HOME"/bin/db2 connect reset

cat "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp > "$OUTPUT_DIR"/"$FILENAME"

rm "$OUTPUT_DIR"/*.tmp
