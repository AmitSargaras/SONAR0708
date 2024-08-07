#!/bin/sh

. ../setenv.sh
. ../connect.sh

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Run statistic ...

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Customer Information ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CU001_CU')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Application Information ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA001_AA')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit CA - Joint Borrowers Info ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA002_JB')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Master ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_1')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility BNM ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_2_BNM')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Officer ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_3_OFF')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Relationship ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_4_REL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Insurance ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_5_INS')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Multi Tier Financing ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_6_MUL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility Islamic Master ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_7_ISL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Credit Facility BBA Vari Package ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA003_8_BBA')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: CA - Limit Account Info ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CA004')"


echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Asset Based - Vehicle, Plant and Equipment ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO001_AB')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Asset Based - Gold ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO002_AB_GOLD')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Deposit ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO005_CS')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral - Marketable Security - Stocks ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO008_MS')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Property ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO009_PT')"

echo `date +"%Y/%m/%d %H:%M:%S"` Rusntat: Collateral Guarantees ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO010_GT')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Others ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO011_OT')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Insurance Protection ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO012_IN')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Clean ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO014_CL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Valuation Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO015_VL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Insurance Policy Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO016_IN')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Charge Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO017_CD')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Pledgor Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO018_PG')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Collateral Pledge Information ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('MIG_CO019_PL')"


echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Customer ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('SCI_LE_MAIN_PROFILE')"
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('SCI_LE_SUB_PROFILE')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: AA ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('SCI_LSP_LMT_PROFILE')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Limit ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('SCI_LSP_APPR_LMTS')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Pledgor ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('SCI_PLEDGOR_DTL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Stage Plegor ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('STAGE_PLEDGOR_DTL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Security ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_SECURITY')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Stage Security ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_STAGE_SECURITY')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Security Sub Type ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_SECURITY_SUB_TYPE')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Charge Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_CHARGE_DETAIL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Stage Charge Detail ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_STAGE_CHARGE_DETAIL')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Portfolio Item ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_PORTFOLIO_ITEM')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Stage Portfolio Item ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_STAGE_PORTFOLIO_ITEM')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Price Feed ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_PRICE_FEED')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Limit Security Map ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_LIMIT_SECURITY_MAP')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Stage Limit Security Map ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_STAGE_LIMIT_SECURITY_MAP')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Facility Master ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_FACILITY_MASTER')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Facility Officer ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_FAC_OFFICER')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Fac Relationship ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_FAC_RELATIONSHIP')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Facility Insurance ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('CMS_FAC_INSURANCE')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Common Code Category Entry ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('COMMON_CODE_CATEGORY_ENTRY')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Transaction ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('TRANSACTION')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: STP Trans ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('STP_TRANS')"

echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: STP Master Trans ...
"$DB2_HOME"/bin/db2 "CALL RUNSTATS_HELPER ('STP_MASTER_TRANS')"

echo -------------------------------------
echo `date +"%Y/%m/%d %H:%M:%S"` Runstat: Script end.