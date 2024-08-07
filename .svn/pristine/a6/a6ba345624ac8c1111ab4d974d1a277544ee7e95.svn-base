@echo off
call set_mig_env.cmd

db2 call "dc_validate_ot"
db2 call "dc_validate_legal"('DC_OT')
db2 call "setValuationType"('DC_OT')
db2 call "dc_run_ot"