
DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cmssit
DB_USER=cmssit
DB_PASSWD=cmssit123
DB_SCHEMA=cmssit

DB_DATAPATH=/db2/cmssit


echo "----------------------------------------------";
echo "Creating database.....";

#"$DB2_HOME"/bin/db2 create database "$DB_NAME"

mkdir $DB_DATAPATH
chmod 777 $DB_DATAPATH
"$DB2_HOME"/bin/db2 db2stop force

"$DB2_HOME"/bin/db2 db2start

"$DB2_HOME"/bin/db2 drop database $DB_NAME

"$DB2_HOME"/bin/db2 "create database $DB_NAME ON $DB_DATAPATH using codeset utf-8 territory us CATALOG TABLESPACE MANAGED BY DATABASE using ( FILE '$DB_DATAPATH/CATALOG.DAT' 125000) TEMPORARY TABLESPACE MANAGED BY SYSTEM using ( '$DB_DATAPATH/TEMPTS') USER TABLESPACE MANAGED BY DATABASE using ( FILE '$DB_DATAPATH/USERTTS.DAT' 50000 )"

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 create schema "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 create bufferpool cms_small_buf size 65536 pagesize 4096 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_small_data pagesize 4096 managed by database using (FILE '$DB_DATAPATH/CMS_SMALL_DATA' 2000000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_small_buf NO FILE SYSTEM CACHING"

"$DB2_HOME"/bin/db2 create bufferpool cms_buf size 4096 pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_data pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_DATA' 50000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_medium_buf size 2048 pagesize 16384 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_medium_data pagesize 16384 managed by database using (FILE '$DB_DATAPATH/CMS_MEDIUM_DATA' 8000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_medium_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_large_buf size 1024 pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_large_data pagesize 32768 managed by database using (FILE '$DB_DATAPATH/CMS_LARGE_DATA' 2000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_large_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_index_buf size 8192 pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_INDEX' 750000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_index_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_batch_buf size 8192 pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_batch pagesize 32768 managed by database using (FILE '$DB_DATAPATH/CMS_BATCH' 72500) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_batch_idx_buf size 8192 pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_batch_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_BATCH_INDEX' 100000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_batch_idx_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_temp_buf size 4096 pagesize 32768 extended storage

"$DB2_HOME"/bin/db2 create temporary tablespace cms_temp pagesize 32768 managed by automatic storage bufferpool cms_temp_buf

"$DB2_HOME"/bin/db2 create bufferpool cms_user_buf size 2048 pagesize 8192 extended storage

"$DB2_HOME"/bin/db2 create user temporary tablespace cms_user_tblsp pagesize 8192 bufferpool cms_user_buf

