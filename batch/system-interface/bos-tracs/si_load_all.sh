#!/bin/bash

MSG_DIR=/usr/cms_sit/config/simessage/BOST
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_cu005.sh $MSG_DIR/CU005BOST
. si_load_ca001.sh $MSG_DIR/CA001BOST
. si_load_ca015.sh $MSG_DIR/CA015BOST
. si_load_co025.sh $MSG_DIR/CO025BOST
. si_load_co022.sh $MSG_DIR/CO022BOST
. si_load_co023.sh $MSG_DIR/CO023BOST
. si_load_sh001.sh $MSG_DIR/SH001BOST

"$DB2_HOME"/bin/db2 call SI_RUN_ALL_BOST
#"$DB2_HOME"/bin/db2 call SI_AUTO_CREATE_TRANSACTION

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt
