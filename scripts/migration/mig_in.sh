. set_mig_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(1,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_IN \(CIF_NUMBER,FAC_DESC,SOURCE_SECURITY_ID,SECURITY_TYPE,SECURITY_SUB_TYPE,SECURITY_CURRENCY,SECURITY_LOCATION,SECURITY_ORGANISATION,SECURITY_CUSTODIAN_TYPE,SECURITY_CUSTODIAN_VALUE,SECURITY_MATURITY_DATE,SECURITY_PERFECTION_DATE,LEGAL_ENFORCEABILITY_IND,LEGAL_ENFORCEABILITY_DATE,SECURITY_REF_NOTE,EXCHANGE_CONTROL_OBTAINED,INSURER_NAME,INSURANCE_TYPE,INSURED_CURRENCY,INSURED_AMT,INSURANCE_EFFECTIVE_DATE,POLICY_NUMBER,INSURANCE_EXPIRY_DATE,BANK_INTEREST_DULY_NOTED,EXTERNAL_LEGAL_COUNSEL,ACCELERATION_CLAUSE,LOCAL_CCY_IN_LOCAL_MARKETS,CORE_MARKETS_TAG,ISDA_MASTER_AGREEMENT_DATE,TREASURY_DOCUMENTATION_DATE,BANK_ENTITY,HEDGE_TYPE,HEDGE_REFERENCE,CDS_REFERENCE,TRADE_ID,TRADE_DATE,DEAL_DATE,START_DATE,CDS_MATURITY_DATE,TENOR_UNIT,TENOR_UOM,TRADE_CURRENCY,NOTIONAL_HEDGED_AMT,REFERENCE_ENTITY,CDS_BKG_LOCATION,LOAN_BOND_BKG_LOCATION,REFERENCE_ASSET,ISSUER,ISSUER_ID,ISSUER_DETAIL,DEALT_PRICE,RESIDUAL_MATURITY,SETTLEMENT,PAR_VALUE,DECLINE_MARKET_VALUE,EVENT_DETERMINATION_DATE,COMPLIANCE_CERT_OBTAINED,CDS_VALUATION_DATE,CDS_VALUATION_CCY,CDS_MARGIN,CDS_NOMINAL_VALUE,CDS_VALUATION_CMV,CDS_VALUATION_FSV\) FOR EXCEPTION "$DB_SCHEMA".MIG_IN_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_IN IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_IN USE "$DB_SCHEMA".MIG_IN_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(4,2,65,66,67,68,69\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_CHARGE_IN \(SOURCE_SECURITY_ID, SOURCE_LIMIT_ID, CHARGE_TYPE, NATURE_OF_CHARGE, CHARGE_CURRENCY, CHARGE_AMT, DATE_LEGALLY_CHARGE\) FOR EXCEPTION "$DB_SCHEMA".MIG_CHARGE_IN_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_CHARGE_IN IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_CHARGE_IN USE "$DB_SCHEMA".MIG_CHARGE_IN_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(1,4,2,70,71,72,73,74\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_PLEDGOR_IN \(CIF_NUMBER, SOURCE_LIMIT_ID, SOURCE_SECURITY_ID, IS_BORROWER_PLEDGOR, CIF_PLEDGOR1, CIF_PLEDGOR2, CIF_PLEDGOR3, CIF_PLEDGOR4\) FOR EXCEPTION "$DB_SCHEMA".MIG_PLEDGOR_IN_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE
	
"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_PLEDGOR_IN IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_PLEDGOR_IN USE "$DB_SCHEMA".MIG_PLEDGOR_IN_ERR


"$DB2_HOME"/bin/db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P \(4,75,76,77,78,79,80,81,82\)  MESSAGES "$LOG_PATH" REPLACE INTO "$DB_SCHEMA".MIG_VAL_IN \(SOURCE_SECURITY_ID, VALUATION_DATE, VALUATION_CCY, VALUATION_OMV, VALUER, VALUATION_FSV, COMMENTS, RESERVE_PRICE, RESERVE_PRICE_DATE\) FOR EXCEPTION "$DB_SCHEMA".MIG_VAL_IN_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

"$DB2_HOME"/bin/db2 SET INTEGRITY FOR "$DB_SCHEMA".MIG_VAL_IN IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "$DB_SCHEMA".MIG_VAL_IN USE "$DB_SCHEMA".MIG_VAL_IN_ERR
