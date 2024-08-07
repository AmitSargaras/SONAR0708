drop table MIG_AB101;

drop table MIG_AB101_ERR;

drop table MIG_CHARGE_AB101;

drop table MIG_CHARGE_AB101_ERR;

drop table MIG_PLEDGOR_AB101;

drop table MIG_PLEDGOR_AB101_ERR;

drop table MIG_VAL_AB101;

drop table MIG_VAL_AB101_ERR;


CREATE TABLE MIG_AB101 (
	CIF_NUMBER VARCHAR(20),
	FAC_DESC VARCHAR(40),
	SOURCE_SECURITY_ID VARCHAR(19) NOT NULL,
	SECURITY_TYPE VARCHAR(40) DEFAULT 'Asset Based',
	SECURITY_SUB_TYPE VARCHAR(80) DEFAULT 'Plant & Equipment',
	SECURITY_TYPE_ID CHAR(2) DEFAULT 'AB',
	SECURITY_SUB_TYPE_ID VARCHAR(5) DEFAULT 'AB101',
	SECURITY_CURRENCY CHAR(3),
	SECURITY_LOCATION CHAR(2) DEFAULT 'MY',
	SECURITY_ORGANISATION VARCHAR(60),
	SECURITY_ORGANISATION_CODE VARCHAR(10),	
	SECURITY_CUSTODIAN_TYPE VARCHAR(10) DEFAULT 'I',
	CUSTODIAN_TYPE_CODE CHAR(1),
	SECURITY_CUSTODIAN_VALUE VARCHAR(100),
	CUSTODIAN_VALUE_CODE VARCHAR(10),
	SECURITY_MATURITY_DATE TIMESTAMP,
	SECURITY_PERFECTION_DATE TIMESTAMP,
	LEGAL_ENFORCEABILITY_IND CHAR(1),
	LEGAL_ENFORCEABILITY_DATE TIMESTAMP,
	SECURITY_REF_NOTE VARCHAR(2500),
	EXCHANGE_CONTROL_OBTAINED CHAR(1) DEFAULT 'N',
	PHYSICAL_INSPECTION_IND CHAR(1),
	LAST_PHYSICAL_INSPECTION_DATE TIMESTAMP,
	NEXT_PHYSICAL_INSPECTION_DATE TIMESTAMP,
	PHYSICAL_INSPECTION_FREQ_UNIT VARCHAR(10),
	PHYSICAL_INSPECTION_FREQ_UOM VARCHAR(2),
	PHY_INSPECTION_FREQ_UOM_CODE VARCHAR(10),
	SEC_ENVIRONMENTAL_RISKY_IND CHAR(2) DEFAULT 'NA',
	DATE_SEC_CONFIRM_ENV_RISKY TIMESTAMP,
	REMARKS_SEC_ENV_RISKY VARCHAR(250),
	PLANT_EQUIP_TYPE VARCHAR(60),
	GOODS_STATUS VARCHAR(30), 
	PURCHASE_PRICE DECIMAL(17,2),
	PURCHASE_DATE TIMESTAMP,
	REPOSSESSION_DATE TIMESTAMP,
	MODEL_NO VARCHAR(50),
	CHASSIS_NUMBER VARCHAR(20),
	SCRAP_VALUE DECIMAL(20,2),
	YEAR_OF_MANUFACTURE INT,
	EQUIPMENT_MF CHAR(1),
	EQUIPMENT_RISK_GRADING CHAR(1),
	EQUIPMENT_CODE VARCHAR(60),
	OLV DECIMAL(17,2),
	REMAINING_USEFUL_LIFE VARCHAR(20),
	REGISTRATION_CARD_NO VARCHAR(20),
	ENGINE_NO VARCHAR(20),
	BRAND VARCHAR(100),
	SALES_PROCEED DECIMAL(17,2),
	YARD VARCHAR(40),
	ASSET_DESC VARCHAR(250),
	CMS_COLLATERAL_ID BIGINT,
	CMS_COLLATERAL_STG_ID BIGINT,
	SOURCE_ID VARCHAR(10),
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	VALID_IND CHAR(1) DEFAULT 'Y'
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "MIG_AB101" 
	ADD CONSTRAINT "MIG_AB101_U" UNIQUE
		("SOURCE_SECURITY_ID",
		 "REGION");

CREATE TABLE MIG_AB101_ERR LIKE MIG_AB101
	IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE MIG_AB101_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE MIG_AB101_ERR
  ADD REASON	CLOB;
  
-- CHARGE
CREATE TABLE MIG_CHARGE_AB101 (
	SOURCE_SECURITY_ID VARCHAR(19) NOT NULL,
	SOURCE_LIMIT_ID VARCHAR(20) NOT NULL,
	SECURITY_RANKING INT NOT NULL,
	CHARGE_TYPE CHAR(10) DEFAULT 'G',
	NATURE_OF_CHARGE VARCHAR(60),
	CHARGE_CURRENCY CHAR(3),
	CHARGE_AMT DECIMAL(20,2),
	DATE_LEGALLY_CHARGE TIMESTAMP,
	PRIOR_CHARGEE VARCHAR(100),
	PRIOR_CHARGE_TYPE VARCHAR(10),
	PRIOR_CHARGE_CCY CHAR(3),
	PRIOR_CHARGE_AMT DECIMAL(20,2),
	SOURCE_ID VARCHAR(10),
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	VALID_IND CHAR(1) DEFAULT 'Y',
	VALID_CHARGE_IND CHAR(1) DEFAULT 'Y',
	CHARGE_TYPE_CODE VARCHAR(10),
	NATURE_OF_CHARGE_CODE VARCHAR(10),
	CMS_ACT_CHARGE_ID BIGINT, 
	CMS_ACT_LMT_ID BIGINT,
	CMS_STG_CHARGE_ID BIGINT,
	CMS_ACT_LMT_PROFILE_ID BIGINT,
	CMS_ACT_DTL_ID BIGINT, 
	CMS_STG_DTL_ID BIGINT,
	PRIOR_CHARGE_TYPE_CODE VARCHAR(10)	
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "MIG_CHARGE_AB101" 
	ADD CONSTRAINT "MIG_CHARGE_AB101_U" UNIQUE
		("SOURCE_LIMIT_ID",
		 "SOURCE_SECURITY_ID",
		 "SECURITY_RANKING",
		 "REGION");

CREATE TABLE MIG_CHARGE_AB101_ERR LIKE MIG_CHARGE_AB101
	 IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE MIG_CHARGE_AB101_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE MIG_CHARGE_AB101_ERR
  ADD REASON	CLOB;		 

-- PLEDGOR
CREATE TABLE MIG_PLEDGOR_AB101 (
	CIF_NUMBER VARCHAR(20) NOT NULL,
	SOURCE_LIMIT_ID VARCHAR(20) NOT NULL,
	SOURCE_SECURITY_ID VARCHAR(19) NOT NULL,
	IS_BORROWER_PLEDGOR CHAR(1), 
	CIF_PLEDGOR1 VARCHAR(19),
	CIF_PLEDGOR2 VARCHAR(19),
	CIF_PLEDGOR3 VARCHAR(19),
	CIF_PLEDGOR4 VARCHAR(19),
	CMS_PLEDGOR_ID BIGINT,
	CMS_PLEDGOR1_ID BIGINT,
	CMS_PLEDGOR2_ID BIGINT,
	CMS_PLEDGOR3_ID BIGINT,
	CMS_PLEDGOR4_ID BIGINT,
	SOURCE_ID VARCHAR(10),
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	IS_BRRW_PLGR_IND CHAR(1) DEFAULT 'Y',
	CIF_PLEDGOR1_IND CHAR(1) DEFAULT 'Y',
	CIF_PLEDGOR2_IND CHAR(1) DEFAULT 'Y',
	CIF_PLEDGOR3_IND CHAR(1) DEFAULT 'Y',
	CIF_PLEDGOR4_IND CHAR(1) DEFAULT 'Y'
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "MIG_PLEDGOR_AB101" 
	ADD CONSTRAINT "MIG_PGR_AB101_U" UNIQUE
		("CIF_NUMBER",
		 "SOURCE_LIMIT_ID",
		 "SOURCE_SECURITY_ID",
		 "REGION");

CREATE TABLE MIG_PLEDGOR_AB101_ERR LIKE MIG_PLEDGOR_AB101
	 IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE MIG_PLEDGOR_AB101_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE MIG_PLEDGOR_AB101_ERR
  ADD REASON	CLOB;

CREATE TABLE MIG_VAL_AB101 (
	SOURCE_SECURITY_ID VARCHAR(19) NOT NULL,
	VALUATION_DATE TIMESTAMP NOT NULL,
	VALUATION_CCY CHAR(3),
	VALUATION_OMV DECIMAL(17,2) NOT NULL,
	VALUER VARCHAR(200),
	VALUER_CODE VARCHAR(10),
	VALUATION_FSV DECIMAL(17,2),
	COMMENTS VARCHAR(250),
	RESERVE_PRICE DECIMAL(17,2),
	RESERVE_PRICE_DATE TIMESTAMP,
	OLV DECIMAL(30,2),
	REMAINING_USEFUL_LIFE DECIMAL(5,2),
	VALUATION_ID BIGINT,
	VALUATION_STG_ID BIGINT,
	SOURCE_ID VARCHAR(10),
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	VALID_IND CHAR(1) DEFAULT 'Y'
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "MIG_VAL_AB101" 
	ADD CONSTRAINT "MIG_VAL_AB101_U" UNIQUE
		("SOURCE_SECURITY_ID",
		 "VALUATION_DATE",
		 "VALUATION_OMV",
		 "REGION");

CREATE TABLE MIG_VAL_AB101_ERR LIKE MIG_VAL_AB101
	 IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE MIG_VAL_AB101_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE MIG_VAL_AB101_ERR
  ADD REASON	CLOB;