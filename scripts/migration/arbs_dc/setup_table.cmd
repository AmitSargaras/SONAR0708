@echo off

call ../set_db2_env.cmd

db2 -td@ -f dc_create_error_log.sql -l dc_create_error_log.log

db2 -tf dc_create_ab100_table.sql -l dc_create_ab100_table.log

db2 -tf dc_create_ab101_table.sql -l dc_create_ab101_table.log

db2 -tf dc_create_ab102_table.sql -l dc_create_ab102_table.log

db2 -tf dc_create_ab103_table.sql -l dc_create_ab103_table.log

db2 -tf dc_create_dc_table.sql -l dc_create_dc_table.log

db2 -tf dc_create_gt_table.sql -l dc_create_gt_table.log

db2 -tf dc_create_in_table.sql -l dc_create_in_table.log

db2 -tf dc_create_ms_table.sql -l dc_create_ms_table.log

db2 -tf dc_create_ot_table.sql -l dc_create_ot_table.log

db2 -tf dc_create_pt_table.sql -l dc_create_pt_table.log