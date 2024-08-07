echo "----------------------------------------------";
echo "create migration tables.....";

. set_db2_env.sh

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_common.sql -l cms_validate_mig_common.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_utilities.sql -l cms_mig_utilities.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_common_stored_proc.sql -l cms_mig_common_stored_proc.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB100.sql -l cms_validate_mig_AB100.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB101.sql -l cms_validate_mig_AB101.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB102.sql -l cms_validate_mig_AB102.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB103.sql -l cms_validate_mig_AB103.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB109.sql -l cms_validate_mig_AB109.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB110.sql -l cms_validate_mig_AB110.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_AB111.sql -l cms_validate_mig_AB111.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_CL.sql -l cms_validate_mig_CL.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_CS.sql -l cms_validate_mig_CS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_DC.sql -l cms_validate_mig_DC.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_GT.sql -l cms_validate_mig_GT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_IN.sql -l cms_validate_mig_IN.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_MS.sql -l cms_validate_mig_MS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_OT.sql -l cms_validate_mig_OT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_validate_mig_PT.sql -l cms_validate_mig_PT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB100.sql -l cms_mig_setvalue_AB100.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB101.sql -l cms_mig_setvalue_AB101.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB102.sql -l cms_mig_setvalue_AB102.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB103.sql -l cms_mig_setvalue_AB103.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB109.sql -l cms_mig_setvalue_AB109.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB110.sql -l cms_mig_setvalue_AB110.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_AB111.sql -l cms_mig_setvalue_AB111.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_CL.sql -l cms_mig_setvalue_CL.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_CS.sql -l cms_mig_setvalue_CS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_DC.sql -l cms_mig_setvalue_DC.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_GT.sql -l cms_mig_setvalue_GT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_IN.sql -l cms_mig_setvalue_IN.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_MS.sql -l cms_mig_setvalue_MS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_OT.sql -l cms_mig_setvalue_OT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_mig_setvalue_PT.sql -l cms_mig_setvalue_PT.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB100_tables.sql -l cms_load_mig_AB100_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB101_tables.sql -l cms_load_mig_AB101_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB102_tables.sql -l cms_load_mig_AB102_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB103_tables.sql -l cms_load_mig_AB103_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB109_tables.sql -l cms_load_mig_AB109_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB110_tables.sql -l cms_load_mig_AB110_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_AB111_tables.sql -l cms_load_mig_AB111_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_CL_tables.sql -l cms_load_mig_CL_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_CS_tables.sql -l cms_load_mig_CS_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_DC_tables.sql -l cms_load_mig_DC_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_GT_tables.sql -l cms_load_mig_GT_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_IN_tables.sql -l cms_load_mig_IN_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_MS_tables.sql -l cms_load_mig_MS_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_OT_tables.sql -l cms_load_mig_OT_tables.log

"$DB2_HOME"/bin/db2 -td@ -f cms_load_mig_PT_tables.sql -l cms_load_mig_PT_tables.log

# "$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB100.sql -l cms_run_load_AB100.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB101.sql -l cms_run_load_AB101.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB102.sql -l cms_run_load_AB102.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB103.sql -l cms_run_load_AB103.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB109.sql -l cms_run_load_AB109.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB110.sql -l cms_run_load_AB110.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_AB111.sql -l cms_run_load_AB111.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_CL.sql -l cms_run_load_CL.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_CS.sql -l cms_run_load_CS.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_DC.sql -l cms_run_load_DC.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_GT.sql -l cms_run_load_GT.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_IN.sql -l cms_run_load_IN.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_MS.sql -l cms_run_load_MS.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_OT.sql -l cms_run_load_OT.log
#"$DB2_HOME"/bin/db2 -td@ -f cms_run_load_PT.sql -l cms_run_load_PT.log	