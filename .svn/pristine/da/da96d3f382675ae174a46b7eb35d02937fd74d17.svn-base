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
FILENAME=CLMPHYCOL"$DT_SUFFIX".txt
export FILENAME
echo "[info] Output file name:" $FILENAME

if [ -z $DB_SCHEMA ]; then
	. $SYSTEM_INTERFACE_HOME/set_db2_env.sh
fi

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "values "$DB_SCHEMA".dt_fmt(current date,'ddmmyyyy')"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "SELECT (CHAR(COALESCE(SOURCE_ID,''),4) || DIGITS(COALESCE(CMS_COLLATERAL_ID,0)) || CHAR(COALESCE(SECURITY_TYPE_ID,''),2) || CHAR(COALESCE(SECURITY_SUB_TYPE_ID,''),5) || CHAR(COALESCE(SCI_SECURITY_CURRENCY,''),3) || CHAR(COALESCE(SUBTYPE_STANDARDISED_APPROACH,''),1) || CHAR(COALESCE(FIRB,''),1) || CHAR(COALESCE(AIRB,''),1) || CHAR(COALESCE(IS_LEGAL_ENFORCE,''),1) || CHAR(COALESCE(SI_TSFMT(IS_LEGAL_ENFORCE_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(SECURITY_MATURITY_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(VALUATION_DATE,'ddmmyyyy'),''),8) || DIGITS(DECIMAL(COALESCE(VALUATION_FREQUENCY,0),3,0)) || CHAR(COALESCE(VALUATION_FREQUENCY_UNIT,''),1) || CHAR(COALESCE(VALUATION_CURRENCY,''),3) || DIGITS(DECIMAL(COALESCE(CMV,0),17,2)) || DIGITS(DECIMAL(COALESCE(FSV,0),17,2)) || DIGITS(DECIMAL(COALESCE(RESERVE_PRICE,0),17,2)) || DIGITS(DECIMAL(COALESCE(PURCHASE_PRICE,0),17,2)) || CHAR(COALESCE(IRREVOCABLE_FLAG,''),1) || CHAR(COALESCE(HAIRCUT_SET_ID,''),5)) AS COL FROM $DB_SCHEMA.VIEW_SI_DW002_CLMPHYCOL"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "select digits(count(*)) from $DB_SCHEMA.VIEW_SI_DW002_CLMPHYCOL"

#"$DB2_HOME"/bin/db2 connect reset

cat "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp > "$OUTPUT_DIR"/"$FILENAME"

rm "$OUTPUT_DIR"/*.tmp
