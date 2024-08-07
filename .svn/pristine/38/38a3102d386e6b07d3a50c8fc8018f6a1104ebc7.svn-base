MIGRATION SIBS GUIDELINES (Simplified Version)
==============================================
# Note:
- Make sure common code parameter pulled the latest data from sibs
- Make sure mimb stock feed executed
- Make sure to backup the production database before proceed. 
- Copy the backup image to external drive in binary mode.

cd 	db2/migration/mig_sibs/
1.		./migration_tablespace_setup.sh > log_migration_tablespace_setup.log &

cd 	db2/migration/mig_sibs/scripts/
2.		./mig_table_setup.sh > log_mig_table_setup.log &
3. 		./load_all.sh > log_load_all.log &
4.		./gen_qc_2.sh > log_gen_qc_2.log &

cd 	db2/migration/mig_sibs/scripts/
5.		./backupdb.sh > log_backupdb_0.log &
6.		./run_set_1.sh > log_run_set_1.log &
7.		./backupdb.sh > log_backupdb_1.log &

8.		./run_set_2.sh > log_run_set_2.log &
9.		./backupdb.sh > log_backupdb_2.log &

10.		./run_set_3.sh > log_run_set_3.log &
11.		./backupdb.sh > log_backupdb_2.log &

12.		./run_set_4.sh > log_run_set_4.log &
13.		./backupdb.sh > log_backupdb_4.log &

14.     ./run_after_migration.sh > log_run_after_migration.log &

15.		./gen_qc_7.sh > log_gen_qc_7.log &
16.		./gen_qc_8.sh > log_gen_qc_8.log &

cd 	db2/migration/mig_sibs/dbpatches-after-migrate/
17.		./run_patch.sh > log_run_patch.log &

# Set LOGRETAIN to on before the last backup
18. 	/opt/IBM/db2/V9.1/bin/db2 update db cfg for eoncms using LOGRETAIN ON immediate

cd 	db2/migration/mig_sibs/scripts/
19.		./backupdb.sh > log_backupdb_5.log &

cd 	db2/migration/mig_sibs/data_cleanup/
20.		./run_data_cleanup.sh > log_run_data_cleanup.log &

## THE STEPS BELOW IS NOT APPLICABLE DURING ACTUAL MIGRATION ##
- Backup the cms database in uat server
- Move the production migrated backup image to uat db server for restoration
21. 	./restoredb_tb.sh > log_restoredb_tb.log &