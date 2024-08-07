@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_PT"
db2 call "MIG_VALIDATE_CHARGE_PT"
db2 call "MIG_VALIDATE_PLEDGOR_PT"
db2 call "mig_setvalue_PT"
db2 call "mig_setvalue_val_PT"
db2 call "mig_setvalue_charge_PT"
db2 call "mig_setvalue_pledgor_PT"

db2 call "MIG_RUN_PT"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_PT', 'MIG_PT')
db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_PT')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_PT', 'MIG_PT')
db2 call "mig_run_load_pledgor_PT"
db2 call "MIG_COMMON_VALUATION"('MIG_VAL_PT', 'MIG_PT', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"