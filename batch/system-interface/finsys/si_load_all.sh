MSG_DIR=/usr/cms_sit/config/simessage/FINS
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt

. si_load_cu006.sh $MSG_DIR/CU006FINS.dat

. si_load_cu007.sh $MSG_DIR/CU007FINS.dat

. si_load_cu002.sh $MSG_DIR/CU002FINS.dat

. si_load_ca001.sh $MSG_DIR/CA001FINS.dat

. si_load_ca017.sh $MSG_DIR/CA017FINS.dat

. si_load_ca018.sh $MSG_DIR/CA018FINS.dat

"$DB2_HOME"/bin/db2 call SI_RUN_ALL_FINS

"$DB2_HOME"/bin/db2 list tablespaces show detail >> tablespace_info.txt
"$DB2_HOME"/bin/db2 get db cfg for $DB_NAME >> tablespace_info.txt