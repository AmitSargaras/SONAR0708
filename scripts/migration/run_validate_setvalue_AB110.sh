. set_mig_env.sh $*

"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_AB110"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CHARGE_AB110"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_PLEDGOR_AB110"
"$DB2_HOME"/bin/db2 call "mig_setvalue_AB110"
"$DB2_HOME"/bin/db2 call "mig_setvalue_val_AB110"
"$DB2_HOME"/bin/db2 call "mig_setvalue_charge_AB110"
"$DB2_HOME"/bin/db2 call "mig_setvalue_pledgor_AB110"

"$DB2_HOME"/bin/db2 call "MIG_RUN_AB110"
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_AB110', 'MIG_AB110')
"$DB2_HOME"/bin/db2 call "MIG_CHARGE_DETAILS_RANK"('MIG_CHARGE_AB110')
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_AB110', 'MIG_AB110')
"$DB2_HOME"/bin/db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_AB110')
"$DB2_HOME"/bin/db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_AB110', 'MIG_AB110')
"$DB2_HOME"/bin/db2 call "MIG_COMMON_VALUATION"('MIG_VAL_AB110', 'MIG_AB110', 'M', 'F')
"$DB2_HOME"/bin/db2 call "SI_AUTO_CREATE_TRANSACTION"