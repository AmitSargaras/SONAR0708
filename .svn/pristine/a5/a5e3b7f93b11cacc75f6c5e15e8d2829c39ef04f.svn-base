@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_AB101"
db2 call "MIG_VALIDATE_CHARGE_AB101"
db2 call "MIG_VALIDATE_PLEDGOR_AB101"
db2 call "mig_setvalue_AB101"
db2 call "mig_setvalue_val_AB101"
db2 call "mig_setvalue_charge_AB101"
db2 call "mig_setvalue_pledgor_AB101"

db2 call "MIG_RUN_AB101"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_AB101', 'MIG_AB101')
db2	call "MIG_CHARGE_DETAILS_RANK"('MIG_CHARGE_AB101')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_AB101', 'MIG_AB101')
db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_AB101')
db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_AB101', 'MIG_AB101')
db2 call "MIG_VALUATION_AB101"('MIG_VAL_AB101', 'MIG_AB101', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"
