#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF DEL MODIFIED BY COLDEL, TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL USEDEFAULTS METHOD P \(1, 2, 3, 4, 5\) MESSAGES "$LOG_PATH" REPLACE INTO $DB_SCHEMA.HP_TEMP_PF154\(RECORD_TYPE, COUNTRY_CODE, STATE_CODE, HOL_DATE, HOL_DESC\) NONRECOVERABLE INDEXING MODE AUTOSELECT