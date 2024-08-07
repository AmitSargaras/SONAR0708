DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=climssit
DB_USER=climssit
DB_PASSWD=climssit
DB_SCHEMA=climssit

DB_DATAPATH=/cms/db2


echo "----------------------------------------------";
echo "Creating database.....";

mkdir $DB_DATAPATH
chmod 777 $DB_DATAPATH
"$DB2_HOME"/bin/db2 db2start

"$DB2_HOME"/bin/db2 drop database $DB_NAME

"$DB2_HOME"/bin/db2 "create database $DB_NAME ON $DB_DATAPATH CATALOG TABLESPACE MANAGED BY DATABASE using ( FILE '$DB_DATAPATH/CATALOG.DAT' 125000) TEMPORARY TABLESPACE MANAGED BY SYSTEM using ( '$DB_DATAPATH/TEMPTS') USER TABLESPACE MANAGED BY DATABASE using ( FILE '$DB_DATAPATH/USERTTS.DAT' 50000 )"

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 create schema "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 create bufferpool cms_small_buf size automatic pagesize 4096 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_small_data pagesize 4096 managed by database using (FILE '$DB_DATAPATH/CMS_SMALL_DATA' 1000000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_small_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_buf size automatic pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_data pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_DATA' 25000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_medium_buf size automatic pagesize 16384 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_medium_data pagesize 16384 managed by database using (FILE '$DB_DATAPATH/CMS_MEDIUM_DATA' 8000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_medium_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_large_buf size automatic pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_large_data pagesize 32768 managed by database using (FILE '$DB_DATAPATH/CMS_LARGE_DATA' 2000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_large_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_index_buf size automatic pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_INDEX' 320000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_index_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_batch_buf size automatic pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_batch pagesize 32768 managed by database using (FILE '$DB_DATAPATH/CMS_BATCH' 50000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_batch_idx_buf size automatic pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_batch_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_BATCH_INDEX' 100000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_idx_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_stp_buf size 4096 pagesize 16k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_stp pagesize 16k managed by database using (FILE '$DB_DATAPATH/CMS_STP' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_stp_idx_buf size 2048 pagesize 8k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_stp_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_STP_INDEX' 20000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_idx_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_audit_buf size 4096 pagesize 32k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_audit_data pagesize 32k managed by database using (FILE '$DB_DATAPATH/CMS_AUDIT_DATA' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_audit_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_temp_buf size automatic pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 create temporary tablespace cms_temp pagesize 32768 managed by automatic storage bufferpool cms_temp_buf

"$DB2_HOME"/bin/db2 create bufferpool cms_user_buf size automatic pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 create user temporary tablespace cms_user_tblsp pagesize 8192 bufferpool cms_user_buf


"$DB2_HOME"/bin/db2 update dbm cfg using for "$DB_SCHEMA" query_heap_sz 16384 IMMEDIATE

"$DB2_HOME"/bin/db2 update database configuration for "$DB_SCHEMA" using stmtheap 32768 immediate 

"$DB2_HOME"/bin/db2 UPDATE DB CFG for "$DB_SCHEMA" USING APP_CTL_HEAP_SZ 256 

"$DB2_HOME"/bin/db2 update database configuration for "$DB_SCHEMA" using applheapsz 8192

"$DB2_HOME"/bin/db2 update database configuration for "$DB_SCHEMA" using app_ctl_heap_sz 8192

# "$DB2_HOME"/bin/db2 UPDATE DATABASE CONFIGURATION USING SHEAPTHRES_SHR 131072 IMMEDIATE  

# "$DB2_HOME"/bin/db2 UPDATE DATABASE CONFIGURATION USING SORTHEAP 65536 IMMEDIATE  

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using logfilsiz 10752

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using LOGPRIMARY 20

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using LOGSECOND  236

"$DB2_HOME"/bin/db2 db2set DB2_EVALUNCOMMITTED=ON

"$DB2_HOME"/bin/db2 update dbm cfg using maxagents 150	

