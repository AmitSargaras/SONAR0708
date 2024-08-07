@echo off

call .\setenv.cmd

set DB_DRIVE=F:
set DB_DATAPATH=%DB_DRIVE%\DB2\NODE0000\CMS_MIG

echo ----------------------------------------------
echo Setting up migration tablespace ...

db2 drop tablespace cms_mig

db2 drop tablespace cms_mig_index

db2 drop bufferpool cms_mig_buf

db2 drop bufferpool cms_mig_idx_buf

db2 create bufferpool cms_mig_buf size 8192 pagesize 8192 extended storage

db2 create tablespace cms_mig pagesize 8192 managed by database using (FILE '%DB_DATAPATH%\CMS_MIGRATION' 500000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_mig_buf



db2 create bufferpool cms_mig_idx_buf size 2048 pagesize 8k extended storage

db2 create tablespace cms_mig_index pagesize 8192 managed by database using (FILE '%DB_DATAPATH%\CMS_MIGRATION_INDEX' 210000) AUTORESIZE YES INCREASESIZE 100 M MAXSIZE NONE bufferpool cms_mig_idx_buf


echo ----------------------------------------------
echo Configuring size of the transaction log ...

REM db2 update db cfg for %DB_NAME% using LOGFILSIZ 10752

REM db2 update db cfg for %DB_NAME% using LOGPRIMARY 10

REM db2 update db cfg for %DB_NAME% using LOGSECOND 246

echo ----------------------------------------------
echo Enabling circular logging and disabling achive method ...

db2 update db cfg for %DB_NAME% using LOGARCHMETH1 OFF

db2 update db cfg for %DB_NAME% using LOGARCHMETH2 OFF

db2 update db cfg for %DB_NAME% using LOGRETAIN OFF

db2 update db cfg for %DB_NAME% using USEREXIT OFF

echo ----------------------------------------------
echo Reducing space map page contention by disabling track mode ...

db2 update db cfg for %DB_NAME% using TRACKMOD OFF

echo ----------------------------------------------
echo Disabling automatic maintenance from database manager ...

db2 update db cfg for %DB_NAME% using AUTO_MAINT OFF

db2 update db cfg for %DB_NAME% using AUTO_DB_BACKUP OFF

db2 update db cfg for %DB_NAME% using AUTO_TBL_MAINT OFF

db2 update db cfg for %DB_NAME% using AUTO_RUNSTATS OFF

db2 update db cfg for %DB_NAME% using AUTO_STATS_PROF OFF

db2 update db cfg for %DB_NAME% using AUTO_PROF_UPD OFF

db2 update db cfg for %DB_NAME% using AUTO_REORG OFF

echo ----------------------------------------------
echo Enabling monitoring for performance ...

db2 update dbm cfg using DFT_MON_BUFPOOL ON

db2 update dbm cfg using DFT_MON_LOCK ON

db2 update dbm cfg using DFT_MON_SORT ON

db2 update dbm cfg using DFT_MON_STMT ON

db2 update dbm cfg using DFT_MON_TABLE ON

db2 update dbm cfg using DFT_MON_TIMESTAMP ON

db2 update dbm cfg using DFT_MON_UOW ON

db2 update dbm cfg using HEALTH_MON ON

REM echo ----------------------------------------------
REM echo Setting to use multiple processors

REM db2 update dbm cfg using intra_parallel yes

REM db2 update dbm cfg using max_querydegree 4

REM db2 update db cfg for %DB_NAME% using dft_degree -1