@echo off

call .\setenv.cmd
call .\connect.cmd

mkdir logs

cd ..\db2-script

db2 -tf migration_setup.sql -l migration_setup.log

db2 -tf migration_helper_schema.sql -l migration_helper_schema.log

db2 -td@ -f migration_helper_functions.sql -l migration_helper_functions.log

db2 -td@ -f migration_helper_procedures.sql -l migration_helper_procedures.log

db2 -td@ -f migration_validation_procedures.sql -l migration_validation_procedures.log

db2 -td@ -f migration_migrate_procedures.sql -l migration_migrate_procedures.log

move *.log ..\batch-script\logs

cd ..\batch-script