"$DB2_HOME"/bin/db2 terminate

"$DB2_HOME"/bin/db2 db2stop force

"$DB2_HOME"/bin/db2 db2start

echo "----------------------------------------------";
echo "Loading data.....";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

"$DB2_HOME"/bin/db2 -tf cms_create_schema.sql -l cms_create_schema.log

"$DB2_HOME"/bin/db2 -tf cms_create_stp_schema.sql -l cms_create_stp_schema.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_facility.sql -l cms_create_schema_facility.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_batch.sql -l cms_create_schema_batch.log

"$DB2_HOME"/bin/db2 -tf cms_create_std_code_schema.sql -l cms_create_std_code_schema.log

"$DB2_HOME"/bin/db2 -tf drop_team_unique_index.sql -l drop_team_unique_index.log

"$DB2_HOME"/bin/db2 -tf cms_create_functions.sql -l cms_create_functions.log

"$DB2_HOME"/bin/db2 -tf cms_create_views.sql -l cms_create_views.log

"$DB2_HOME"/bin/db2 -tf cms_create_procedures.sql -l cms_create_procedures.log

"$DB2_HOME"/bin/db2 -tf cms_create_triggers.sql -l cms_create_triggers.log

echo "--------------------------------------------------";
echo "Data Setup.......";

"$DB2_HOME"/bin/db2 -tf cms_country_setup.sql -l cms_country_setup.log

"$DB2_HOME"/bin/db2 -tf cms_currency_setup.sql -l cms_currency_setup.log

"$DB2_HOME"/bin/db2 -tf cms_host_std_code_setup.sql -l cms_host_std_code_setup.log

"$DB2_HOME"/bin/db2 -tf cms_rlos_std_code_setup.sql -l cms_rlos_std_code_setup.log

"$DB2_HOME"/bin/db2 -tf cms_std_code_setup.sql -l cms_std_code_setup.log

"$DB2_HOME"/bin/db2 -tf cms_team_setup.sql -l cms_team_setup.log

"$DB2_HOME"/bin/db2 -tf cms_security_setup.sql -l cms_security_setup.log

"$DB2_HOME"/bin/db2 -tf cms_tr_state_matrix_setup.sql -l cms_tr_state_matrix_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP.sql -l cms_FAP.log

"$DB2_HOME"/bin/db2 -tf cms_todo_totrack_setup.sql -l cms_todo_totrack_setup.log

"$DB2_HOME"/bin/db2 -tf cms_user_setup.sql -l cms_user_setup.log

echo -------------------------------------------
echo ---------------- module setup ------------- 
echo -------------------------------------------

"$DB2_HOME"/bin/db2 -tf cms_module_tat_doc_setup.sql -l cms_module_tat_doc_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_manual_feed_setup.sql -l cms_module_manual_feed_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_asset_life_setup.sql -l cms_module_asset_life_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_common_code_maintenance_setup.sql -l cms_module_common_code_maintenance_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_creditriskparam_setup.sql -l cms_module_creditriskparam_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_liquidation_setup.sql -l cms_module_liquidation_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_property_index_setup.sql -l cms_module_property_index_setup.log

"$DB2_HOME"/bin/db2 -tf CMS_SYSTEM_BANK_AND_BRANCH_setup.sql -l CMS_SYSTEM_BANK_AND_BRANCH_setup.log

"$DB2_HOME"/bin/db2 -tf CMS_DIRECTOR_MASTER_setup.sql -l CMS_DIRECTOR_MASTER_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_credit_approval_setup.sql -l cms_module_credit_approval_setup.log

"$DB2_HOME"/bin/db2 -tf cms_credit_approval_setup.sql -l cms_credit_approval_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_bond_stock_mutual_insert_file_setup.sql -l cms_module_bond_stock_mutual_insert_file_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_common_update_setup.sql -l cms_module_common_update_setup.log

