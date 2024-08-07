#!/bin/sh

. ../setenv.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Connect to database ...

. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Start post migration procedures ...

echo `date +"%Y/%m/%d %H:%M:%S"` Reorg table ...
. ./reorg_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat on indexes ...
. ./runstat_all.sh

echo `date +"%Y/%m/%d %H:%M:%S"` Rebind Post Migration Procedures ...
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_STP_TRANS_FAC', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_STP_TRANS_COL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'MIG_POPULATE_VAL_TO_SEC_TBL', 'ANY')";
"$DB2_HOME"/bin/db2 "CALL SYSPROC.REBIND_ROUTINE_PACKAGE('P', 'AUTO_CREATE_CHECKLIST', 'ANY')";


echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create STP transaction ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_STP_TRANS_FAC

echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create STP transaction ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_STP_TRANS_COL

echo `date +"%Y/%m/%d %H:%M:%S"` Start updating valuation details to security table ...
"$DB2_HOME"/bin/db2 CALL MIG_POPULATE_VAL_TO_SEC_TBL

echo `date +"%Y/%m/%d %H:%M:%S"` Migrate: Create checklist ...
"$DB2_HOME"/bin/db2 CALL AUTO_CREATE_CHECKLIST

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Script end.