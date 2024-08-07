--drop table SI_TEMP_ARBS_CU001;
--drop table SI_TEMP_ARBS_CU002;
--drop table SI_TEMP_ARBS_CU003;
--drop table SI_TEMP_ARBS_CA001;
--drop table SI_TEMP_ARBS_CA002;
--drop table SI_TEMP_ARBS_CA003;
--drop table SI_TEMP_ARBS_CA004;
--drop table SI_TEMP_ARBS_CA005;
--drop table SI_TEMP_ARBS_CO009;
--drop table SI_TEMP_ARBS_CO010;
--drop table SI_TEMP_ARBS_CO011;
--drop table SI_TEMP_ARBS_CO012;
--drop table SI_TEMP_ARBS_CO013;
--drop table SI_TEMP_ARBS_CO014;
--drop table SI_TEMP_ARBS_CA019;
--drop table SI_TEMP_ARBS_PF003;

--drop table SI_TEMP_ARBS_CO001;
--drop table SI_TEMP_ARBS_CO002;
--drop table SI_TEMP_ARBS_CO003;
--drop table SI_TEMP_ARBS_CO004;
--drop table SI_TEMP_ARBS_CO005;
--drop table SI_TEMP_ARBS_CO006;
--drop table SI_TEMP_ARBS_CO007;
--drop table SI_TEMP_ARBS_CO008;
--drop table SI_TEMP_ARBS_CO015;
--drop table SI_TEMP_ARBS_CO016;
--drop table SI_TEMP_ARBS_CO017;
--drop table SI_TEMP_ARBS_CO018;
--drop table si_temp_arbs_co018_plg;
--drop table si_temp_arbs_co017_chrg;

