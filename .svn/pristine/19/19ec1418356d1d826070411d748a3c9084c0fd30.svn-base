@echo off
call set_mig_env.cmd

db2 call "dc_validate_in"
db2 call "dc_validate_legal"('DC_IN')
db2 call "dc_run_in"