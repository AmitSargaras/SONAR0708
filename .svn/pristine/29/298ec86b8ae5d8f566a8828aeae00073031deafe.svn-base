. set_mig_env.sh $*

"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_MS"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CHARGE_MS"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_PLEDGOR_MS"
"$DB2_HOME"/bin/db2 call "mig_setvalue_MS"
"$DB2_HOME"/bin/db2 call "mig_setvalue_val_MS"
"$DB2_HOME"/bin/db2 call "mig_setvalue_charge_MS"
"$DB2_HOME"/bin/db2 call "mig_setvalue_pledgor_MS"

"$DB2_HOME"/bin/db2 call "MIG_RUN_MS"
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_MS', 'MIG_MS')
"$DB2_HOME"/bin/db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_MS')
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_MS', 'MIG_MS')
"$DB2_HOME"/bin/db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_MS')
"$DB2_HOME"/bin/db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_MS', 'MIG_MS')
"$DB2_HOME"/bin/db2 call "MIG_COMMON_VALUATION"('MIG_VAL_MS', 'MIG_MS', 'M', 'F')
"$DB2_HOME"/bin/db2 call "SI_AUTO_CREATE_TRANSACTION"