
DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=climssit
DB_USER=climssit
DB_PASSWD=climssit
DB_SCHEMA=climssit

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

# -------------------------------------------
# testing data setup
# -------------------------------------------
"$DB2_HOME"/bin/db2 -tf cms_test_predeal.sql -l cms_test_predeal.log

"$DB2_HOME"/bin/db2 -tf test_host_std_code_data.sql -l test_host_std_code_data.log

"$DB2_HOME"/bin/db2 -tf test_customer-0001.sql -l test_customer-0001.log

"$DB2_HOME"/bin/db2 -tf test_customer-0002.sql -l test_customer-0002.log

"$DB2_HOME"/bin/db2 -tf test_customer-0003.sql -l test_customer-0003.log

"$DB2_HOME"/bin/db2 -tf test_customer-0004.sql -l test_customer-0004.log

"$DB2_HOME"/bin/db2 -tf test_customer-0005.sql -l test_customer-0005.log

## ------ testing scenario for CR015 security allocation
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen001.sql -l test_alloc_scen001.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen002.sql -l test_alloc_scen002.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen003.sql -l test_alloc_scen003.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen004.sql -l test_alloc_scen004.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen005.sql -l test_alloc_scen005.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen006.sql -l test_alloc_scen006.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen007.sql -l test_alloc_scen007.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen008.sql -l test_alloc_scen008.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen009.sql -l test_alloc_scen009.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen010.sql -l test_alloc_scen010.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen011.sql -l test_alloc_scen011.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen012.sql -l test_alloc_scen012.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen013.sql -l test_alloc_scen013.log
#"$DB2_HOME"/bin/db2 -tf test_alloc_scen014.sql -l test_alloc_scen014.log

"$DB2_HOME"/bin/db2 -tf COMMON_CODE_CATEGORY_ENTRY.sql -l COMMON_CODE_CATEGORY_ENTRY.log

"$DB2_HOME"/bin/db2 -tf update_common_code.sql -l update_common_code.log

"$DB2_HOME"/bin/db2 -tf HOST_BRANCH.sql -l HOST_BRANCH.log

"$DB2_HOME"/bin/db2 -tf HOST_CENTRE.sql -l HOST_CENTRE.log

"$DB2_HOME"/bin/db2 -tf HOST_CUST_LMT.sql -l HOST_CUST_LMT.log

"$DB2_HOME"/bin/db2 -tf HOST_DEALER.sql -l HOST_DEALER.log

"$DB2_HOME"/bin/db2 -tf HOST_FACILITY_TYPE.sql -l HOST_FACILITY_TYPE.log

"$DB2_HOME"/bin/db2 -tf HOST_INSURANCE_CO.sql -l HOST_INSURANCE_CO.log

"$DB2_HOME"/bin/db2 -tf HOST_LAWYER.sql -l HOST_LAWYER.log

"$DB2_HOME"/bin/db2 -tf HOST_PRODUCT_PACKAGE.sql -l HOST_PRODUCT_PACKAGE.log

"$DB2_HOME"/bin/db2 -tf HOST_PRODUCT_TYPE.sql -l HOST_PRODUCT_TYPE.log

"$DB2_HOME"/bin/db2 -tf test_cms_forex_feed.sql -l test_cms_forex_feed.log

