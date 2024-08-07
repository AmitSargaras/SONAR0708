drop table DC_MS;

drop table DC_MS_ERR;

CREATE TABLE DC_MS (
	CIF_NUMBER VARCHAR(20),
	BORROWER_NAME VARCHAR(100),
	ACCOUNT_NUMBER VARCHAR(40),
	BUSINESS_UNIT VARCHAR(15),
	BRANCH_CODE VARCHAR(3),
	CMS_COLLATERAL_ID BIGINT NOT NULL,	
	COLLATERAL_CODE VARCHAR(4),
	--COLLATERAL_CODE_DESC VARCHAR(200), -- ignore description
	COLLATERAL_NAME VARCHAR(30),
	MATURITY_DATE TIMESTAMP, --update
	ISSUER_NAME VARCHAR(50), -- update
	BOND_ISSUE_DATE TIMESTAMP, -- update
	STOCK_CODE VARCHAR(30), -- update
	STOCK_NAME VARCHAR(40), -- update
	ISIN_CODE VARCHAR(30), -- update
	REGION VARCHAR(50) NOT NULL DEFAULT 'NA',
	VALID_IND CHAR(1) DEFAULT 'Y'
	)
IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE "DC_MS" 
	ADD CONSTRAINT "DC_MS_U" UNIQUE
		("CMS_COLLATERAL_ID",
		 "REGION");

CREATE TABLE DC_MS_ERR LIKE DC_MS
	IN "CMS_MIG" INDEX IN "CMS_MIG_INDEX";

ALTER TABLE DC_MS_ERR
	ADD DATE    TIMESTAMP;

ALTER TABLE DC_MS_ERR
  ADD REASON	CLOB;