"$DB2_HOME"/bin/db2 -tf cms_rbicategory_setup.sql -l cms_rbicategory_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_rbicategory_setup.sql -l cms_module_rbicategory_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_security_envelope_setup.sql -l cms_module_security_envelope_setup.log

"$DB2_HOME"/bin/db2 -tf cms_report_setup.sql -l cms_report_setup.log

"$DB2_HOME"/bin/db2 -tf cms_notification_setup.sql -l cms_notification_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_security_perfection_procedure.sql -l cms_security_perfection_procedure.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_checklist_setup.sql -l cms_FAP_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_tr_state_matrix_checklist_setup.sql -l cms_tr_state_matrix_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_tr_state_matrix_facility_setup.sql -l cms_tr_state_matrix_facility_setup.log

"$DB2_HOME"/bin/db2 -tf cms_todo_totrack_checklist_setup.sql -l cms_todo_totrack_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_checklist_setup.sql -l cms_module_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_facility_setup.sql -l cms_FAP_facility_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_facility_setup.sql -l cms_module_facility_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_predeal_setup.sql -l cms_module_predeal_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_pledgor_setup.sql -l cms_FAP_pledgor_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_pledge_setup.sql -l cms_FAP_pledge_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_stp_setup.sql -l cms_module_stp_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_audit_trail_setup.sql -l cms_audit_trail_setup.log

echo "----------------------------------------------";
echo "	LMS    Patches Begin here ";
echo "----------------------------------------------";

"$DB2_HOME"/bin/db2 -tf lms_schema_patches.sql -l lms_schema_patches.log

"$DB2_HOME"/bin/db2 -tf lms_create_functions.sql -l lms_create_functions.log

"$DB2_HOME"/bin/db2 -tf lms_FAP.sql -l lms_FAP.log

"$DB2_HOME"/bin/db2 -tf lms_std_code_setup.sql -l lms_std_code_setup.log

"$DB2_HOME"/bin/db2 -tf lms_data_patches.sql -l lms_data_patches.log

"$DB2_HOME"/bin/db2 -tf lms_report_setup.sql -l lms_report_setup.log

echo -------------------------------------------
echo Setup for System Interface batch
echo -------------------------------------------

"$DB2_HOME"/bin/db2 -td@ -f cms_security_perfection_procedure.sql -l cms_security_perfection_procedure.log

cd system-interface

"$DB2_HOME"/bin/db2 -tf cms_system_interface_schema_setup.sql -l cms_system_interface_schema_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_function_setup.sql -l cms_system_interface_function_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_utility.sql -l cms_system_interface_utility.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_data_setup.sql -l cms_system_interface_data_setup.log

# "$DB2_HOME"/bin/db2 -tf cms_system_interface_index.sql -l cms_system_interface_index.log

cd ..

"$DB2_HOME"/bin/db2 "DECLARE GLOBAL TEMPORARY TABLE SESSION.NPL_ACCOUNT(LIMIT_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED"

"$DB2_HOME"/bin/db2 -td@ -f cms_collateral_allocation_CR015.sql -l cms_collateral_allocation_CR015.log

"$DB2_HOME"/bin/db2 -td@ -f cms_aggregation_procedure.sql -l cms_aggregation_procedure.log

"$DB2_HOME"/bin/db2 -td@ -f cms_limit_booking_procedure.sql -l cms_limit_booking_procedure.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_image_upload.sql -l cms_create_schema_image_upload.log

"$DB2_HOME"/bin/db2 -tf cms_image_upload_setup.sql -l cms_image_upload_setup.log


"$DB2_HOME"/bin/db2 -tf cms_create_schema_other_bank_branch.sql -l cms_create_schema_other_bank_branch.logcms_create_schema_other_bank_branch.log

"$DB2_HOME"/bin/db2 -tf cms_module_other_bank_branch_setup.sql -l cms_module_other_bank_branch_setup.log

cd system-interface

./run_system_interface.sh

echo "----------------------------------------------";
echo "Script ends.";
