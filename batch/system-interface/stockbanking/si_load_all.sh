#!/bin/bash

MSG_DIR=/usr/cms_sit/config/simessage/STBG
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_pf001.sh $MSG_DIR/PF001STBG
. si_load_pf002.sh $MSG_DIR/PF002STBG
. si_load_sh001.sh $MSG_DIR/SH001STBG
. si_load_co022.sh $MSG_DIR/CO022STBG
. si_load_co023.sh $MSG_DIR/CO023STBG
. si_load_co024.sh $MSG_DIR/CO024STBG

"$DB2_HOME"/bin/db2 call SI_RUN_ALL_STBG
#"$DB2_HOME"/bin/db2 call SI_AUTO_CREATE_TRANSACTION

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt
