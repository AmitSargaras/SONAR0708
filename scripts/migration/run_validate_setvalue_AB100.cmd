@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_AB100"
db2 call "MIG_VALIDATE_CHARGE_AB100"
db2 call "MIG_VALIDATE_PLEDGOR_AB100"
db2 call "mig_setvalue_AB100"
db2 call "mig_setvalue_val_AB100"
db2 call "mig_setvalue_charge_AB100"
db2 call "mig_setvalue_pledgor_AB100"

db2 call "MIG_RUN_AB100"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_AB100', 'MIG_AB100')
db2 call "MIG_CHARGE_DETAILS_RANK"('MIG_CHARGE_AB100')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_AB100', 'MIG_AB100')
db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_AB100')
db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_AB100', 'MIG_AB100')
db2 call "MIG_COMMON_VALUATION"('MIG_VAL_AB100', 'MIG_AB100', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"

