#!/bin/bash

MSG_DIR=/usr/cms_sit/config/simessage/TSPR
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_co021.sh $MSG_DIR/CO021TSPR

. si_load_ca006.sh $MSG_DIR/CA006TSPR

. si_load_ca008.sh $MSG_DIR/CA008TSPR

. si_load_ca010.sh $MSG_DIR/CA010TSPR

"$DB2_HOME"/bin/db2 call SI_RUN_ALL_TSPR

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt
