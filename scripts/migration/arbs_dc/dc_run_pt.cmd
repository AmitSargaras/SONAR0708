@echo off
call set_mig_env.cmd

db2 call "dc_validate_pt"
db2 call "setValuationType"('DC_PT')
db2 call "dc_run_pt"