CREATE TABLE SI_TEMP_ARBS_CU001(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
CUST_NAME_L VARCHAR(80),
CUST_NAME_S VARCHAR(20),
CUST_CLASS_CODE VARCHAR(3),
CUST_CLASS_DESC VARCHAR(50),
ID_ISSUE_COUNTRY VARCHAR(2),
ID_TYPE_CODE VARCHAR(3),
ID_TYPE_DESC VARCHAR(50),
ID_NUMBER VARCHAR(40),
ID_IISSUE_DATE TIMESTAMP,
SECONDARY_ID_TYPE_CODE VARCHAR(3),
SECONDARY_ID_TYPE_DESC VARCHAR(50),
SECONDARY_ID_NUMBER VARCHAR(40),
CUST_TYPE VARCHAR(1),
CUST_START_DATE TIMESTAMP,
CUST_SEGMENT_CODE VARCHAR(5),
CUST_SEGMENT_DESC VARCHAR(40),
BLACKLISTED VARCHAR(1),
INCOME_GROUP_CODE VARCHAR(3),
INCOME_GROUP_DESC VARCHAR(40),
ISIC_CODE VARCHAR(4),
ISIC_DESC VARCHAR(120),
PRIMARY_ADD_TYPE_CODE VARCHAR(1),
PRIMARY_ADD_TYPE_DESC VARCHAR(40),
PRIMARY_ADD_1 VARCHAR(50),
PRIMARY_ADD_2 VARCHAR(50),
PRIMARY_ADD_3 VARCHAR(50),
PRIMARY_ADD_4 VARCHAR(50),
PRIMARY_POSTCODE VARCHAR(9),
PRIMARY_COUNTRY VARCHAR(2),
LANGUAGE_CODE VARCHAR(3),
LANGUAGE_DESC VARCHAR(50),
SECONDARY_ADD_TYPE_CODE VARCHAR(1),
SECONDARY_ADD_TYPE_DESC VARCHAR(40),
SECONDARY_ADD_1 VARCHAR(50),
SECONDARY_ADD_2 VARCHAR(50),
SECONDARY_ADD_3 VARCHAR(50),
SECONDARY_ADD_4 VARCHAR(50),
SECONDARY_POSTCODE VARCHAR(9),
UPDATE_STAT_IND VARCHAR(1),
CUST_CLASS_CAT VARCHAR(20) DEFAULT '56',
ID_TYPE_CAT VARCHAR(20) DEFAULT 'ID_TYPE',
SECONDARY_ID_TYPE_CAT VARCHAR(20) DEFAULT 'ID_TYPE',
CUST_TYPE_CAT VARCHAR(20) DEFAULT '8',
CUST_SEGMENT_CAT VARCHAR(20) DEFAULT 'ID_TYPE',
INCOME_GROUP_CAT VARCHAR(20) DEFAULT 'INCOME_RANGE',
ISIC_CAT VARCHAR(20) DEFAULT '17',
PRIMARY_ADD_TYPE_CAT VARCHAR(20) DEFAULT '4',
LANGUAGE_CAT VARCHAR(20) DEFAULT '11',
SECONDARY_ADD_TYPE_CAT VARCHAR(20) DEFAULT '4')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CU002(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
CREDIT_GRADE_TYPE VARCHAR(1),
CREDIT_GRADE_VALUE VARCHAR(3),
CREDIT_GRADE_EFFECTIVE_DATE TIMESTAMP,
UPDATE_STAT_IND VARCHAR(1),
CREDIT_GRADE_TYPE_CAT VARCHAR(20) DEFAULT '18',
CREDIT_GRADE_VALUE_CAT VARCHAR(20) DEFAULT '19')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CU003(
RECORD_TYPE VARCHAR(1),
OLD_CIF_ID VARCHAR(19),
NEW_CIF_ID VARCHAR(19),
IS_VALID character(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA001(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
CIF_SOURCE VARCHAR(4),
AA_NUMBER VARCHAR(19),
JOINT_BORROWER_IND VARCHAR(1),
AA_APPROVED_DATE TIMESTAMP,
ORI_LOC_COUNTRY VARCHAR(2),
ORI_LOC_ORG_CODE VARCHAR(5),
ORI_LOC_ORG_DESC VARCHAR(40),
ANNUAL_REVIEW_DATE TIMESTAMP,
AA_STAT VARCHAR(20),
AA_CREATE_DATE TIMESTAMP,
ORI_LOC_ORG_CAT VARCHAR(20) DEFAULT '40')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA002(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
CIF_SOURCE VARCHAR(4),
AA_NUMBER VARCHAR(19))
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA003(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
AA_NUMBER VARCHAR(19),
LIMIT_ID VARCHAR(43),
FACILITY_CODE VARCHAR(3),
FACILITY_SEQ BIGINT,
EXPIRY_DATE TIMESTAMP,
ORI_LOC_COUNTRY VARCHAR(2),
ORG_LOC_ORG_CODE VARCHAR(5),
ORG_LOC_ORG_DESC VARCHAR(40),
PRODUCT_TYPE_CODE VARCHAR(10),
PRODUCT_TYPE_DESC VARCHAR(50),
FACILITY_TYPE_CODE VARCHAR(3),
FACILITY_TYPE_DESC VARCHAR(50),
LIMIT_CURRENCY VARCHAR(3),
LIMIT_AMT DECIMAL(15,2),
LIMIT_TENOR BIGINT,
LIMIT_TENOR_UOM VARCHAR(1),
DRAWING_LIMIT_AMT DECIMAL(15,2),
OUTSTANDING_AMT DECIMAL(15,2),
LOAN_SECTOR_CODE VARCHAR(4),
LOAN_SECTOR_DESC VARCHAR(120),
DISBURSED_IND VARCHAR(1),
ORG_LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
PRODUCT_TYPE_CAT VARCHAR(20) DEFAULT '27',
FACILITY_TYPE_CAT VARCHAR(20) DEFAULT '26',
LOAN_SECTOR_CAT VARCHAR(20) DEFAULT '17',
CMS_ACT_LMT_PROFILE_ID BIGINT,
CMS_ACT_LMT_ID BIGINT,
CMS_STG_LMT_ID BIGINT)
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA004(
RECORD_TYPE VARCHAR(1),
AA_NUMBER VARCHAR(19),
FACILITY_CODE VARCHAR(3),
FACILITY_SEQ BIGINT,
EXTERNAL_SYSTEM_ACCT_NO VARCHAR(19),
ACCT_TYPE VARCHAR(1),
ACCT_SEQ BIGINT,
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA005(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
AA_NUMBER VARCHAR(19),
FACILITY_CODE VARCHAR(3),
FACILITY_SEQ BIGINT,
SECURITY_ID VARCHAR(19),
EXTERNAL_SYSTEM_ACCT_NO VARCHAR(19),
ACCT_TYPE VARCHAR(1),
ACCT_SEQ BIGINT,
UPDATE_STAT_IND VARCHAR(1))
in CMS_BATCH index in CMS_BATCH_INDEX;


CREATE TABLE SI_TEMP_ARBS_CO001(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOC_ORG_CAT VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	CUSTODIAN_TYPE VARCHAR(1),
	SECURITY_EXPIRY_DATE TIMESTAMP,
	LEGAL_ENFORCEABILITY VARCHAR(1),
	LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	ASSET_DESC VARCHAR(140),
	ASSET_TYPE_CAT VARCHAR(10),
	ASSET_TYPE_CODE VARCHAR(40),
	ASSET_TYPE_DESC VARCHAR(40),
	PURCHASE_PRICE DECIMAL(17,2),
	PURCHASE_PRICE_CURRENCY VARCHAR(3),
	PURCHASE_DATE TIMESTAMP,
	REG_DATE TIMESTAMP,
	MANUFACTURE_YEAR BIGINT,
	MODEL_NO VARCHAR(60),
	RESIDUAL_ASSET_LIFE BIGINT,
	RESIDUAL_ASSET_LIFE_UNIT VARCHAR(1),
	ASSET_VALUE DECIMAL(15,2),
	DOCUMENT_PERFECTION_AGE BIGINT,
	SALES_PROCEED DECIMAL(15,2),
	REG_NO VARCHAR(25),
	REG_FEE DECIMAL(15,2),
	BRAND VARCHAR(60),
	GOOD_STAT VARCHAR(1),
	REG_CARD_NUMBER VARCHAR(11),
	CHASSIS_NUMBER VARCHAR(25),
	REPOSESSION_DATE TIMESTAMP,
	REPOSESSION_AGE BIGINT,
	YARD VARCHAR(20),
	INSURANCE_IND VARCHAR(1),
	AUTO_DR_COLLATERAL_FEE VARCHAR(1),
	ENGINE_NUMBER VARCHAR(25),
	HORSE_POWER VARCHAR(20),
	DOWN_PAYMENT_TRADE_IN DECIMAL(15,2),
	DOWN_PAYMENT_CASH DECIMAL(15,2),
	FREIGHT_CHARGES DECIMAL(15,2),
	PRICE_LIST DECIMAL(15,2),
	HEAVY_VEHICLE_TYPE VARCHAR(1),
	PUBLIC_TRANSPORT VARCHAR(1),
	AMT_COLLECTED_FROM_SALES DECIMAL(15,2),
    CMS_ACT_COL_ID BIGINT,
    CMS_STG_COL_ID BIGINT,
    BRAND_ENTRY_CODE VARCHAR(10),
	UPDATE_STAT_IND VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO002(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOG_ORG_CAT VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	CUSTODIAN_TYPE VARCHAR(1),
	LEGAL_ENFORCEABILITY VARCHAR(1),
	LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	ASSET_DESC VARCHAR(50),
	ASSET_TYPE_CAT VARCHAR(10) DEFAULT 'GOLD_TYPE',
	ASSET_TYPE_CODE VARCHAR(3),
	ASSET_TYPE_DESC VARCHAR(20),
	PURCHASE_PRICE DECIMAL(15,2),
	PURCHASE_PRICE_CURRENCY VARCHAR(3),
	SALES_PROCEED DECIMAL(15,2),
	GOLD_GRADE VARCHAR(3),
	PURCHASE_RECEIPT_NO VARCHAR(20),
	GOLD_UNIT_PRICE DECIMAL(17,5),
	GOLD_UNIT_PRICE_UOM VARCHAR(2),
	GOLD_WEIGHT DECIMAL(11,2),
	GOLD_WEIGHT_UOM VARCHAR(2),
	AUCTION_DATE TIMESTAMP,
	AUCTION_PRICE DECIMAL(15,2),
	AUCTIONEER VARCHAR(20),
	CASH_VALUE_FOR_FORCE_SALE VARCHAR(1),
	UPDATE_STAT_IND VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO003(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOG_ORG_CAT VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	CUSTODIAN_TYPE VARCHAR(1),
	ASSET_DESC VARCHAR(50),
	UPDATE_STAT_IND VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
	
-----------------------------------
-- BOND DEBENTURE
--
-----------------------------------	
	
CREATE TABLE SI_TEMP_ARBS_CO004(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOG_ORG_CAT VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	CUSTODIAN_TYPE VARCHAR(1),
	SECURITY_EXPIRY_DATE TIMESTAMP,
	LEGAL_ENFORCEBILITY VARCHAR(1),
	LEGAL_ENFORCEBILITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	ASSET_DESC VARCHAR(50),
	ASSET_TYPE_CAT VARCHAR(10) DEFAULT 'DEBN_TYPE',
	ASSET_TYPE_CODE VARCHAR(3),
	ASSET_TYPE_DESC VARCHAR(40),
	ISSUER_NAME VARCHAR(40),
	BOND_ISSUED_DATE TIMESTAMP,
	UPDATE_STAT_IND VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO005(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOC_ORG_CAT VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	CUSTODIAN_TYPE VARCHAR(1),
	CUSTODIAN VARCHAR(40),
	SECURITY_EXPIRY_DATE TIMESTAMP,
	LEGAL_ENFORCEBILITY VARCHAR(1),
	LEGAL_ENFORCEBILITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	INTEREST_CAPITAL VARCHAR(1),
	UPDATE_STAT_IND VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO006(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	REF_NO VARCHAR(19),
	RECEIPT_NUMBER VARCHAR(19),
	AMT_CURRENCY VARCHAR(3),
	AMT DECIMAL(15,2),
	THIRD_PARTY_BANK VARCHAR(1),
	FDR_RATE DECIMAL(11,9),
	ISSUE_DATE TIMESTAMP,
	MATURITY_DATE TIMESTAMP,
	SECURITY_DEPOSIT VARCHAR(1),
	SHARED_SECURITY_IND VARCHAR(1),
	ACCT_TYPE VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO007(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOG_ORG_CAT	VARCHAR(10) DEFAULT '40',
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	SECURITY_EXPIRY_DATE TIMESTAMP,
	LEGAL_ENFORCEABILITY VARCHAR(1),
	LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	NUMBER_OF_UNITS DECIMAL(15,2),
	ISSUER_NAME VARCHAR(40),
	BOND_ISSUE_DATE TIMESTAMP,
	BOND_MATURITY_DATE TIMESTAMP,
	RECOGNIZED_EXCHANGE VARCHAR(1),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO008(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	CMS_SECURITY_TYPE_ID VARCHAR(5),
	CMS_SECURITY_SUBTYPE_ID VARCHAR(10),
	SECURITY_REF_NOTE VARCHAR(40),
	SOURCE_SECURITY_TYPE VARCHAR(5),
	SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
	CURRENCY VARCHAR(3),
	LOC_COUNTRY VARCHAR(2),
	LOC_ORG_CAT VARCHAR(10),
	LOC_ORG_CODE VARCHAR(5),
	LOC_ORG_DESC VARCHAR(40),
	TYPE VARCHAR(1),
	CERTIFICATE_NUMBER VARCHAR(30),
	NUMBER_OF_UNITS BIGINT,
	STOCK_EXCHANGE_BOND_MARKET VARCHAR(5),
	STOCK_CODE_BOND_CODE VARCHAR(30),
	RECOGNIZED_EXCHANGE VARCHAR(1),
	ISSUER_NAME VARCHAR(100),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO009(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(40),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
CUSTODIAN_TYPE VARCHAR(1),
CUSTODIAN VARCHAR(20),
SECURITY_EXPIRY_DATE TIMESTAMP,
LEGAL_ENFORCEABILITY VARCHAR(1),
LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
SECURITY_PERFECTION_DATE TIMESTAMP,
ASSET_DESC_CODE VARCHAR(50),
SALE_PURCHASE_AGREEMENT_VALUE DECIMAL(15,2),
SALE_PURCHASE_DATE TIMESTAMP,
TITLE_TYPE VARCHAR(1),
MASTER_TITLE VARCHAR(1),
MASTER_TITLE_NUMBER VARCHAR(20),
TITLE_NUMBER VARCHAR(20),
LOT_NO VARCHAR(10),
LOT_LOC VARCHAR(120),
POST_CODE VARCHAR(6),
LAND_AREA VARCHAR(40),
BUILT_UP_AREA VARCHAR(25),
TENURE BIGINT,
TENURE_UNIT VARCHAR(1),
QUIT_RENT_AMT_PAID DECIMAL(15,2),
--MUKIM_DISTRICT_STATE VARCHAR(40),
PROPERTY_USAGE VARCHAR(3),
ABANDONED_PROJECT VARCHAR(1),
PROPERTY_COMPLETED_FLAG VARCHAR(1),
CATEGORY_OF_LAND_USE_CODE VARCHAR(2),
CATEGORY_OF_LAND_USE_DESC VARCHAR(10),
PROPERTY_TYPE_CODE VARCHAR(3),
PROPERTY_TYPE_DESC VARCHAR(40),
INSURANCE VARCHAR(1),
AUTO_DEBIT VARCHAR(1),
LAND_VALUE DECIMAL(15,2),
BUILDING_VALUE DECIMAL(15,2),
UPDATE_STAT_IND VARCHAR(1),
STATE_CODE VARCHAR(40),
STATE_DESC VARCHAR(40),
DISTRICT_CODE VARCHAR(10),
DISTRICT_DESC VARCHAR(40),
MUKIM_CODE VARCHAR(10),
MUKIM_DESC VARCHAR(40),
LAND_AREA_UOM VARCHAR(20),
BUILD_AREA_UOM VARCHAR(20),
DEVELOPER_NAME_CODE VARCHAR(10),
DEVELOPER_NAME_DESC VARCHAR(40),
PROJECT_NAME_CODE VARCHAR(11),
PROJECT_NAME_DESC VARCHAR(40),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
LAND_USE_CAT VARCHAR(20) DEFAULT 'LAND_USE',
PROPERTY_TYPE_CAT VARCHAR(20) DEFAULT 'PROPERTY_TYPE',
ASSET_TYPE_CAT VARCHAR(20) DEFAULT 'ASSET_TYPE',
STATE_CAT VARCHAR(20) DEFAULT 'STATE',
DISTRICT_CAT VARCHAR(20) DEFAULT 'DISTRICT',
MUKIM_CAT VARCHAR(20) DEFAULT 'MUKIM',
AREA_UOM VARCHAR(20) DEFAULT 'AREA_UOM',
DEVELOPER_NAME_CAT VARCHAR(20) DEFAULT 'DEVELOPER_CODE',
PROJECT_NAME_CAT VARCHAR(20) DEFAULT '',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10),
cms_act_col_id BIGINT,
cms_stg_col_id BIGINT)
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO010(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(40),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
CUSTODIAN_TYPE VARCHAR(1),
SECURITY_EXPIRY_DATE TIMESTAMP,
LEGAL_ENFORCEABILITY VARCHAR(1),
LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
SECURITY_PERFECTION_DATE TIMESTAMP,
GUARANTEES_DESC VARCHAR(50),
REF_NO VARCHAR(20),
GUARANTEE_AMT DECIMAL(15,2),
GUARANTEE_DATE TIMESTAMP,
ISSUING_BANK VARCHAR(40),
ISSUING_CONFIRMATION_DATE TIMESTAMP,
INSURANCE VARCHAR(1),
AUTO_DEBIT VARCHAR(1),
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10),
cms_act_col_id BIGINT,
cms_stg_col_id BIGINT) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO011(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(40),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
CUSTODIAN_TYPE VARCHAR(1),
DESC VARCHAR(50),
INSURANCE_IND VARCHAR(1),
AUTO_DEBIT_COLLATERAL_FEE VARCHAR(1),
COLLATERAL_MESSAGE VARCHAR(1),
CASH_VALUE VARCHAR(1),
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10)) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO012(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(40),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
CUSTODIAN_TYPE VARCHAR(1),
SECURITY_EXPIRY_DATE TIMESTAMP,
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10)) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO013(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(50),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
CUSTODIAN_TYPE VARCHAR(1),
SECURITY_EXPIRY_DATE TIMESTAMP,
LEGAL_ENFORCEABILITY VARCHAR(1),
LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
SECURITY_PERFECTION_DATE TIMESTAMP,
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10)) in CMS_BATCH index in CMS_BATCH_INDEX;


CREATE TABLE SI_TEMP_ARBS_CO014(
RECORD_TYPE VARCHAR(1),
SECURITY_ID VARCHAR(19),
SECURITY_REF_NOTE VARCHAR(40),
SOURCE_SECURITY_TYPE VARCHAR(5),
SOURCE_SECURITY_SUB_TYPE VARCHAR(3),
CURRENCY VARCHAR(3),
LOC_COUNTRY VARCHAR(2),
LOC_ORG_CODE VARCHAR(5),
LOC_ORG_DESC VARCHAR(40),
UPDATE_STAT_IND VARCHAR(1),
LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10)) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO015(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	VALUER_CAT VARCHAR(10) DEFAULT 'VALUER',
	VALUER_CODE VARCHAR(5),
	VALUER_DESC VARCHAR(40),
	VALUATION_DATE TIMESTAMP,
	VALUATION_CURRENCY VARCHAR(3),
	CMV DECIMAL(15,2),
	FSV DECIMAL(15,2),
	ASSUMPTION_VALUE VARCHAR(1),
	RESERVE_PRICE DECIMAL(15,2),
	RESERVE_PRICE_DATE TIMESTAMP,
	APPRAISAL_NAME VARCHAR(40),
	APPRAISAL_VALUE DECIMAL(15,2),
	APPRAISAL_VALUE_DATE TIMESTAMP,
	BRANCH_VALUATION_AMT DECIMAL(15,2),
	BRANCH_VALUATION_DATE TIMESTAMP,
	VALUATION_TYPE VARCHAR(10),
	VAL_TYPES VARCHAR(5),
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO016(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	POLICY_NUMBER VARCHAR(25),
	SEQ_NUMBER VARCHAR(3),
	INSURER_NAME_CAT VARCHAR(15) DEFAULT 'INSURER_NAME',
	INSURER_NAME_CODE VARCHAR(3),
	INSURER_NAME_DESC VARCHAR(50),
	INSURANCE_TYPE_CAT VARCHAR(15) DEFAULT 'INSURANCE_TYPE',
	INSURANCE_TYPE_CODE VARCHAR(3),
	INSURANCE_TYPE_DESC VARCHAR(50),
	INSURANCE_POLICY_CURRENCY VARCHAR(3),
	INSURED_AMT DECIMAL(15,2),
	EFFECTIVE_DATE TIMESTAMP,
	EXPIRY_DATE TIMESTAMP,
	INSURED_ADD_1 VARCHAR(40),
	INSURED_ADD_2 VARCHAR(40),
	INSURED_ADD_3 VARCHAR(40),
	INSURED_ADD_4 VARCHAR(40),
	BANK_CUST_ARRANGE_INSURANCE_IN VARCHAR(1),
	CASH_SURRENDER_VALUE DECIMAL(13,2),
	PROP_NO_COVER_NOTE_NUMBER VARCHAR(20),
	REMARKS VARCHAR(60),
	GROSS_PREMIUM DECIMAL(13,2),
	STAMP_DUTY DECIMAL(13,2),
	SERVICE_TAX_PERCT DECIMAL(11,9),
	SERVICE_AMT DECIMAL(13,2),
	GLOBAL_LOCAL_IND VARCHAR(1),
	REBATE_BY_INSURANCE DECIMAL(11,9),
	REBATE_AMT_BY_INSURANCE_COMPAN DECIMAL(13,2),
	REBATE_TO_BORROWER DECIMAL(11,9),
	REBATE_AMT_TO_BORROWER DECIMAL(15,2),
	NET_PREMIUM_PAY_TO_INSURANCE_C DECIMAL(13,2),
	NET_PREMIUM_PAY_BY_BORROWER DECIMAL(13,2),
	COMMISSION_EARNED DECIMAL(13,2),
	CMS_ACT_COL_ID BIGINT,
    CMS_STG_COL_ID BIGINT,
    CMS_ACT_INSR_ID BIGINT,
    CMS_STG_INSR_ID BIGINT,
	IS_VALID CHAR(1) DEFAULT 'Y'
)
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CO017(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	APPLICATION_NO VARCHAR(19),
	FACILITY_CODE VARCHAR(3),
	FACILITY_SEQ BIGINT,
	RANKING_OF_SECURITY BIGINT,
	CHARGE_AMT DECIMAL(15,2),
	DATE_LEGALLY_CHARGE TIMESTAMP,
	PRESENTATION_NO VARCHAR(20),
	PRESENTATION_DATE TIMESTAMP,
	CMS_ACT_COL_ID BIGINT,
  	CMS_STG_COL_ID BIGINT,
  	CMS_ACT_LMT_ID BIGINT,
  	CMS_STG_LMT_ID BIGINT,
	CMS_ACT_CHRG_ID BIGINT,
  	CMS_STG_CHRG_ID BIGINT,
 	CMS_ACT_AA_ID BIGINT,
	CMS_ACT_CHRG_DTL_ID BIGINT,
	CMS_STG_CHRG_DTL_ID BIGINT,  
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE SI_TEMP_ARBS_CO018(
	RECORD_TYPE VARCHAR(1),
	SECURITY_ID VARCHAR(19),
	PLEDGOR_CIF_ID VARCHAR(19),
	PLEDGOR_CIF_SOURCE VARCHAR(4),
	PLEDGOR_LEGAL_NAME VARCHAR(120),
	RELATIONSHIP_WITH_BORROWER_CAT VARCHAR(10) DEFAULT '34',
	RELATIONSHIP_WITH_BORROWER_COD VARCHAR(2),
	RELATIONSHIP_WITH_BORROWER_DES VARCHAR(20),
	UPDATE_STAT_IND VARCHAR(1),
	CMS_PLDGR_ID BIGINT,
	CMS_ACT_COL_ID BIGINT,
	IS_VALID CHAR(1) DEFAULT 'Y')
in CMS_BATCH index in CMS_BATCH_INDEX;
	
CREATE TABLE si_temp_arbs_co017_chrg(
	SECURITY_ID VARCHAR(19),
	RANKING_OF_SECURITY BIGINT,
	DATE_LEGALLY_CHARGE TIMESTAMP,
	PRESENTATION_NO VARCHAR(20),
	PRESENTATION_DATE TIMESTAMP,
	CMS_ACT_COL_ID BIGINT,
  CMS_STG_COL_ID BIGINT)
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE si_temp_arbs_co018_plg(
	PLEDGOR_CIF_ID VARCHAR(19),
	PLEDGOR_CIF_SOURCE VARCHAR(4),
	PLEDGOR_LEGAL_NAME VARCHAR(120))
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_PF003(
RECORD_TYPE VARCHAR(1),
CURRENCY_CODE VARCHAR(3),
CURRENCY_DESC VARCHAR(50),
BUY_RATE DECIMAL(13,7)) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_ARBS_CA019(
RECORD_TYPE VARCHAR(1),
ACCT_NUMBER VARCHAR(19),
AA_NUMBER VARCHAR(19),
FACILITY_CODE VARCHAR(3),
FACILITY_SEQ BIGINT,
DELINQUENT_IND VARCHAR(1),
ACCT_STAT VARCHAR(1),
PART_PAYMENT DECIMAL(15,2),
LATEST_DATE_DOUBTFUL TIMESTAMP,
DATE_REGULARISED TIMESTAMP,
INTEREST_IN_SUSPENSE DECIMAL(15,2),
AMT_WRITTEN_OFF DECIMAL(15,2),
JUDGMENT_DATE TIMESTAMP,
JUDGMENT_SUM DECIMAL(15,2),
DATE_WRITE_OFF TIMESTAMP,
MONTHS_INSTALLMENT_ARREARS DECIMAL(15,2),
MONTHS_INTEREST_ARREARS DECIMAL(15,2),
SPECIFIC_PROV_CHARGED_TO_ACCT DECIMAL(15,2),
CAR_CODE VARCHAR(2),
CAR_DESC VARCHAR(20),
NPL_STAT VARCHAR(1),
LATE_CHARGE_IN_SUSPENSE DECIMAL(15,2),
CAR_CODE_STAT_DATE TIMESTAMP,
AMT_PARTIALLY_WRITTEN_OFF DECIMAL(15,2),
NPL_STAT_DATE TIMESTAMP,
CAR_CAT VARCHAR(20) DEFAULT 'CAR') in CMS_BATCH index in CMS_BATCH_INDEX;

alter table SI_TEMP_ARBS_CU001
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CU002
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CA001
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CA002
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CA003
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CA004
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CA005
	add column IS_VALID character(1) DEFAULT 'Y'
	add column cms_act_col_id bigint
	add column cms_act_lmt_id bigint
	add column src_lmt_id varchar(43)
	add column stg_col_id bigint
	add column stg_lmt_id bigint
	add column cms_act_lmt_profile_id bigint;
alter table SI_TEMP_ARBS_CO009
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CO010
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CO011
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CO012
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CO013
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_ARBS_CO014
	add column IS_VALID character(1) DEFAULT 'Y';
alter TABLE SI_TEMP_ARBS_CA019
	add column IS_VALID character(1) DEFAULT 'Y';
alter TABLE SI_TEMP_ARBS_PF003
	add column IS_VALID character(1) DEFAULT 'Y';

reorg table SI_TEMP_ARBS_CU001;
reorg table SI_TEMP_ARBS_CU002;
reorg table SI_TEMP_ARBS_CU003;
reorg table SI_TEMP_ARBS_CA001;
reorg table SI_TEMP_ARBS_CA002;
reorg table SI_TEMP_ARBS_CA003;
reorg table SI_TEMP_ARBS_CA004;
reorg table SI_TEMP_ARBS_CA005;
reorg table SI_TEMP_ARBS_CO009;
reorg table SI_TEMP_ARBS_CO010;
reorg table SI_TEMP_ARBS_CO011;
reorg table SI_TEMP_ARBS_CO012;
reorg table SI_TEMP_ARBS_CO013;
reorg table SI_TEMP_ARBS_CO014;
reorg TABLE SI_TEMP_ARBS_CA019;
reorg TABLE SI_TEMP_ARBS_PF003;

CREATE INDEX SI_ARBS_CU001_IDX1 ON SI_TEMP_ARBS_CU001
(IS_VALID ASC, CIF_ID ASC) ALLOW REVERSE SCANS;   

--CREATE INDEX SI_ARBS_CU001_IDX2 ON SI_TEMP_ARBS_CU001
--(IS_VALID ASC, PRIMARY_ADD_TYPE_CODE, CIF_ID ASC);   

--CREATE INDEX SI_ARBS_CU001_IDX3 ON SI_TEMP_ARBS_CU001
--(IS_VALID ASC, SECONDARY_ADD_TYPE_CODE, CIF_ID ASC);   

CREATE INDEX SI_ARBS_CU002_IDX1 ON SI_TEMP_ARBS_CU002
(IS_VALID ASC, CREDIT_GRADE_TYPE ASC, CIF_ID ASC) ALLOW REVERSE SCANS;   

CREATE INDEX SI_ARBS_CA001_IDX1 ON SI_TEMP_ARBS_CA001
(IS_VALID ASC, AA_NUMBER ASC);  

CREATE INDEX SI_ARBS_CA001_IDX2 ON SI_TEMP_ARBS_CA001
(CIF_ID ASC);  

CREATE INDEX SI_ARBS_CA002_IDX1 ON SI_TEMP_ARBS_CA002
(IS_VALID ASC, AA_NUMBER ASC);  

CREATE INDEX SI_ARBS_CA002_IDX2 ON SI_TEMP_ARBS_CA002
(CIF_ID ASC);

CREATE INDEX SI_ARBS_CA003_IDX1 ON SI_TEMP_ARBS_CA003
(IS_VALID ASC, AA_NUMBER ASC, FACILITY_CODE ASC, FACILITY_SEQ ASC) ALLOW REVERSE SCANS;

CREATE INDEX SI_ARBS_CA003_IDX2 ON SI_TEMP_ARBS_CA003
(IS_VALID ASC, CIF_ID ASC);  

CREATE INDEX SI_ARBS_CA003_IDX3 ON SI_TEMP_ARBS_CA003
(IS_VALID ASC, limit_id ASC); 

create index SI_ARBS_CA003_IDX4 on si_temp_arbs_ca003 (cms_act_lmt_profile_id asc, is_valid asc)
allow reverse scans;

create index SI_ARBS_CA003_IDX5 on si_temp_arbs_ca003 (cms_act_lmt_id asc, is_valid asc)
allow reverse scans;

create index SI_ARBS_CA003_IDX6 on si_temp_arbs_ca003 (cms_stg_lmt_id asc, is_valid asc)
allow reverse scans;

CREATE INDEX SI_ARBS_CA004_IDX1 ON SI_TEMP_ARBS_CA004
(IS_VALID ASC, EXTERNAL_SYSTEM_ACCT_NO ASC, ACCT_SEQ ASC);  

CREATE INDEX SI_ARBS_CA005_IDX1 ON SI_TEMP_ARBS_CA005
(IS_VALID ASC, cms_act_lmt_id ASC, cms_act_col_id ASC);

CREATE INDEX SI_ARBS_CA005_IDX2 ON SI_TEMP_ARBS_CA005
(IS_VALID ASC, cms_act_lmt_id ASC, stg_col_id ASC);

CREATE INDEX SI_ARBS_CA005_IDX3 ON SI_TEMP_ARBS_CA005
(EXTERNAL_SYSTEM_ACCT_NO ASC, ACCT_SEQ ASC, SECURITY_ID ASC) ALLOW REVERSE SCANS;   

CREATE INDEX SI_ARBS_CA019_IDX1 ON SI_TEMP_ARBS_CA019
(IS_VALID ASC, AA_NUMBER ASC);


CREATE INDEX idx_si_sec1 ON si_temp_arbs_co001
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_cash1 ON si_temp_arbs_co005
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;
	
CREATE INDEX idx_si_market_bond1 ON si_temp_arbs_co007
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_co1 ON si_temp_arbs_co001
	(cms_act_col_id);

CREATE INDEX idx_si_co2 ON si_temp_arbs_co001
	(cms_stg_col_id);

CREATE INDEX idx_si_co009_col1 ON si_temp_arbs_co009 
	(cms_act_col_id);

CREATE INDEX idx_si_co009_col2 ON si_temp_arbs_co009 
	(cms_stg_col_id);
	
CREATE INDEX idx_si_arbs_co009_1 ON si_temp_arbs_co009
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;
 
CREATE INDEX idx_si_co010_secval1 ON si_temp_arbs_co010 
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_co010_col1 ON si_temp_arbs_co010 
	(cms_act_col_id);

CREATE INDEX idx_si_co010_col2 ON si_temp_arbs_co010 
	(cms_stg_col_id);

CREATE INDEX idx_si_others1 ON si_temp_arbs_co011
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;
    
CREATE INDEX idx_si_doc1 ON si_temp_arbs_co013
	(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX IDX_SI_CLEAN1 ON SI_TEMP_ARBS_CO014
(is_valid ASC, security_id ASC);

CREATE INDEX idx_si_valtyp1 ON si_temp_arbs_co015
	(val_types) cluster;

CREATE INDEX idx_insr_secseq1 ON si_temp_arbs_co016
	(security_id ASC, seq_number ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_col1 ON si_temp_arbs_co016
	(cms_act_col_id ASC, seq_number ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_col2 ON si_temp_arbs_co016
	(cms_stg_col_id ASC, seq_number ASC) ALLOW REVERSE SCANS;
	
CREATE INDEX idx_si_insr1 ON si_temp_arbs_co016(cms_act_insr_id ASC, is_valid ASC);

CREATE INDEX idx_si_insr2 ON si_temp_arbs_co016(cms_stg_insr_id ASC, is_valid ASC);

CREATE INDEX idx_si_chrg1 ON si_temp_arbs_co017 
	(cms_act_col_id ASC, ranking_of_security ASC ) ALLOW REVERSE SCANS;
             
CREATE INDEX idx_si_chrg2 ON si_temp_arbs_co017 
	(cms_stg_col_id ASC, ranking_of_security ASC ) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_chrg3 ON si_temp_arbs_co017
(is_valid ASC) ALLOW REVERSE SCANS;

create index IDX_SI_CHRG4 on si_temp_arbs_co017 (cms_act_chrg_dtl_id asc, is_valid asc)
allow reverse scans;

create index IDX_SI_CHRG5 on si_temp_arbs_co017 (cms_stg_chrg_dtl_id asc, is_valid asc)
allow reverse scans;

-- CREATE INDEX idx_si_lmtsecm1 ON si_temp_arbs_co017 
-- 	(cms_act_chrg_id ASC, cms_act_col_id ASC, cms_act_lmt_id ASC) ALLOW REVERSE SCANS;

create index idx_si_lmtsecm1 on si_temp_arbs_co017
	(cms_act_chrg_id asc, is_valid asc) allow reverse scans;	
             
-- CREATE INDEX idx_si_lmtsecm2 ON si_temp_arbs_co017 
-- 	(cms_stg_chrg_id ASC, cms_act_col_id ASC, cms_stg_lmt_id ASC) ALLOW REVERSE SCANS;
	
create index idx_si_lmtsecm2 on si_temp_arbs_co017
	(cms_stg_chrg_id asc, is_valid asc) allow reverse scans;
		
--create index IDX_SI_LMTSECM3 on si_temp_arbs_co017 (cms_stg_chrg_id asc, is_valid asc)
--allow reverse scans;	

CREATE INDEX idx_si_plg1 ON si_temp_arbs_co018
(pledgor_cif_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_plg2 ON si_temp_arbs_co018(cms_pldgr_id);

CREATE INDEX idx_si_col3 ON si_temp_arbs_co018
(security_id ASC, is_valid ASC) ALLOW REVERSE SCANS;

CREATE INDEX idx_si_plgcol ON si_temp_arbs_co018
(cms_act_col_id ASC, cms_pldgr_id ASC) ALLOW REVERSE SCANS;


create index val_idx3 on cms_valuation
    (source_type, valuation_type, valuation_date, source_id, cms_collateral_id)
allow reverse scans;

create index sec_i4 on cms_security
    (last_remargin_date, cms_collateral_id)
allow reverse scans;


COMMIT;


