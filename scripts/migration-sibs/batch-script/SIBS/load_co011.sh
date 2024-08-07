#!/bin/bash

. ../set_mig_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L \( 1 1, 2 20, 21 25, 26 65, 66 70, 71 73, 74 76, 77 78, 79 83, 84 84, 85 184, 185 185, 186 187, 188 188, 189 189, 190 197, 198 205, 206 206, 207 221, 222 271, 272 272\) MESSAGES "$LOG_PATH" TEMPFILES PATH "$TEMPFILE_PATH" REPLACE INTO "$DB_SCHEMA".MIG_CO011_OT \(RECORD_TYPE, SECURITY_ID, CMS_SECURITY_SUBTYPE_ID, SECURITY_REF_NOTE, SOURCE_SECURITY_TYPE, SOURCE_SECURITY_SUB_TYPE, CURRENCY, LOC_COUNTRY, LOC_ORG_CODE, CUSTODIAN_TYPE, SECURITY_CUSTODIAN, IS_PHY_INSPECT, ENV_RISKY_STATUS, BORROWER_DEPENDENCY, LEGAL_ENFORCEABILITY, LEGAL_ENFORCEABILITY_DATE, SECURITY_MATURITY_DATE, IS_CGC_PLEDGED, NUMBER_OF_UNITS, DESCRIPTION_OTHERS, COLLATERAL_STATUS\) NONRECOVERABLE INDEXING MODE AUTOSELECT