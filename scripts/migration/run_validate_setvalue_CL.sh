. set_mig_env.sh $*

"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CL"
"$DB2_HOME"/bin/db2 call "MIG_VALIDATE_CHARGE_CL"
"$DB2_HOME"/bin/db2 call "mig_setvalue_CL"
"$DB2_HOME"/bin/db2 call "mig_setvalue_charge_CL"

"$DB2_HOME"/bin/db2 call "MIG_RUN_CL"
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_CL', 'MIG_CL')
"$DB2_HOME"/bin/db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_CL')
"$DB2_HOME"/bin/db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_CS', 'MIG_CL')
"$DB2_HOME"/bin/db2 call "SI_AUTO_CREATE_TRANSACTION"