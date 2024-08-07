#!/bin/bash

MSG_DIR=/cms/simessage/ARBS
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

#"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
#"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_cu001.sh $MSG_DIR/CU001ARBS
. si_load_cu002.sh $MSG_DIR/CU002ARBS
. si_load_cu003.sh $MSG_DIR/CU003ARBS
. si_load_ca001.sh $MSG_DIR/CA001ARBS
. si_load_ca002.sh $MSG_DIR/CA002ARBS
. si_load_ca003.sh $MSG_DIR/CA003ARBS
. si_load_ca004.sh $MSG_DIR/CA004ARBS
. si_load_ca005.sh $MSG_DIR/CA005ARBS
. si_load_ca019.sh $MSG_DIR/CA019ARBS
. si_load_pf003.sh $MSG_DIR/PF003ARBS
. si_load_co001.sh $MSG_DIR/CO001ARBS
. si_load_co002.sh $MSG_DIR/CO002ARBS
. si_load_co003.sh $MSG_DIR/CO003ARBS
. si_load_co004.sh $MSG_DIR/CO004ARBS
. si_load_co005.sh $MSG_DIR/CO005ARBS
. si_load_co006.sh $MSG_DIR/CO006ARBS
. si_load_co007.sh $MSG_DIR/CO007ARBS
. si_load_co008.sh $MSG_DIR/CO008ARBS
. si_load_co009.sh $MSG_DIR/CO009ARBS
. si_load_co010.sh $MSG_DIR/CO010ARBS
. si_load_co011.sh $MSG_DIR/CO011ARBS
. si_load_co012.sh $MSG_DIR/CO012ARBS
. si_load_co013.sh $MSG_DIR/CO013ARBS
. si_load_co014.sh $MSG_DIR/CO014ARBS
. si_load_co015.sh $MSG_DIR/CO015ARBS
. si_load_co016.sh $MSG_DIR/CO016ARBS
. si_load_co017.sh $MSG_DIR/CO017ARBS
. si_load_co018.sh $MSG_DIR/CO018ARBS

#echo --- executing ARBS procedures --- 
#"$DB2_HOME"/bin/db2 call SI_RUN_ALL_ARBS

#"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
#"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt