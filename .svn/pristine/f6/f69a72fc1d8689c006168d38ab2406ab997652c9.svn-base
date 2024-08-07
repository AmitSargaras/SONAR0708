@echo on
call set_mig_env.cmd

rem create common procedures
db2 -td@ -f cms_validate_mig_common.sql -l cms_validate_mig_common.log

db2 -td@ -f cms_mig_utilities.sql -l cms_mig_utilities.log

db2 -td@ -f cms_mig_common_stored_proc.sql -l cms_mig_common_stored_proc.log

rem create validate procedures
db2 -td@ -f cms_validate_mig_AB100.sql -l cms_validate_mig_AB100.log

db2 -td@ -f cms_validate_mig_AB101.sql -l cms_validate_mig_AB101.log

db2 -td@ -f cms_validate_mig_AB102.sql -l cms_validate_mig_AB102.log

db2 -td@ -f cms_validate_mig_AB103.sql -l cms_validate_mig_AB103.log

db2 -td@ -f cms_validate_mig_AB109.sql -l cms_validate_mig_AB109.log

db2 -td@ -f cms_validate_mig_AB110.sql -l cms_validate_mig_AB110.log

db2 -td@ -f cms_validate_mig_AB111.sql -l cms_validate_mig_AB111.log

db2 -td@ -f cms_validate_mig_CL.sql -l cms_validate_mig_CL.log

db2 -td@ -f cms_validate_mig_CS.sql -l cms_validate_mig_CS.log

db2 -td@ -f cms_validate_mig_DC.sql -l cms_validate_mig_DC.log

db2 -td@ -f cms_validate_mig_GT.sql -l cms_validate_mig_GT.log

db2 -td@ -f cms_validate_mig_IN.sql -l cms_validate_mig_IN.log

db2 -td@ -f cms_validate_mig_MS.sql -l cms_validate_mig_MS.log

db2 -td@ -f cms_validate_mig_OT.sql -l cms_validate_mig_OT.log

db2 -td@ -f cms_validate_mig_PT.sql -l cms_validate_mig_PT.log

rem create set value procedures
db2 -td@ -f cms_mig_setvalue_AB100.sql -l cms_mig_setvalue_AB100.log

db2 -td@ -f cms_mig_setvalue_AB101.sql -l cms_mig_setvalue_AB101.log

db2 -td@ -f cms_mig_setvalue_AB102.sql -l cms_mig_setvalue_AB102.log

db2 -td@ -f cms_mig_setvalue_AB103.sql -l cms_mig_setvalue_AB103.log

db2 -td@ -f cms_mig_setvalue_AB109.sql -l cms_mig_setvalue_AB109.log

db2 -td@ -f cms_mig_setvalue_AB110.sql -l cms_mig_setvalue_AB110.log

db2 -td@ -f cms_mig_setvalue_AB111.sql -l cms_mig_setvalue_AB111.log

db2 -td@ -f cms_mig_setvalue_CL.sql -l cms_mig_setvalue_CL.log

db2 -td@ -f cms_mig_setvalue_CS.sql -l cms_mig_setvalue_CS.log

db2 -td@ -f cms_mig_setvalue_DC.sql -l cms_mig_setvalue_DC.log

db2 -td@ -f cms_mig_setvalue_GT.sql -l cms_mig_setvalue_GT.log

db2 -td@ -f cms_mig_setvalue_IN.sql -l cms_mig_setvalue_IN.log

db2 -td@ -f cms_mig_setvalue_MS.sql -l cms_mig_setvalue_MS.log

db2 -td@ -f cms_mig_setvalue_OT.sql -l cms_mig_setvalue_OT.log

db2 -td@ -f cms_mig_setvalue_PT.sql -l cms_mig_setvalue_PT.log

rem create load procedures
db2 -td@ -f cms_load_mig_AB100_tables.sql -l cms_load_mig_AB100_tables.log

db2 -td@ -f cms_load_mig_AB101_tables.sql -l cms_load_mig_AB101_tables.log

db2 -td@ -f cms_load_mig_AB102_tables.sql -l cms_load_mig_AB102_tables.log

db2 -td@ -f cms_load_mig_AB103_tables.sql -l cms_load_mig_AB103_tables.log

db2 -td@ -f cms_load_mig_AB109_tables.sql -l cms_load_mig_AB109_tables.log

db2 -td@ -f cms_load_mig_AB110_tables.sql -l cms_load_mig_AB110_tables.log

db2 -td@ -f cms_load_mig_AB111_tables.sql -l cms_load_mig_AB111_tables.log

db2 -td@ -f cms_load_mig_CL_tables.sql -l cms_load_mig_CL_tables.log

db2 -td@ -f cms_load_mig_CS_tables.sql -l cms_load_mig_CS_tables.log

db2 -td@ -f cms_load_mig_DC_tables.sql -l cms_load_mig_DC_tables.log

db2 -td@ -f cms_load_mig_GT_tables.sql -l cms_load_mig_GT_tables.log

db2 -td@ -f cms_load_mig_IN_tables.sql -l cms_load_mig_IN_tables.log

db2 -td@ -f cms_load_mig_MS_tables.sql -l cms_load_mig_MS_tables.log

db2 -td@ -f cms_load_mig_OT_tables.sql -l cms_load_mig_OT_tables.log

db2 -td@ -f cms_load_mig_PT_tables.sql -l cms_load_mig_PT_tables.log

rem create run load
rem NOT NEEDED ANYMORE
rem db2 -td@ -f cms_run_load_AB100.sql -l cms_run_load_AB100.log
rem db2 -td@ -f cms_run_load_AB101.sql -l cms_run_load_AB101.log
rem db2 -td@ -f cms_run_load_AB102.sql -l cms_run_load_AB102.log
rem db2 -td@ -f cms_run_load_AB103.sql -l cms_run_load_AB103.log
rem db2 -td@ -f cms_run_load_AB109.sql -l cms_run_load_AB109.log
rem db2 -td@ -f cms_run_load_AB110.sql -l cms_run_load_AB110.log
rem db2 -td@ -f cms_run_load_AB111.sql -l cms_run_load_AB111.log
rem db2 -td@ -f cms_run_load_CL.sql -l cms_run_load_CL.log
rem db2 -td@ -f cms_run_load_CS.sql -l cms_run_load_CS.log
rem db2 -td@ -f cms_run_load_DC.sql -l cms_run_load_DC.log
rem db2 -td@ -f cms_run_load_GT.sql -l cms_run_load_GT.log
rem db2 -td@ -f cms_run_load_IN.sql -l cms_run_load_IN.log
rem db2 -td@ -f cms_run_load_MS.sql -l cms_run_load_MS.log
rem db2 -td@ -f cms_run_load_OT.sql -l cms_run_load_OT.log
rem db2 -td@ -f cms_run_load_PT.sql -l cms_run_load_PT.log	