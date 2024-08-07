
. ./setenv.sh
. ./connect.sh

echo "----------------------------------------------"
echo "Alter bufferpools and tablespace for actual or staging table ..."

"$DB2_HOME"/bin/db2 "alter tablespace cms_small_data resize (all 2530000)"

"$DB2_HOME"/bin/db2 "alter tablespace cms_data resize (all 165000)"

"$DB2_HOME"/bin/db2 "alter tablespace cms_medium_data resize (all 25000)"

"$DB2_HOME"/bin/db2 "alter tablespace cms_index resize (all 960000)"

"$DB2_HOME"/bin/db2 "alter tablespace cms_stp resize (all 46000)"

"$DB2_HOME"/bin/db2 "alter tablespace cms_stp_index resize (all 73000)"

echo "Creating migration bufferpools and tablespace ..."

"$DB2_HOME"/bin/db2 drop tablespace cms_mig

"$DB2_HOME"/bin/db2 drop tablespace cms_mig_index

"$DB2_HOME"/bin/db2 drop bufferpool cms_mig_buf 

"$DB2_HOME"/bin/db2 drop bufferpool cms_mig_idx_buf

"$DB2_HOME"/bin/db2 create bufferpool cms_mig_buf size 8192 pagesize 8192 extended storage


"$DB2_HOME"/bin/db2 "create tablespace cms_mig pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_MIGRATION.dat' 500000 ) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_mig_buf"



"$DB2_HOME"/bin/db2 create bufferpool cms_mig_idx_buf size 2048 pagesize 8192 extended storage


"$DB2_HOME"/bin/db2 "create tablespace cms_mig_index pagesize 8192 managed by database using (FILE '$DB_DATAPATH/CMS_MIGRATION_INDEX.dat' 210000 ) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_mig_idx_buf"

"$DB2_HOME"/bin/db2 alter bufferpool cms_mig_buf size automatic

"$DB2_HOME"/bin/db2 alter bufferpool cms_mig_idx_buf size automatic

echo "----------------------------------------------"
echo "Configuring size of the transaction log ..."

#"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGFILSIZ 10752

#"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGPRIMARY 30

#"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGSECOND 226

echo "----------------------------------------------"
echo "Enabling circular logging and disabling achive method ..."

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGARCHMETH1 OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGARCHMETH2 OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using LOGRETAIN OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using USEREXIT OFF

echo "----------------------------------------------"
echo "Reducing space map page contention by disabling track mode ..."

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using TRACKMOD OFF

echo "----------------------------------------------"
echo "Disabling automatic maintenance from database manager ..."

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_MAINT OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_DB_BACKUP OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_TBL_MAINT OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_RUNSTATS OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_STATS_PROF OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_PROF_UPD OFF

"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using AUTO_REORG OFF

echo "----------------------------------------------"
echo "Enabling db2 monitoring for performance ..."

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_BUFPOOL ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_LOCK ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_SORT ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_STMT ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_TABLE ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_TIMESTAMP ON

"$DB2_HOME"/bin/db2 update dbm cfg using DFT_MON_UOW ON

"$DB2_HOME"/bin/db2 update dbm cfg using HEALTH_MON ON

echo "----------------------------------------------"
#echo "Testing - Setting to use multiple processors"

#"$DB2_HOME"/bin/db2 update dbm cfg using intra_parallel yes

#"$DB2_HOME"/bin/db2 update dbm cfg using max_querydegree 4

#"$DB2_HOME"/bin/db2 update db cfg for $DB_NAME using dft_degree -1

echo "----------------------------------------------"

"$DB2_HOME"/bin/db2 force application all

"$DB2_HOME"/bin/db2 terminate

"$DB2_HOME"/bin/db2 db2stop

"$DB2_HOME"/bin/db2 db2start

echo "----------------------------------------------"
echo "Scripts end."