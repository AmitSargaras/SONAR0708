../set_db2_env.sh

"$DB2_HOME"/bin/db2 -td@ -f dc_common.sql -l dc_common_log.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ab100.sql -l dc_validate_ab100.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ab101.sql -l dc_validate_ab101.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ab102.sql -l dc_validate_ab102.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ab103.sql -l dc_validate_ab103.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_dc.sql -l dc_validate_dc.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_gt.sql -l dc_validate_gt.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_in.sql -l dc_validate_in.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ms.sql -l dc_validate_ms.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_ot.sql -l dc_validate_ot.log

"$DB2_HOME"/bin/db2 -td@ -f dc_validate_pt.sql -l dc_validate_pt.log

-- create load procedure
"$DB2_HOME"/bin/db2 -td@ -f dc_load_ab100.sql -l dc_load_ab100.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_ab101.sql -l dc_load_ab101.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_ab102.sql -l dc_load_ab102.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_ab103.sql -l dc_load_ab103.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_dc.sql -l dc_load_dc.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_in.sql -l dc_load_in.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_ms.sql -l dc_load_ms.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_ot.sql -l dc_load_ot.log

"$DB2_HOME"/bin/db2 -td@ -f dc_load_pt.sql -l dc_load_pt.log