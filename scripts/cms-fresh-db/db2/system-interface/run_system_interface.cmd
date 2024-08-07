
set DB_NAME=ABCLIMS
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=ABCLIMS

db2 connect to %DB_NAME% user %DB_USER% using %DB_PASSWD%

db2 set current schema = %DB_SCHEMA%

db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,%DB_SCHEMA%


rem --------------------------------------------------
rem Setup for System Interface batch / Migration
rem --------------------------------------------------

db2 -tf cms_system_interface_ARBS_setup.sql -l cms_system_interface_ARBS_setup.log

db2 -tf cms_system_interface_STOCKBANKING_setup.sql -l cms_system_interface_STOCKBANKING_setup.log

db2 -tf cms_system_interface_BOSTRACS_setup.sql -l cms_system_interface_BOSTRACS_setup.log

db2 -tf cms_system_interface_SEMA_setup.sql -l cms_system_interface_SEMA_setup.log

db2 -tf cms_system_interface_TRADESPRING_setup.sql -l cms_system_interface_TRADESPRING_setup.log

db2 -tf cms_system_interface_MUREX_setup.sql -l cms_system_interface_MUREX_setup.log


db2 -td@ -f cms_system_interface_stored_proc_validate_ARBS.sql -l cms_system_interface_stored_proc_validate_ARBS.log

db2 -td@ -f cms_system_interface_stored_proc_validate_STOCKBANKING.sql -l cms_system_interface_stored_proc_validate_STOCKBANKING.log

db2 -td@ -f cms_system_interface_stored_proc_validate_BOSTRACS.sql -l cms_system_interface_stored_proc_validate_BOSTRACS.log

db2 -td@ -f cms_system_interface_stored_proc_validate_SEMA.sql -l cms_system_interface_stored_proc_validate_SEMA.log

db2 -td@ -f cms_system_interface_stored_proc_validate_TRADESPRING.sql -l cms_system_interface_stored_proc_validate_TRADESPRING.log

db2 -td@ -f cms_system_interface_stored_proc_validate_MUREX.sql -l cms_system_interface_stored_proc_validate_MUREX.log


db2 -td@ -f cms_system_interface_stored_proc_ARBS.sql -l cms_system_interface_stored_proc_ARBS.log

db2 -td@ -f cms_system_interface_stored_proc_STOCKBANKING.sql -l cms_system_interface_stored_proc_STOCKBANKING.log

db2 -td@ -f cms_system_interface_stored_proc_BOSTRACS.sql -l cms_system_interface_stored_proc_BOSTRACS.log

db2 -td@ -f cms_system_interface_stored_proc_SEMA.sql -l cms_system_interface_stored_proc_SEMA.log

db2 -td@ -f cms_system_interface_stored_proc_TRADESPRING.sql -l cms_system_interface_stored_proc_TRADESPRING.log

db2 -td@ -f cms_system_interface_stored_proc_MUREX.sql -l cms_system_interface_stored_proc_MUREX.log

db2 -tf cms_host_parameter_setup.sql -l cms_host_parameter_setup.log

db2 -td@ cms_host_parameter_stored_proc_setup.sql -l cms_host_parameter_stored_proc_setup.log