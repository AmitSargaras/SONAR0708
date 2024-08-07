#!/bin/sh

. ../connect.sh

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup migration table, helper schema, function and procedure ...

"$DB2_HOME"/bin/db2 -tf migration_setup.sql -l migration_setup.log

"$DB2_HOME"/bin/db2 -tf migration_helper_schema.sql -l migration_helper_schema.log

"$DB2_HOME"/bin/db2 -td@ -f migration_helper_functions.sql -l migration_helper_functions.log

"$DB2_HOME"/bin/db2 -td@ -f migration_helper_procedures.sql -l migration_helper_procedures.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup validation and migrate procedure ...

"$DB2_HOME"/bin/db2 -td@ -f migration_validation_procedures.sql -l migration_validation_procedures.log

"$DB2_HOME"/bin/db2 -td@ -f migration_migrate_procedures.sql -l migration_migrate_procedures.log

"$DB2_HOME"/bin/db2 -td@ -f migration_post_procedures.sql -l migration_post_procedures.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Setup qc report schema ...

"$DB2_HOME"/bin/db2 -tf qc_report_schema.sql -l qc_report_schema.log

echo "-------------------------------------"
echo `date +"%Y/%m/%d %H:%M:%S"` Moving logs ...

mkdir logs
mv *.log ./logs

echo `date +"%Y/%m/%d %H:%M:%S"` Script Ends ... 
