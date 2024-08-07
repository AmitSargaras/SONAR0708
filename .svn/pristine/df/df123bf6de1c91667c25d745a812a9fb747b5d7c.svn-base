DB2_HOME=/opt/IBM/db2/V9.1

DB_NAME=climssit
DB_USER=climssit
DB_PASSWD=climssit
DB_SCHEMA=climssit

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

# --------------------------------------------------
# Setup for System Interface batch / Migration
# --------------------------------------------------


"$DB2_HOME"/bin/db2 -tf cms_system_interface_ARBS_setup.sql -l cms_system_interface_ARBS_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_STOCKBANKING_setup.sql -l cms_system_interface_STOCKBANKING_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_BOSTRACS_setup.sql -l cms_system_interface_BOSTRACS_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_SEMA_setup.sql -l cms_system_interface_SEMA_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_TRADESPRING_setup.sql -l cms_system_interface_TRADESPRING_setup.log

"$DB2_HOME"/bin/db2 -tf cms_system_interface_MUREX_setup.sql -l cms_system_interface_MUREX_setup.log


"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_ARBS.sql -l cms_system_interface_stored_proc_validate_ARBS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_STOCKBANKING.sql -l cms_system_interface_stored_proc_validate_STOCKBANKING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_BOSTRACS.sql -l cms_system_interface_stored_proc_validate_BOSTRACS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_SEMA.sql -l cms_system_interface_stored_proc_validate_SEMA.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_TRADESPRING.sql -l cms_system_interface_stored_proc_validate_TRADESPRING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_validate_MUREX.sql -l cms_system_interface_stored_proc_validate_MUREX.log



"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_ARBS.sql -l cms_system_interface_stored_proc_ARBS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_STOCKBANKING.sql -l cms_system_interface_stored_proc_STOCKBANKING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_BOSTRACS.sql -l cms_system_interface_stored_proc_BOSTRACS.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_SEMA.sql -l cms_system_interface_stored_proc_SEMA.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_TRADESPRING.sql -l cms_system_interface_stored_proc_TRADESPRING.log

"$DB2_HOME"/bin/db2 -td@ -f cms_system_interface_stored_proc_MUREX.sql -l cms_system_interface_stored_proc_MUREX.log



"$DB2_HOME"/bin/db2 -tf cms_host_parameter_setup.sql -l cms_host_parameter_setup.log

"$DB2_HOME"/bin/db2 -td@ cms_host_parameter_stored_proc_setup.sql -l cms_host_parameter_stored_proc_setup.log