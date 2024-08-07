@echo off
call ..\set_db2_env.cmd

db2 call "dc_validate_doc"
db2 call "dc_setvalue_DEED_Code"('DC_DOC')
db2 call "dc_setvalue_common_sec"('DC_DOC')
db2 call "dc_run_doc"