"$DB2_HOME"/bin/db2 create bufferpool cms_stp_buf size 4096 pagesize 16k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_stp pagesize 16384 managed by database using (FILE '$DB_DATAPATH/CMS_STP' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_stp_idx_buf size 6000 pagesize 8k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_stp_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_STP_INDEX' 20000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_stp_idx_buf"

"$DB2_HOME"/bin/db2 create bufferpool cms_audit_buf size 4096 pagesize 32k extended storage

"$DB2_HOME"/bin/db2 "create tablespace cms_audit_data pagesize 32k managed by database using (FILE '$DB_DATAPATH/CMS_AUDIT_DATA' 10000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_audit_buf"

"$DB2_HOME"/bin/db2 update dbm cfg using maxagents 50

"$DB2_HOME"/bin/db2 update dbm cfg using query_heap_sz 16384 IMMEDIATE

"$DB2_HOME"/bin/db2 update dbm cfg using DIAGPATH $DB2_PATH/db2dump IMMEDIATE

"$DB2_HOME"/bin/db2 update database configuration using stmtheap 16384 immediate 

# "$DB2_HOME"/bin/db2 update db cfg using app_ctl_heap_sz 256 

"$DB2_HOME"/bin/db2 update database configuration for "$DB_NAME" using applheapsz 8192

"$DB2_HOME"/bin/db2 update database configuration for "$DB_NAME" using app_ctl_heap_sz 8192

"$DB2_HOME"/bin/db2 update db cfg  using stat_heap_sz 16384 immediate

# "$DB2_HOME"/bin/db2 update database configuration using sheapthres_shr 131072 immediate  

# "$DB2_HOME"/bin/db2 update database configuration using sortheap 65536 immediate  

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using logfilsiz 10752

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using LOGPRIMARY 20

"$DB2_HOME"/bin/db2 update db cfg for "$DB_SCHEMA" using LOGSECOND  236

"$DB2_HOME"/adm/db2set db2_evaluncommitted=on

"$DB2_HOME"/bin/db2 terminate

"$DB2_HOME"/bin/db2 db2stop force

"$DB2_HOME"/bin/db2 db2start

echo "----------------------------------------------";
echo "Loading data.....";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"


echo "-------------------------------------------"
echo "schema setup"
echo "-------------------------------------------"
"$DB2_HOME"/bin/db2 -tf cms_create_schema.sql -l cms_create_schema.log

"$DB2_HOME"/bin/db2 -tf cms_create_stp_schema.sql -l cms_create_stp_schema.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_facility.sql -l cms_create_schema_facility.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_batch.sql -l cms_create_schema_batch.log

"$DB2_HOME"/bin/db2 -tf cms_create_std_code_schema.sql -l cms_create_std_code_schema.log

"$DB2_HOME"/bin/db2 -tf drop_team_unique_index.sql -l drop_team_unique_index.log

"$DB2_HOME"/bin/db2 -tf cms_module_tat_doc_setup.sql -l cms_module_tat_doc_setup.log

"$DB2_HOME"/bin/db2 -tf cms_create_functions.sql -l cms_create_functions.log

"$DB2_HOME"/bin/db2 -tf cms_create_views.sql -l cms_create_views.log

"$DB2_HOME"/bin/db2 -tf cms_create_functions2.sql -l cms_create_functions2.log

"$DB2_HOME"/bin/db2 -tf cms_create_procedures.sql -l cms_create_procedures.log

"$DB2_HOME"/bin/db2 -tf cms_create_triggers.sql -l cms_create_triggers.log

echo "--------------------------------"
echo "------ product setup ------- "
echo "--------------------------------"
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


echo "--------------------------------"
echo "------ module setup ------- "
echo "--------------------------------"
"$DB2_HOME"/bin/db2 -td! -vf cms_security_coverage_setup.sql -l cms_security_coverage_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_manual_feed_setup.sql -l cms_module_manual_feed_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_manual_input_setup.sql -l cms_module_manual_input_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_auto_valuation_setup.sql -l cms_module_auto_valuation_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_asset_life_setup.sql -l cms_module_asset_life_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_common_code_maintenance_setup.sql -l cms_module_common_code_maintenance_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_creditriskparam_setup.sql -l cms_module_creditriskparam_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_predeal_setup.sql -l cms_module_predeal_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_contract_financing_setup.sql -l cms_module_contract_financing_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_bridging_loan_setup.sql -l cms_module_bridging_loan_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_trading_book_setup.sql -l cms_module_trading_book_setup.log

#"$DB2_HOME"/bin/db2 -tf cms_module_interest_rate_setup.sql -l cms_module_interest_rate_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_liquidation_setup.sql -l cms_module_liquidation_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_property_index_setup.sql -l cms_module_property_index_setup.log

"$DB2_HOME"/bin/db2 -tf CMS_SYSTEM_BANK_AND_BRANCH_setup.sql -l CMS_SYSTEM_BANK_AND_BRANCH_setup.log

"$DB2_HOME"/bin/db2 -tf CMS_DIRECTOR_MASTER_setup.sql -l CMS_DIRECTOR_MASTER_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_credit_approval_setup.sql -l cms_module_credit_approval_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_bond_stock_mutual_insert_file_setup.sql -l cms_module_bond_stock_mutual_insert_file_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_common_update_setup.sql -l cms_module_common_update_setup.log

"$DB2_HOME"/bin/db2 -tf cms_credit_approval_setup.sql -l cms_credit_approval_setup.log

"$DB2_HOME"/bin/db2 -tf cms_rbicategory_setup.sql -l cms_rbicategory_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_rbicategory_setup.sql -l cms_module_rbicategory_setup.log

"$DB2_HOME"/bin/db2 -tf cms_report_setup.sql -l cms_report_setup.log

"$DB2_HOME"/bin/db2 -tf cms_notification_setup.sql -l cms_notification_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_security_perfection_procedure.sql -l cms_security_perfection_procedure.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_checklist_setup.sql -l cms_FAP_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_tr_state_matrix_checklist_setup.sql -l cms_tr_state_matrix_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_tr_state_matrix_facility_setup.sql -l cms_tr_state_matrix_facility_setup.log

"$DB2_HOME"/bin/db2 -tf cms_todo_totrack_checklist_setup.sql -l cms_todo_totrack_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_checklist_setup.sql -l cms_module_checklist_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_facility_setup.sql -l cms_FAP_facility_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_pledgor_setup.sql -l cms_FAP_pledgor_setup.log

"$DB2_HOME"/bin/db2 -tf cms_FAP_pledge_setup.sql -l cms_FAP_pledge_setup.log

"$DB2_HOME"/bin/db2 -tf cms_module_stp_setup.sql -l cms_module_stp_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_audit_trail_setup.sql -l cms_audit_trail_setup.log

"$DB2_HOME"/bin/db2 "DECLARE GLOBAL TEMPORARY TABLE SESSION.NPL_ACCOUNT(LIMIT_ID BIGINT) WITH REPLACE ON COMMIT PRESERVE ROWS NOT LOGGED"

"$DB2_HOME"/bin/db2 -td@ -f cms_collateral_allocation_setup.sql -l cms_collateral_allocation_setup.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_image_upload.sql -l cms_create_schema_image_upload.log

"$DB2_HOME"/bin/db2 -tf cms_image_upload_setup.sql -l cms_image_upload_setup.log

"$DB2_HOME"/bin/db2 -tf cms_create_schema_other_bank_branch.sql -l cms_create_schema_other_bank_branch.logcms_create_schema_other_bank_branch.log

"$DB2_HOME"/bin/db2 -tf cms_module_other_bank_branch_setup.sql -l cms_module_other_bank_branch_setup.log


. /db2/eoncms_fresh_db/system-interface/run_system_interface.sh

echo "----------------------------------------------";
echo "Script ends.";
