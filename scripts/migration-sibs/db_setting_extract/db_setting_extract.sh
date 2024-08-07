#!/bin/bash

. ./setenv.sh
. ./connect.sh

"$DB2_HOME"/bin/db2 update monitor switches using bufferpool on sort on lock on table on statement on  

"$DB2_HOME"/bin/db2 list tablespaces show detail > log_tablespaces_$DB_NAME.log

"$DB2_HOME"/bin/db2 get snapshot for bufferpools on $DB_NAME > log_bufferpools_$DB_NAME.log

"$DB2_HOME"/bin/db2 get dbm cfg show detail > log_dbm_cfg.log

"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME show detail > log_db_cfg_$DB_NAME.log

"$DB2_HOME"/bin/db2 -tvf db_setting_extract.sql -z db_setting_extract.log

