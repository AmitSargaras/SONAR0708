@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_DC"
db2 call "MIG_VALIDATE_CHARGE_DC"
db2 call "MIG_VALIDATE_PLEDGOR_DC"
db2 call "mig_setvalue_DC"
db2 call "mig_setvalue_val_DC"
db2 call "mig_setvalue_charge_DC"
db2 call "mig_setvalue_pledgor_DC"

db2 call "MIG_RUN_DC"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_DC', 'MIG_DC')
db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_DC')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_DC', 'MIG_DC')
db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_DC')
db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_DC', 'MIG_DC')
db2 call "MIG_COMMON_VALUATION"('MIG_VAL_DC', 'MIG_DC', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"