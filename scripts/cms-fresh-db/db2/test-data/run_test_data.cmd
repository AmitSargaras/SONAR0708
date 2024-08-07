
set DB_NAME=ABCLIMS
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=ABCLIMS


db2 connect to %DB_NAME% user %DB_USER% using %DB_PASSWD%

db2 set current schema = %DB_SCHEMA%

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,%DB_SCHEMA%

rem -------------------------------------------
rem testing data setup
rem -------------------------------------------

db2 -tf cms_test_predeal.sql -l cms_test_predeal.log

db2 -tf test_host_std_code_data.sql -l test_host_std_code_data.log

db2 -tf test_customer-0001.sql -l test_customer-0001.log

db2 -tf test_customer-0002.sql -l test_customer-0002.log

db2 -tf test_customer-0003.sql -l test_customer-0003.log

db2 -tf test_customer-0004.sql -l test_customer-0004.log

db2 -tf test_customer-0005.sql -l test_customer-0005.log

rem ------ testing scenario for CR015 security allocation
rem db2 -tf test_alloc_scen001.sql -l test_alloc_scen001.log
rem db2 -tf test_alloc_scen002.sql -l test_alloc_scen002.log
rem db2 -tf test_alloc_scen003.sql -l test_alloc_scen003.log
rem db2 -tf test_alloc_scen004.sql -l test_alloc_scen004.log
rem db2 -tf test_alloc_scen005.sql -l test_alloc_scen005.log
rem db2 -tf test_alloc_scen006.sql -l test_alloc_scen006.log
rem db2 -tf test_alloc_scen007.sql -l test_alloc_scen007.log
rem db2 -tf test_alloc_scen008.sql -l test_alloc_scen008.log
rem db2 -tf test_alloc_scen009.sql -l test_alloc_scen009.log
rem db2 -tf test_alloc_scen010.sql -l test_alloc_scen010.log
rem db2 -tf test_alloc_scen011.sql -l test_alloc_scen011.log
rem db2 -tf test_alloc_scen012.sql -l test_alloc_scen012.log
rem db2 -tf test_alloc_scen013.sql -l test_alloc_scen013.log
rem db2 -tf test_alloc_scen014.sql -l test_alloc_scen014.log

db2 -tf COMMON_CODE_CATEGORY_ENTRY.sql -l COMMON_CODE_CATEGORY_ENTRY.log

db2 -tf update_common_code.sql -l update_common_code.log

db2 -tf HOST_BRANCH.sql -l HOST_BRANCH.log

db2 -tf HOST_CENTRE.sql -l HOST_CENTRE.log

db2 -tf HOST_CUST_LMT.sql -l HOST_CUST_LMT.log

db2 -tf HOST_DEALER.sql -l HOST_DEALER.log

db2 -tf HOST_FACILITY_TYPE.sql -l HOST_FACILITY_TYPE.log

db2 -tf HOST_INSURANCE_CO.sql -l HOST_INSURANCE_CO.log

db2 -tf HOST_LAWYER.sql -l HOST_LAWYER.log

db2 -tf HOST_PRODUCT_PACKAGE.sql -l HOST_PRODUCT_PACKAGE.log

db2 -tf HOST_PRODUCT_TYPE.sql -l HOST_PRODUCT_TYPE.log

rem db2 -tf CMS_WORKING_DAYS.sql -l CMS_WORKING_DAYS.log

db2 -tf test_cms_forex_feed.sql -l test_cms_forex_feed.log

rem db2 -tf test_cms_working_day.sql -l test_cms_working_day.log

