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
FILENAME=CLMRECCOL"$DT_SUFFIX".txt
export FILENAME
echo "[info] Output file name:" $FILENAME

if [ -z $DB_SCHEMA ]; then
	. ../set_db2_env.sh
fi

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "values "$DB_SCHEMA".dt_fmt(current date,'ddmmyyyy')"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "SELECT (CHAR(SOURCE_ID,4) || DIGITS(CMS_COLLATERAL_ID) || CHAR(SECURITY_TYPE_ID,2) || CHAR(SECURITY_SUB_TYPE_ID,5) || CHAR(SCI_SECURITY_CURRENCY,3) || CHAR(COALESCE(SUBTYPE_STANDARDISED_APPROACH,''),1) || CHAR(COALESCE(FIRB,''),1) || CHAR(COALESCE(AIRB,''),1) ||	CHAR(COALESCE(IS_LEGAL_ENFORCE,''),1) || CHAR(COALESCE(SI_TSFMT(IS_LEGAL_ENFORCE_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(SECURITY_MATURITY_DATE,'ddmmyyyy'),''),8) || CHAR(COALESCE(SI_TSFMT(DELETION_DATE,'ddmmyyyy'),''),8) || DIGITS(DECIMAL(COALESCE(CHARGE_AMOUNT,0),17,2)) || CHAR(IRREVOCABLE_FLAG,1) || CHAR(HOLDING_NO,1) || CHAR(COALESCE(VALUATION_CURRENCY,''),3) || DIGITS(DECIMAL(COALESCE(CMV,0),17,2)) || DIGITS(DECIMAL(COALESCE(FSV,0),17,2)) || DIGITS(COALESCE(CMS_PLEDGOR_DTL_ID,0))) AS COL FROM $DB_SCHEMA.VIEW_SI_DW004_CLMRECCOL"

"$DB2_HOME"/bin/db2 export to "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp of del modified by nochardel coldel0x2C messages "$LOG_PATH" "select digits(count(*)) from $DB_SCHEMA.VIEW_SI_DW004_CLMRECCOL"

#"$DB2_HOME"/bin/db2 connect reset

cat "$OUTPUT_DIR"/"$FILENAME"_HDR.tmp "$OUTPUT_DIR"/"$FILENAME"_DTL.tmp "$OUTPUT_DIR"/"$FILENAME"_TLR.tmp > "$OUTPUT_DIR"/"$FILENAME"

rm "$OUTPUT_DIR"/*.tmp
