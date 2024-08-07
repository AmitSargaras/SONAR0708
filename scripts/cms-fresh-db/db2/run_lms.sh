
DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=cms
DB_USER=cms
DB_PASSWD=cms
DB_SCHEMA=cms

echo "----------------------------------------------";
echo "Loading data.....";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

echo "----------------------------------------------";
echo "	L M S    Patches Begin here ";
echo "----------------------------------------------";

"$DB2_HOME"/bin/db2 -tf lms_schema_patches.sql -l lms_schema_patches.log

"$DB2_HOME"/bin/db2 -tf lms_create_functions.sql -l lms_create_functions.log

"$DB2_HOME"/bin/db2 -tf lms_FAP.sql -l lms_FAP.log

"$DB2_HOME"/bin/db2 -tf lms_std_code_setup.sql -l lms_std_code_setup.log

"$DB2_HOME"/bin/db2 -tf lms_data_patches.sql -l lms_data_patches.log

"$DB2_HOME"/bin/db2 -tf lms_report_setup.sql -l lms_report_setup.log

"$DB2_HOME"/bin/db2 -td@ -f cms_aggregation_procedure.sql -l cms_aggregation_procedure.log

"$DB2_HOME"/bin/db2 -td@ -f cms_limit_booking_procedure.sql -l cms_limit_booking_procedure.log

echo "--------------------------------------";
echo "System interface DB setup ..... ";

"$DB2_HOME"/bin/db2 -tf cms_system_interface_ARBS_setup.sql -l cms_system_interface_ARBS_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_STOCKBANKING_setup.sql -l cms_system_interface_STOCKBANKING_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_BOSTRACS_setup.sql -l cms_system_interface_BOSTRACS_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_FINSYS_setup.sql -l cms_system_interface_FINSYS_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_QUANTUM_setup.sql -l cms_system_interface_QUANTUM_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_SEMA_setup.sql -l cms_system_interface_SEMA_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_TRADESPRING_setup.sql -l cms_system_interface_TRADESPRING_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_MUREX_setup.sql -l cms_system_interface_MUREX_setup.log

echo "--------------------------------------";
echo "System interface validate setup ..... ";
"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_ARBS.sql -l cms_system_interface_stored_proc_validate_ARBS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_STOCKBANKING.sql -l cms_system_interface_stored_proc_validate_STOCKBANKING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_BOSTRACS.sql -l cms_system_interface_stored_proc_validate_BOSTRACS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_FINSYS.sql -l cms_system_interface_stored_proc_validate_FINSYS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_QUANTUM.sql -l cms_system_interface_stored_proc_validate_QUANTUM.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_SEMA.sql -l cms_system_interface_stored_proc_validate_SEMA.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_TRADESPRING.sql -l cms_system_interface_stored_proc_validate_TRADESPRING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_MUREX.sql -l cms_system_interface_stored_proc_validate_MUREX.log

echo "--------------------------------------";
echo "System interface procedure setup ..... ";
"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_ARBS.sql -l cms_system_interface_stored_proc_ARBS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_STOCKBANKING.sql -l cms_system_interface_stored_proc_STOCKBANKING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_BOSTRACS.sql -l cms_system_interface_stored_proc_BOSTRACS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_FINSYS.sql -l cms_system_interface_stored_proc_FINSYS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_QUANTUM.sql -l cms_system_interface_stored_proc_QUANTUM.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_SEMA.sql -l cms_system_interface_stored_proc_SEMA.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_TRADESPRING.sql -l cms_system_interface_stored_proc_TRADESPRING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_MUREX.sql -l cms_system_interface_stored_proc_MUREX.log

echo "----------------------------------------------";
echo "Script ends.";
