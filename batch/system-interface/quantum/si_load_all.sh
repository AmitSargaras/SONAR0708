#!/bin/bash

MSG_DIR=/cms/simessage/QUAN
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_cu008.sh $MSG_DIR/CU008MURX

. si_load_cu002.sh $MSG_DIR/CU002MURX

. si_load_ca020.sh $MSG_DIR/CA020MURX

#"$DB2_HOME"/bin/db2 call SI_RUN_ALL_QUAN

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt
