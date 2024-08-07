drop table DC_AB103;

drop table DC_AB103_ERR;

CREATE TABLE DC_AB103 (
	CIF_NUMBER VARCHAR(20),
	BORROWER_NAME VARCHAR(100),
	ACCOUNT_NUMBER VARCHAR(40),
	BUSINESS_UNIT VARCHAR(15),
	BRANCH_CODE VARCHAR(3),
	CMS_COLLATERAL_ID BIGINT NOT NULL,	
	COLLATERAL_CODE VARCHAR(4),
	--COLLATERAL_CODE_DESC VARCHAR(200), -- ignore description
	COLLATERAL_NAME VARCHAR(30),
	SECURITY_MATURITY_DATE TIMESTAMP, -- update
	SECURITY_PERFECTION_DATE TIMESTAMP, -- update
	LEGAL_ENFORCEABILITY_IND CHAR(1), -- update
	LEGAL_ENFORCEABILITY_DATE TIMESTAMP, -- update 
	APPRAISED_VALUE BIGINT,
	APPRAISED_VALUE_DATE TIMESTAMP,
	VALUATION_AMOUNT DECIMAL(17,2),
	VALUER_NAME VARCHAR(200),
	CURRENT_MARKET_VALUE DECIMAL(17,2), --update
	VALUATION_DATE TIMESTAMP, -- update 
	VALUATION_TYPE_DESC VARCHAR(10), --update
	VALUATION_TYPE CHAR(1), -- update
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	VALID_IND CHAR(1) DEFAULT 'Y'
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "DC_AB103" 
	ADD CONSTRAINT "DC_AB103_U" UNIQUE
		("CMS_COLLATERAL_ID",
		 "REGION");

CREATE TABLE DC_AB103_ERR LIKE DC_AB103
	IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE DC_AB103_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE DC_AB103_ERR
  ADD REASON	CLOB;