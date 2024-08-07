
set DB_NAME=ABCLIMS
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=ABCLIMS


set DB_DRIVE=C:

set DB_DATAPATH=%DB_DRIVE%\DB2\ABCLIMS

mkdir %DB_DATAPATH%

db2stop force
db2start
db2 drop database %DB_NAME%

rem -------------------------------------------
rem db2 environment setup
rem -------------------------------------------

db2 create database %DB_NAME% ON %DB_DATAPATH% DBPATH ON %DB_DRIVE% using codeset utf-8 territory us

db2 connect to %DB_NAME% user %DB_USER% using %DB_PASSWD% 

db2 create schema %DB_SCHEMA%

db2 set current schema = %DB_SCHEMA%

db2 create bufferpool cms_small_buf size 16384 pagesize 4k extended storage

db2 create tablespace cms_small_data pagesize 4k managed by database using (FILE '%DB_DATAPATH%\CMS_SMALL_DATA' 100000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_small_buf

db2 create bufferpool cms_buf size 4096 pagesize 8k extended storage

db2 create tablespace cms_data pagesize 8k managed by database using (FILE '%DB_DATAPATH%\CMS_DATA' 5000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_buf

db2 create bufferpool cms_medium_buf size 2048 pagesize 16k extended storage

db2 create tablespace cms_medium_data pagesize 16384 managed by database using (FILE '%DB_DATAPATH%\CMS_MEDIUM_DATA' 1000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_medium_buf


db2 create bufferpool cms_large_buf size 2048 pagesize 32768 extended storage

db2 create tablespace cms_large_data pagesize 32768 managed by database using (FILE '%DB_DATAPATH%\CMS_LARGE_DATA' 1000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_large_buf


db2 create bufferpool cms_index_buf size 8192 pagesize 8k extended storage

db2 create tablespace cms_index pagesize 8192 managed by database using (FILE '%DB_DATAPATH%\CMS_INDEX' 80000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_index_buf


db2 create bufferpool cms_batch_buf size 2048 pagesize 32k extended storage

db2 create tablespace cms_batch pagesize 32768 managed by database using (FILE '%DB_DATAPATH%\CMS_BATCH' 1000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_buf


db2 create bufferpool cms_batch_idx_buf size 2048 pagesize 8k extended storage

db2 create tablespace cms_batch_index pagesize 8192 managed by database using (FILE '%DB_DATAPATH%\CMS_BATCH_INDEX' 1000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_idx_buf


db2 create bufferpool cms_stp_buf size 4096 pagesize 16k extended storage

db2 create tablespace cms_stp pagesize 16k managed by database using (FILE '%DB_DATAPATH%\CMS_STP' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_buf

db2 create bufferpool cms_stp_idx_buf size 2048 pagesize 8k extended storage

db2 create tablespace cms_stp_index pagesize 8192 managed by database using (FILE '%DB_DATAPATH%\CMS_STP_INDEX' 20000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_idx_buf


db2 create bufferpool cms_audit_buf size 4096 pagesize 32k extended storage

db2 create tablespace cms_audit_data pagesize 32k managed by database using (FILE '%DB_DATAPATH%\CMS_AUDIT_DATA' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_audit_buf


db2 create bufferpool cms_temp_buf size 4096 pagesize 32k extended storage

db2 create temporary tablespace cms_temp pagesize 32k managed by automatic storage bufferpool cms_temp_buf

db2 create bufferpool cms_user_buf size 2048 pagesize 8k extended storage

db2 create user temporary tablespace cms_user_tblsp pagesize 8k bufferpool cms_user_buf


echo ----------------------------------------------
echo Update db configurations

db2 update dbm cfg using query_heap_sz 16384 IMMEDIATE

db2 update dbm cfg using maxagents 50

db2 update database configuration using stmtheap 16384 immediate 

db2 update database configuration for %DB_NAME% using applheapsz 8192

db2 update database configuration for %DB_NAME% using app_ctl_heap_sz 8192

db2 update db cfg for %DB_NAME% using logfilsiz 10752

db2 update db cfg for %DB_NAME% using LOGPRIMARY 10

db2 update db cfg for %DB_NAME% using LOGSECOND  246

db2 UPDATE DB CFG FOR %DB_NAME% USING AUTO_MAINT OFF AUTO_TBL_MAINT OFF AUTO_REORG OFF AUTO_RUNSTATS OFF IMMEDIATE;

db2 UPDATE DB CFG FOR %DB_NAME% USING AUTO_MAINT ON AUTO_TBL_MAINT ON AUTO_REORG ON AUTO_RUNSTATS ON IMMEDIATE;


echo ----------------------------------------------
echo Set bufferpool to automatic storage

db2 alter bufferpool cms_small_buf size automatic

db2 alter bufferpool cms_buf size automatic

db2 alter bufferpool cms_medium_buf size automatic

db2 alter bufferpool cms_large_buf size automatic

db2 alter bufferpool cms_index_buf size automatic

db2 alter bufferpool cms_batch_buf size automatic

db2 alter bufferpool cms_batch_idx_buf size automatic

db2 alter bufferpool cms_stp_buf size automatic

db2 alter bufferpool cms_stp_idx_buf size automatic

db2 alter bufferpool cms_audit_buf size automatic

db2 alter bufferpool cms_temp_buf size automatic

db2 alter bufferpool cms_user_buf size automatic



db2set DB2_EVALUNCOMMITTED=ON

db2 terminate

db2stop force

db2start

echo ----------------------------------------------
echo Loading data.....

db2 connect to %DB_NAME% user %DB_USER% using %DB_PASSWD%

db2 set current schema = %DB_SCHEMA%

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,%DB_SCHEMA%

echo -------------------------------------------
echo schema setup
echo -------------------------------------------

db2 -tf cms_create_schema.sql -l cms_create_schema.log

db2 -tf cms_create_stp_schema.sql -l cms_create_stp_schema.log

db2 -tf cms_create_schema_facility.sql -l cms_create_schema_facility.log

db2 -tf cms_create_schema_batch.sql -l cms_create_schema_batch.log

db2 -tf cms_create_std_code_schema.sql -l cms_create_std_code_schema.log

db2 -tf drop_team_unique_index.sql -l drop_team_unique_index.log

db2 -tf cms_module_tat_doc_setup.sql -l cms_module_tat_doc_setup.log

db2 -tf cms_create_functions.sql -l cms_create_functions.log

db2 -tf cms_create_views.sql -l cms_create_views.log

db2 -tf cms_create_procedures.sql -l cms_create_procedures.log

db2 -tf cms_create_triggers.sql -l cms_create_triggers.log


echo -------------------------------------------
echo ------ product setup ------- 
echo -------------------------------------------
db2 -tf cms_country_setup.sql -l cms_country_setup.log

db2 -tf cms_currency_setup.sql -l cms_currency_setup.log

db2 -tf cms_host_std_code_setup.sql -l cms_host_std_code_setup.log

db2 -tf cms_rlos_std_code_setup.sql -l cms_rlos_std_code_setup.log

db2 -tf cms_std_code_setup.sql -l cms_std_code_setup.log

db2 -tf cms_team_setup.sql -l cms_team_setup.log

db2 -tf cms_security_setup.sql -l cms_security_setup.log

db2 -tf cms_tr_state_matrix_setup.sql -l cms_tr_state_matrix_setup.log

db2 -tf cms_FAP.sql -l cms_FAP.log

db2 -tf cms_todo_totrack_setup.sql -l cms_todo_totrack_setup.log

db2 -tf cms_user_setup.sql -l cms_user_setup.log

echo -------------------------------------------
echo ------ module setup ------- 
echo -------------------------------------------
rem db2 -td! -vf cms_security_coverage_setup.sql -l cms_security_coverage_setup.log

db2 -tf cms_module_manual_feed_setup.sql -l cms_module_manual_feed_setup.log

db2 -tf cms_module_asset_life_setup.sql -l cms_module_asset_life_setup.log

db2 -tf cms_module_common_code_maintenance_setup.sql -l cms_module_common_code_maintenance_setup.log

db2 -tf cms_module_creditriskparam_setup.sql -l cms_module_creditriskparam_setup.log

db2 -tf cms_module_liquidation_setup.sql -l cms_module_liquidation_setup.log

db2 -tf cms_module_property_index_setup.sql -l cms_module_property_index_setup.log

db2 -tf CMS_SYSTEM_BANK_AND_BRANCH_setup.sql -l CMS_SYSTEM_BANK_AND_BRANCH_setup.log

db2 -tf CMS_DIRECTOR_MASTER_setup.sql -l CMS_DIRECTOR_MASTER_setup.log

db2 -tf cms_module_credit_approval_setup.sql -l cms_module_credit_approval_setup.log

db2 -tf cms_module_bond_stock_mutual_insert_file_setup.sql -l cms_module_bond_stock_mutual_insert_file_setup.log

db2 -tf cms_module_common_update_setup.sql -l cms_module_common_update_setup.log

db2 -tf cms_credit_approval_setup.sql -l cms_credit_approval_setup.log

db2 -tf cms_rbicategory_setup.sql -l cms_rbicategory_setup.log

db2 -tf cms_module_rbicategory_setup.sql -l cms_module_rbicategory_setup.log

db2 -tf cms_report_setup.sql -l cms_report_setup.log

db2 -tf cms_notification_setup.sql -l cms_notification_setup.log

db2 -td@ -f cms_security_perfection_procedure.sql -l cms_security_perfection_procedure.log

db2 -tf cms_FAP_checklist_setup.sql -l cms_FAP_checklist_setup.log

db2 -tf cms_tr_state_matrix_checklist_setup.sql -l cms_tr_state_matrix_checklist_setup.log

db2 -tf cms_tr_state_matrix_facility_setup.sql -l cms_tr_state_matrix_facility_setup.log

db2 -tf cms_todo_totrack_checklist_setup.sql -l cms_todo_totrack_checklist_setup.log

db2 -tf cms_module_checklist_setup.sql -l cms_module_checklist_setup.log

db2 -tf cms_FAP_facility_setup.sql -l cms_FAP_facility_setup.log

db2 -tf cms_module_facility_setup.sql -l cms_module_facility_setup.log

db2 -tf cms_FAP_pledgor_setup.sql -l cms_FAP_pledgor_setup.log

db2 -tf cms_FAP_pledge_setup.sql -l cms_FAP_pledge_setup.log

db2 -tf cms_module_stp_setup.sql -l cms_module_stp_setup.log

db2 -td@ -f cms_audit_trail_setup.sql -l cms_audit_trail_setup.log

db2 -tf cms_create_schema_image_upload.sql -l cms_create_schema_image_upload.log

db2 -tf cms_image_upload_setup.sql -l cms_image_upload_setup.log

db2 "DECLARE GLOBAL TEMPORARY TABLE SESSION.NPL_ACCOUNT(LIMIT_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED"

rem db2 -td@ -f cms_collateral_allocation_setup.sql -l cms_collateral_allocation_setup.log

db2 -td@ -f cms_collateral_allocation_CR015.sql -l cms_collateral_allocation_CR015.log



db2 -tf cms_create_schema_other_bank_branch.sql -l cms_create_schema_other_bank_branch.logcms_create_schema_other_bank_branch.log

db2 -tf cms_module_other_bank_branch_setup.sql -l cms_module_other_bank_branch_setup.log