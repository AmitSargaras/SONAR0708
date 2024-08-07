#!/bin/bash

MSG_DIR=/cms/simessage/SEMA
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_cu004.sh $MSG_DIR/CU004SEMA

. si_load_cu002.sh $MSG_DIR/CU002SEMA

. si_load_ca001.sh $MSG_DIR/CA001SEMA

. si_load_ca012.sh $MSG_DIR/CA012SEMA

. si_load_co020.sh $MSG_DIR/CO020SEMA

#"$DB2_HOME"/bin/db2 call SI_RUN_ALL_SEMA

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt
