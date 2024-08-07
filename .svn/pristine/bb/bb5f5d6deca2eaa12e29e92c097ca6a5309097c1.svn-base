. set_mig_env.sh $*

"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_AB109"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CHARGE_AB109"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_PLEDGOR_AB109"
"$DB2_HOME"/bin/db2 call "mig_setvalue_AB109"
"$DB2_HOME"/bin/db2 call "mig_setvalue_val_AB109"
"$DB2_HOME"/bin/db2 call "mig_setvalue_charge_AB109"
"$DB2_HOME"/bin/db2 call "mig_setvalue_pledgor_AB109"

"$DB2_HOME"/bin/db2 call "MIG_RUN_AB109"
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_AB109', 'MIG_AB109')
"$DB2_HOME"/bin/db2 call "MIG_CHARGE_DETAILS_RANK"('MIG_CHARGE_AB109')
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_AB109', 'MIG_AB109')
"$DB2_HOME"/bin/db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_AB109')
"$DB2_HOME"/bin/db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_AB109', 'MIG_AB109')
"$DB2_HOME"/bin/db2 call "MIG_COMMON_VALUATION"('MIG_VAL_AB109', 'MIG_AB109', 'M', 'F')
"$DB2_HOME"/bin/db2 call "SI_AUTO_CREATE_TRANSACTION"