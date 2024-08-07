@echo off

call ..\set_mig_env.cmd %*

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF DEL MODIFIED BY COLDEL, DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL TIMESTAMPFORMAT=\"YYYYMMDD\" METHOD P (1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28)  MESSAGES "%LOG_PATH%" INSERT INTO "%DB_SCHEMA%".DC_AB101 (CIF_NUMBER, BORROWER_NAME, ACCOUNT_NUMBER, BUSINESS_UNIT, BRANCH_CODE, CMS_COLLATERAL_ID, COLLATERAL_CODE, COLLATERAL_NAME, SECURITY_MATURITY_DATE, SECURITY_PERFECTION_DATE, LEGAL_ENFORCEABILITY_IND, LEGAL_ENFORCEABILITY_DATE, UNIT_TYPE, PURCHASE_PRICE, MODEL_NO, YEAR_OF_MANUFACTURE, EQUIPMENT_MF, EQUIPMENT_RISK_GRADING, EQUIPMENT_CODE, OLV, REMAINING_USEFUL_LIFE, APPRAISED_VALUE, APPRAISED_VALUE_DATE, VALUATION_AMOUNT, VALUER_NAME, CURRENT_MARKET_VALUE, VALUATION_DATE, VALUATION_TYPE_DESC) FOR EXCEPTION "%DB_SCHEMA%".DC_AB101_ERR NONRECOVERABLE CHECK PENDING CASCADE IMMEDIATE

db2 SET INTEGRITY FOR "%DB_SCHEMA%".DC_AB101 IMMEDIATE CHECKED FORCE GENERATED FULL ACCESS FOR EXCEPTION IN "%DB_SCHEMA%".DC_AB101 USE "%DB_SCHEMA%".DC_AB101_ERR

:end