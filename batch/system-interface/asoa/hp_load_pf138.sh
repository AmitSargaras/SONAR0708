#!/bin/bash

. ../set_si_env.sh $*

if [ ! "$IS_PROCEED" = "true" ]; then
	return
fi

"$DB2_HOME"/bin/db2 LOAD FROM "$FILE_PATH" OF DEL MODIFIED BY COLDEL, TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="$DUMP_PATH" IMPLIEDDECIMAL USEDEFAULTS METHOD P \(1, 2, 3\) MESSAGES "$LOG_PATH" REPLACE INTO $DB_SCHEMA.HP_TEMP_PF138\(RECORD_TYPE, HOLD_MAIL_CODE, HOLD_MAIL_DESC\) NONRECOVERABLE INDEXING MODE AUTOSELECT

 