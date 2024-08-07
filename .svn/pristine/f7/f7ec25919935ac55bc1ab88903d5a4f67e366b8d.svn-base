@echo off
call set_mig_env.cmd

db2 call "MIG_VALIDATE_CS"
db2 call "MIG_VALIDATE_CHARGE_CS"
db2 call "MIG_VALIDATE_PLEDGOR_CS"
db2 call "mig_setvalue_CS"
db2 call "mig_setvalue_val_CS"
db2 call "mig_setvalue_charge_CS"
db2 call "mig_setvalue_pledgor_CS"

db2 call "MIG_RUN_CS"
db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_CS', 'MIG_CS')
db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_CS')
db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_CS', 'MIG_CS')
db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_CS')
db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_CS', 'MIG_CS')
db2 call "MIG_COMMON_VALUATION"('MIG_VAL_CS', 'MIG_CS', 'M', 'F')
db2 call "SI_AUTO_CREATE_TRANSACTION"
