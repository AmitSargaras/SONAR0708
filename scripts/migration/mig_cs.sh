. set_mig_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_CS \(CIF_NUMBER,SOURCE_LIMIT_ID,FAC_DESC,SOURCE_SECURITY_ID,SECURITY_TYPE,SECURITY_SUB_TYPE,SECURITY_CURRENCY,SECURITY_LOCATION,SECURITY_ORGANISATION,SECURITY_CUSTODIAN_TYPE,SECURITY_CUSTODIAN_VALUE,SECURITY_PERFECTION_DATE,LEGAL_ENFORCEABILITY_IND,LEGAL_ENFORCEABILITY_DATE,SECURITY_REF_NOTE,EXCHANGE_CONTROL_OBTAINED,INTEREST_CAPITALISATION,THIRD_PARTY_BANK,FD_ACCT_NUMBER,DEPOSIT_REF_NO,DEPOSIT_AMT_CCY,DEPOSIT_AMT,DEPOSIT_MATURITY_DATE,SECURITY_DEPOSIT\) FOR EXCEPTION "$DB_SCHEMA".MIG_CS_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_CS IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_CS USE "$DB_SCHEMA".MIG_CS_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(4,2,25,26,27,28,29\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_CHARGE_CS \(SOURCE_SECURITY_ID, SOURCE_LIMIT_ID, CHARGE_TYPE, NATURE_OF_CHARGE, CHARGE_CURRENCY, CHARGE_AMT, DATE_LEGALLY_CHARGE\) FOR EXCEPTION "$DB_SCHEMA".MIG_CHARGE_CS_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_CHARGE_CS IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_CHARGE_CS USE "$DB_SCHEMA".MIG_CHARGE_CS_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(1,2,4,30,31,32,33,34\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_PLEDGOR_CS \(CIF_NUMBER, SOURCE_LIMIT_ID, SOURCE_SECURITY_ID, IS_BORROWER_PLEDGOR, CIF_PLEDGOR1, CIF_PLEDGOR2, CIF_PLEDGOR3, CIF_PLEDGOR4\) FOR EXCEPTION "$DB_SCHEMA".MIG_PLEDGOR_CS_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE
	
"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_PLEDGOR_CS IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_PLEDGOR_CS USE "$DB_SCHEMA".MIG_PLEDGOR_CS_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(4,35,36,37,38,39,40,41,42\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_VAL_CS \(SOURCE_SECURITY_ID, VALUATION_DATE, VALUATION_CCY, VALUATION_OMV, VALUER, VALUATION_FSV, COMMENTS, RESERVE_PRICE, RESERVE_PRICE_DATE\) FOR EXCEPTION "$DB_SCHEMA".MIG_VAL_CS_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_VAL_CS IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_VAL_CS USE "$DB_SCHEMA".MIG_VAL_CS_ERR