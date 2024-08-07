@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_IN"
db2 call "MIG_VALIDATE_CHARGE_IN"
db2 call "MIG_VALIDATE_PLEDGOR_IN"
db2 call "mig_setvalue_IN"
db2 call "mig_setvalue_val_IN"
db2 call "mig_setvalue_charge_IN"
db2 call "mig_setvalue_pledgor_IN"

db2 call "MIG_RUN_IN"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_IN', 'MIG_IN')
db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_IN')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_IN', 'MIG_IN')
db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_IN')
db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_IN', 'MIG_IN')
db2 call "MIG_COMMON_VALUATION"('MIG_VAL_IN', 'MIG_IN', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"