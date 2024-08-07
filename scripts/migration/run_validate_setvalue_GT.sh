. set_mig_env.sh $*

"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_GT"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CHARGE_GT"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_PLEDGOR_GT"
"$DB2_HOME"/bin/db2 call "mig_setvalue_GT"
"$DB2_HOME"/bin/db2 call "mig_setvalue_val_GT"
"$DB2_HOME"/bin/db2 call "mig_setvalue_charge_GT"
"$DB2_HOME"/bin/db2 call "mig_setvalue_pledgor_GT"

"$DB2_HOME"/bin/db2 call "MIG_RUN_GT"
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_GT', 'MIG_GT')
"$DB2_HOME"/bin/db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_GT')
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_GT', 'MIG_GT')
"$DB2_HOME"/bin/db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_GT')
"$DB2_HOME"/bin/db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_GT', 'MIG_GT')
"$DB2_HOME"/bin/db2 call "MIG_COMMON_VALUATION"('MIG_VAL_GT', 'MIG_GT', 'M', 'F')
"$DB2_HOME"/bin/db2 call SI_AUTO_CREATE_TRANSACTION