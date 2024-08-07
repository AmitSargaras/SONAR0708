
DB2_HOME=/usr/opt/db2/V9.1

DB_NAME=gcms_uat
DB_USER=gcms_uat
DB_PASSWD=gcms_uat
DB_SCHEMA=GCMS_UAT

echo "----------------------------------------------";
echo "Loading test data.....";

"$DB2_HOME"/bin/db2 connect to "$DB_NAME" user "$DB_USER" using "$DB_PASSWD"

"$DB2_HOME"/bin/db2 set current schema = "$DB_SCHEMA"

"$DB2_HOME"/bin/db2 SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM,"$DB_SCHEMA"

"$DB2_HOME"/bin/db2 -tf testing_data_setup.sql -l testing_data_setup.log

"$DB2_HOME"/bin/db2 -tf testing_10000002_setup.sql -l testing_10000002_setup.log

"$DB2_HOME"/bin/db2 -tf testing_BWCIF00001_setup.sql -l testing_BWCIF00001_setup.log

"$DB2_HOME"/bin/db2 -tf testing_GCIF00002_setup.sql -l testing_GCIF00002_setup.log

"$DB2_HOME"/bin/db2 -tf testing_GCIF00005_tradingbook.sql -l testing_GCIF00005_tradingbook.log

"$DB2_HOME"/bin/db2 -tf testing_GCIF00006_tradingbook.sql -l testing_GCIF00006_tradingbook.log


echo "----------------------------------------------";
echo "Script ends.";
