rem -------------------------------------------
rem Connecting To DB
rem -------------------------------------------

db2 connect to ABCMS user db2admin using db2admin

db2 set current schema = ABCMS_LC

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,ABCMS_LC


rem   --------------------------------------------------------------------------------------------------------------------------------------------
rem   			L M S    Patches Begin here 
rem   --------------------------------------------------------------------------------------------------------------------------------------------

db2 -tf lms_schema_patches.sql -l lms_schema_patches.log

db2 -tf lms_create_functions.sql -l lms_create_functions.log 

db2 -tf lms_FAP.sql -l lms_FAP.log

db2 -tf lms_std_code_setup.sql -l lms_std_code_setup.log

db2 -tf lms_data_patches.sql -l lms_data_patches.log

db2 -tf lms_report_setup.sql -l lms_report_setup.log

db2 -td@ -f cms_aggregation_procedure.sql -l cms_aggregation_procedure.log

db2 -td@ -f cms_limit_booking_procedure.sql -l cms_limit_booking_procedure.log


rem --------------------------------------------------
rem Setup for System Interface batch / Migration
rem --------------------------------------------------


db2 -tf cms_system_interface_ARBS_setup.sql -l cms_system_interface_ARBS_setup.log

db2 -tf cms_system_interface_STOCKBANKING_setup.sql -l cms_system_interface_STOCKBANKING_setup.log

db2 -tf cms_system_interface_BOSTRACS_setup.sql -l cms_system_interface_BOSTRACS_setup.log

db2 -tf cms_system_interface_FINSYS_setup.sql -l cms_system_interface_FINSYS_setup.log

db2 -tf cms_system_interface_QUANTUM_setup.sql -l cms_system_interface_QUANTUM_setup.log

db2 -tf cms_system_interface_SEMA_setup.sql -l cms_system_interface_SEMA_setup.log

db2 -tf cms_system_interface_TRADESPRING_setup.sql -l cms_system_interface_TRADESPRING_setup.log

db2 -tf cms_system_interface_MUREX_setup.sql -l cms_system_interface_MUREX_setup.log


db2 -td@ -f cms_system_interface_stored_proc_validate_ARBS.sql -l cms_system_interface_stored_proc_validate_ARBS.log

db2 -td@ -f cms_system_interface_stored_proc_validate_STOCKBANKING.sql -l cms_system_interface_stored_proc_validate_STOCKBANKING.log

db2 -td@ -f cms_system_interface_stored_proc_validate_BOSTRACS.sql -l cms_system_interface_stored_proc_validate_BOSTRACS.log

db2 -td@ -f cms_system_interface_stored_proc_validate_FINSYS.sql -l cms_system_interface_stored_proc_validate_FINSYS.log

db2 -td@ -f cms_system_interface_stored_proc_validate_QUANTUM.sql -l cms_system_interface_stored_proc_validate_QUANTUM.log

db2 -td@ -f cms_system_interface_stored_proc_validate_SEMA.sql -l cms_system_interface_stored_proc_validate_SEMA.log

db2 -td@ -f cms_system_interface_stored_proc_validate_TRADESPRING.sql -l cms_system_interface_stored_proc_validate_TRADESPRING.log

db2 -td@ -f cms_system_interface_stored_proc_validate_MUREX.sql -l cms_system_interface_stored_proc_validate_MUREX.log


db2 -td@ -f cms_system_interface_stored_proc_ARBS.sql -l cms_system_interface_stored_proc_ARBS.log

db2 -td@ -f cms_system_interface_stored_proc_STOCKBANKING.sql -l cms_system_interface_stored_proc_STOCKBANKING.log

db2 -td@ -f cms_system_interface_stored_proc_BOSTRACS.sql -l cms_system_interface_stored_proc_BOSTRACS.log

db2 -td@ -f cms_system_interface_stored_proc_FINSYS.sql -l cms_system_interface_stored_proc_FINSYS.log

db2 -td@ -f cms_system_interface_stored_proc_QUANTUM.sql -l cms_system_interface_stored_proc_QUANTUM.log

db2 -td@ -f cms_system_interface_stored_proc_SEMA.sql -l cms_system_interface_stored_proc_SEMA.log

db2 -td@ -f cms_system_interface_stored_proc_TRADESPRING.sql -l cms_system_interface_stored_proc_TRADESPRING.log

db2 -td@ -f cms_system_interface_stored_proc_MUREX.sql -l cms_system_interface_stored_proc_MUREX.log


echo "----------------------------------------------";
echo "Script ends.";