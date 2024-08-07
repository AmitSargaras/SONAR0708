echo "----------------------------------------------";
echo "create migration tables.....";

. set_mig_env.sh

"$DB2_HOME"/bin/db2 -tf cms_create_mig_error_log.sql -l cms_create_mig_error_log.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB100_tables.sql -l cms_create_mig_AB100_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB101_tables.sql -l cms_create_mig_AB101_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB102_tables.sql -l cms_create_mig_AB102_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB103_tables.sql -l cms_create_mig_AB103_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB109_tables.sql -l cms_create_mig_AB109_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB110_tables.sql -l cms_create_mig_AB110_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_AB111_tables.sql -l cms_create_mig_AB111_tables.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_CL.sql -l cms_create_mig_CL.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_CS.sql -l cms_create_mig_CS.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_DC.sql -l cms_create_mig_DC.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_GT.sql -l cms_create_mig_GT.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_IN.sql -l cms_create_mig_IN.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_MS.sql -l cms_create_mig_MS.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_OT.sql -l cms_create_mig_OT.log

"$DB2_HOME"/bin/db2 -tf cms_create_mig_PT.sql -l cms_create_mig_PT.log

