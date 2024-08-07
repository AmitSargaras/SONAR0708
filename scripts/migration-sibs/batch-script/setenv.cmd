REM Db2 path and settings
set DB_NAME=EONCMS
set DB_USER=db2admin
set DB_PASSWD=db2admin
set DB_SCHEMA=EONCMS_LOCAL

Rem Source file/ Source message path
set MSG_DIR=source_file

REM Log path
set LOAD_LOG=%CD%\load_log
set DUMPPATH=%LOAD_LOG%

REM For QC reports
set QC_PATH=qc_reports
set QC_LOG_PATH=qc_reports\log

REM DB  backup dump file path
set DB_DUMPPATH=C:\migration\dbbackup
set DB_RESTOREPATH=C:\migration\dbrestore

REM Tablespace path
set DB_DATAPATH=C:\DB2\EONCMS