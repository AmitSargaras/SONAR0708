set DB_NAME=EONCMS
set DB_USER=db2admin
set DB_PASSWD=password
set DB_SCHEMA=EONCMS_LOCAL

db2 connect to %DB_NAME% user %DB_USER% using %DB_PASSWD%
db2 set current schema = %DB_SCHEMA%
db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,%DB_SCHEMA%

db2 -tvf temp_table_rpt.sql -z report_on_temp_table.log
db2 -tvf actual_table_rpt.sql -z report_on_actual_table.log


