@echo off

call ..\setenv.cmd
call ..\connect.cmd

echo -------------------------------------
echo %date% - %time% Run statistic ...

echo %date% - %time% Runstat: Customer Information ...
db2 CALL RUNSTATS_HELPER('MIG_CU001_CU')

echo %date% - %time% Runstat: Credit Application Information ...
db2 CALL RUNSTATS_HELPER('MIG_CA001_AA')

echo %date% - %time% Runstat: Credit CA - Joint Borrowers Info ...
db2 CALL RUNSTATS_HELPER('MIG_CA002_JB')

echo %date% - %time% Runstat: Credit Facility Master ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_1')

echo %date% - %time% Runstat: Credit Facility BNM ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_2_BNM')

echo %date% - %time% Runstat: Credit Facility Officer ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_3_OFF')

echo %date% - %time% Runstat: Credit Facility Relationship ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_4_REL')

echo %date% - %time% Runstat: Credit Facility Insurance ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_5_INS')

echo %date% - %time% Runstat: Credit Facility Multi Tier Financing ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_6_MUL')

echo %date% - %time% Runstat: Credit Facility Islamic Master ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_7_ISL')

echo %date% - %time% Runstat: Credit Facility BBA Vari Package ...
db2 CALL RUNSTATS_HELPER('MIG_CA003_8_BBA')

echo %date% - %time% Runstat: CA - Limit Account Info ...
db2 CALL RUNSTATS_HELPER('MIG_CA004')


echo %date% - %time% Runstat: Collateral Asset Based - Vehicle, Plant and Equipment ...
db2 CALL RUNSTATS_HELPER('MIG_CO001_AB')

echo %date% - %time% Runstat: Collateral Asset Based - Gold ...
db2 CALL RUNSTATS_HELPER('MIG_CO002_AB_GOLD')

echo %date% - %time% Runstat: Collateral Deposit ...
db2 CALL RUNSTATS_HELPER('MIG_CO005_CS')

echo %date% - %time% Runstat: Collateral - Marketable Security - Stocks ...
db2 CALL RUNSTATS_HELPER('MIG_CO008_MS')

echo %date% - %time% Runstat: Collateral Property ...
db2 CALL RUNSTATS_HELPER('MIG_CO009_PT')

echo %date% - %time% Rusntat: Collateral Guarantees ...
db2 CALL RUNSTATS_HELPER('MIG_CO010_GT')

echo %date% - %time% Runstat: Collateral Others ...
db2 CALL RUNSTATS_HELPER('MIG_CO011_OT')

echo %date% - %time% Runstat: Collateral Insurance Protection ...
db2 CALL RUNSTATS_HELPER('MIG_CO012_IN')

echo %date% - %time% Runstat: Collateral Clean ...
db2 CALL RUNSTATS_HELPER('MIG_CO014_CL')

echo %date% - %time% Runstat: Collateral Valuation Detail ...
db2 CALL RUNSTATS_HELPER('MIG_CO015_VL')

echo %date% - %time% Runstat: Collateral Insurance Policy Detail ...
db2 CALL RUNSTATS_HELPER('MIG_CO016_IN')

echo %date% - %time% Runstat: Collateral Charge Detail ...
db2 CALL RUNSTATS_HELPER('MIG_CO017_CD')

echo %date% - %time% Runstat: Collateral Pledgor Detail ...
db2 CALL RUNSTATS_HELPER('MIG_CO018_PG')

echo %date% - %time% Runstat: Collateral Pledge Information ...
db2 CALL RUNSTATS_HELPER('MIG_CO019_PL')


echo %date% - %time% Runstat: Limit ...
db2 CALL RUNSTATS_HELPER('SCI_LSP_APPR_LMTS')

echo %date% - %time% Runstat: Pledgor ...
db2 CALL RUNSTATS_HELPER('SCI_PLEDGOR_DTL')

echo %date% - %time% Runstat: Stage Plegor ...
db2 CALL RUNSTATS_HELPER('STAGE_PLEDGOR_DTL')

echo %date% - %time% Runstat: Security ...
db2 CALL RUNSTATS_HELPER('CMS_SECURITY')

echo %date% - %time% Runstat: Stage Security ...
db2 CALL RUNSTATS_HELPER('CMS_STAGE_SECURITY')

echo %date% - %time% Runstat: Security Sub Type ...
db2 CALL RUNSTATS_HELPER('CMS_SECURITY_SUB_TYPE')

echo %date% - %time% Runstat: Charge Detail ...
db2 CALL RUNSTATS_HELPER('CMS_CHARGE_DETAIL')

echo %date% - %time% Runstat: Stage Charge Detail ...
db2 CALL RUNSTATS_HELPER('CMS_STAGE_CHARGE_DETAIL')

echo %date% - %time% Runstat: Portfolio Item ...
db2 CALL RUNSTATS_HELPER('CMS_PORTFOLIO_ITEM')

echo %date% - %time% Runstat: Stage Portfolio Item ...
db2 CALL RUNSTATS_HELPER('CMS_STAGE_PORTFOLIO_ITEM')

echo %date% - %time% Runstat: Price Feed ...
db2 CALL RUNSTATS_HELPER('CMS_PRICE_FEED')

echo %date% - %time% Runstat: Limit Security Map ...
db2 CALL RUNSTATS_HELPER('CMS_LIMIT_SECURITY_MAP')

echo %date% - %time% Runstat: Stage Limit Security Map ...
db2 CALL RUNSTATS_HELPER('CMS_STAGE_LIMIT_SECURITY_MAP')

echo %date% - %time% Runstat: Facility Master ...
db2 CALL RUNSTATS_HELPER('CMS_FACILITY_MASTER')

echo %date% - %time% Runstat: Facility Officer ...
db2 CALL RUNSTATS_HELPER('CMS_FAC_OFFICER')

echo %date% - %time% Runstat: Fac Relationship ...
db2 CALL RUNSTATS_HELPER('CMS_FAC_RELATIONSHIP')

echo %date% - %time% Runstat: Facility Insurance ...
db2 CALL RUNSTATS_HELPER('CMS_FAC_INSURANCE')

echo %date% - %time% Runstat: Common Code Category Entry ...
db2 CALL RUNSTATS_HELPER('COMMON_CODE_CATEGORY_ENTRY')

echo %date% - %time% Runstat: Transaction ...
db2 CALL RUNSTATS_HELPER('TRANSACTION')

echo %date% - %time% Runstat: STP Trans ...
db2 CALL RUNSTATS_HELPER('STP_TRANS')

echo %date% - %time% Runstat: STP Master Trans ...
db2 CALL RUNSTATS_HELPER('STP_MASTER_TRANS')

echo -------------------------------------
echo %date% - %time% Runstat: Script end.