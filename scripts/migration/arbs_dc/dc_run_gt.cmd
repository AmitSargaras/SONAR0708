@echo off
call set_mig_env.cmd

db2 call "dc_validate_gt"
db2 call "dc_run_gt"