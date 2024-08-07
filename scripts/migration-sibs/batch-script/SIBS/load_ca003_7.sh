#!/bin/bash

. ../set_mig_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L \( 1 1, 2 44, 45 63, 64 66, 67 85, 86 88, 89 89, 90 90, 91 105, 106 120, 121 128, 129 130, 131 141, 142 156, 157 167, 168 168, 169 169, 170 184, 185 185, 186 193, 194 194, 195 195, 196 206, 207 221, 222 224, 225 232, 233 233, 234 234, 235 242, 243 243, 244 248, 249 249, 250 250\) MESSAGES "$LOG_PATH" TEMPFILES PATH "$TEMPFILE_PATH" REPLACE INTO "$DB_SCHEMA".MIG_CA003_7_ISL \(RECORD_TYPE, LMT_ID, LLP_BCA_REF_NUM, LMT_FAC_CODE, LMT_FAC_SEQ, GPP_TERM, GPP_TERM_CODE, GPP_PAYMENT_MODE_VALUE, SELLING_PRICE, TOTAL_GPP_AMT, SPTF_GRACE_EXP_DATE, SECURITY_DEP_OF_MTH, SECURITY_DEP_PERCENTAGE, SECURITY_DEP_AMT, CUSTOMER_INTEREST_RATE, GPP_CALCULATION_MEHTOD_VALUE, FULREL_PROFIC_CALC_METHOD, FIXED_AMT_REFUND, COMPOUNDING_METHOD, DATE_STOP_COMPOUNDING, REFUND_GPP_PROFIT_VALUE, REFUND_FULREL_PROFIT_VALUE, COMMISSION_RATE, FIXED_COM_AMOUNT, COMMISSION_TERM, COMMISSION_EXPIRY_DATE, EXC_CMP_IN_PMT_AMT, SPTF_DUAL_REPAYMENT_MODE_VALUE, SNP_AGREEMENT_DATE, GPP_DURATION_FOR_SNP, SNP_TERM, SNP_TERM_CODE_VALUE, FULL_REL_PFT_12_METHOD\) NONRECOVERABLE INDEXING MODE AUTOSELECT