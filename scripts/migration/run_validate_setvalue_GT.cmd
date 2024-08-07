@echo off
call set_mig_env.cmd

rem db2 call "MIG_VALIDATE_GT"
rem db2 call "MIG_VALIDATE_CHARGE_GT"
rem db2 call "MIG_VALIDATE_PLEDGOR_GT"
rem db2 call "mig_setvalue_GT"
rem db2 call "mig_setvalue_val_GT"
rem db2 call "mig_setvalue_charge_GT"
rem db2 call "mig_setvalue_pledgor_GT"

rem db2 call "MIG_RUN_GT"
rem db2 call "MIG_LIMIT_SECURITY_MAP"('MIG_CHARGE_GT', 'MIG_GT')
rem db2 call "MIG_CHARGE_DETAILS_WO_RANK"('MIG_CHARGE_GT')
rem db2 call "MIG_LIMIT_CHARGE_MAP"('MIG_CHARGE_GT', 'MIG_GT')
rem db2 call "MIG_PLEDGOR"('MIG_PLEDGOR_GT')
rem db2 call "MIG_SEC_PLEDGOR_MAP"('MIG_PLEDGOR_GT', 'MIG_GT')
rem db2 call "MIG_COMMON_VALUATION"('MIG_VAL_GT', 'MIG_GT', 'M', 'F')
rem db2 call SI_AUTO_CREATE_TRANSACTION