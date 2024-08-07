# Eoncms Db2 path and settings
DB2_HOME=/opt/IBM/db2/V9.1
DB_NAME=EONCMS
DB_USER=eoncms
DB_PASSWD=eoncms
DB_SCHEMA=EONCMS

# EonRlos database settings - used in locking and unlock database
RLOS_DB_NAME=EONRLOS
RLOS_USERNAME=rlos
RLOS_PASSWORD=rlos
RLOS_SCHEMA=RLOS

# Tablespace path
DB_DATAPATH=/data/EONCMS

#Source file/ Source message path
MSG_DIR=source_file

# Log path
LOAD_LOG=/data/testing/mig_sibs/scripts/load_log
DUMPPATH=$LOAD_LOG
TEMPFILE_PATH=$LOAD_LOG

# For QC reports
QC_PATH=qc_reports
QC_LOG_PATH=$QC_PATH/log

# DB  backup dump file path
DB_DUMPPATH=/db2/eonrlos_backup
DB_RESTOREPATH=/data/testing/dbrestore


export DB2_HOME;