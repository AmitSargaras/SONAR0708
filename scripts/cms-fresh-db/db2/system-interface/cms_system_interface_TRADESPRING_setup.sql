--drop table SI_TEMP_TSPR_CA006;
--drop table SI_TEMP_TSPR_CA008;
--drop table SI_TEMP_TSPR_CA010;
--drop table SI_TEMP_TSPR_CO021;
--drop view VIEW_SI_CO019_TSPR;

CREATE TABLE SI_TEMP_TSPR_CA006(
RECORD_TYPE VARCHAR(1),
CIF_ID VARCHAR(19),
TRADE_ACCT_NO VARCHAR(35),
TRADE_ACCT_SEQ BIGINT,
LIMIT_ID VARCHAR(32),
OUTER_LIMIT_ID VARCHAR(32),
EXPIRY_MATURITY_DATE TIMESTAMP,
ORI_LOC_COUNTRY VARCHAR(2),
ORG_LOC_ORG VARCHAR(5),
OMNIBUS_IND VARCHAR(1),
PRODUCT_TYPE_CODE VARCHAR(60),
PRODUCT_TYPE_DESC VARCHAR(100),
LIMIT_CURRENCY VARCHAR(3),
LIMIT_AMT DECIMAL(30,4),
LIMITTENOR BIGINT,
LIMIT_TENOR_UOM VARCHAR(1),
DRAWING_ACTIVATED_LIMIT_AMT DECIMAL(30,4),
OUTSTANDING_AMT DECIMAL(30,4),
REVOLVING_IND VARCHAR(1),
COMMISSION_TYPE VARCHAR(1),
TIER_TYPE VARCHAR(1),
COMMISSION_RATE DECIMAL(18,9),
PRODUCT_INSTRUCTION VARCHAR(2500),
REVIEW_DATE TIMESTAMP,
TEMPORARY_LINE VARCHAR(1),
AUTO_PURGE_FLAG VARCHAR(1),
BUSINESS_UNIT VARCHAR(5),
ISLAMIC_FLAG VARCHAR(1),
ACCT_DESC_CODE VARCHAR(60),
ACCT_DESC_DESC VARCHAR(100),
NPL_STAT VARCHAR(1),
NPL_DATE TIMESTAMP,
AUTO_NPL_FLAG VARCHAR(1),
LOAN_PURPOSE_CODE VARCHAR(60),
LOAN_PURPOSE_DESC VARCHAR(100),
BROAD_PROPERTY_SECTOR_EXEMPTIO VARCHAR(1),
LOAN_SECURITY_MATRIX_CODE_ VARCHAR(60),
LOAN_SECURITY_MATRIX_DESC VARCHAR(100),
SECTORIAL_CODE VARCHAR(60),
SECTORIAL_DESC VARCHAR(100),
LIMIT_DESC VARCHAR(35),
UPDATE_STAT_IND VARCHAR(1),
DISBURSED_IND VARCHAR(1),
ORI_LOC_ORG_CAT VARCHAR(20) DEFAULT '40',
PRODUCT_TYPE_CAT VARCHAR(20) DEFAULT '27',
BUSINESS_UNIT_CAT VARCHAR(20) DEFAULT '5') 
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_TSPR_CA008(
RECORD_TYPE VARCHAR(1),
LIMIT_ID VARCHAR(32),
PRICING_TYPE VARCHAR(1),
INTEREST_MODE VARCHAR(1),
SINGLE_MULTIPLE_TIER VARCHAR(1),
TIER_RATE_TYPE VARCHAR(50),
TIER_RATE DECIMAL(18,9),
UPDATE_STAT_IND VARCHAR(1)) 
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_TSPR_CA010(
RECORD_TYPE VARCHAR(1),
LIMIT_ID VARCHAR(32),
TYPE VARCHAR(1),
SUPPLIER_BUYER_NAME VARCHAR(100),
UPDATE_STAT_IND VARCHAR(1)) 
in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_TSPR_CO021(
RECORD_TYPE VARCHAR(1),
FACILITY_ID VARCHAR(32),
FD_RECEIPT_NO VARCHAR(15),
FD_DEPOSIT_AMT_CURRENCY VARCHAR(3),
FD_DEPOSIT_AMT DECIMAL(30,4),
FD_DEPOSIT_DATE TIMESTAMP,
cms_security_type_id varchar(5),
cms_security_subtype_id varchar(10)) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE VIEW VIEW_SI_CO019_TSPR AS
  SELECT L.LMT_ID, S.CMS_COLLATERAL_ID, S.TYPE_NAME, COALESCE (S.CMV, 0) AS CMV
  FROM CMS_SECURITY S, CMS_LIMIT_SECURITY_MAP LSM, SCI_LSP_APPR_LMTS L
  WHERE S.CMS_COLLATERAL_ID = LSM.CMS_COLLATERAL_ID
    AND L.CMS_LSP_APPR_LMTS_ID = LSM.CMS_LSP_APPR_LMTS_ID AND L.SOURCE_ID = 'TSPR';


alter table SI_TEMP_TSPR_CA006
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_TSPR_CA008
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_TSPR_CA010
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_TSPR_CO021
	add column IS_VALID character(1) DEFAULT 'Y';
alter table SI_TEMP_TSPR_CO021
	add column CIF_ID VARCHAR(19);

-- performance index
CREATE INDEX SI_TSPR_CA006_IDX1 ON SI_TEMP_TSPR_CA006
(IS_VALID ASC, CIF_ID ASC);  
CREATE INDEX SI_TSPR_CA006_IDX2 ON SI_TEMP_TSPR_CA006
(outer_limit_id ASC, limit_id ASC); 
CREATE INDEX SI_TSPR_CA006_IDX3 ON SI_TEMP_TSPR_CA006
(TRADE_ACCT_NO ASC, TRADE_ACCT_SEQ ASC);

CREATE INDEX SI_TSPR_CA008_IDX1 ON SI_TEMP_TSPR_CA008
(IS_VALID ASC, LIMIT_ID ASC, INTEREST_MODE ASC);
CREATE INDEX SI_TSPR_CA010_IDX1 ON SI_TEMP_TSPR_CA010
(IS_VALID ASC, LIMIT_ID ASC, TYPE ASC, SUPPLIER_BUYER_NAME ASC);
CREATE INDEX SI_TSPR_CO021_IDX1 ON SI_TEMP_TSPR_CO021
(IS_VALID ASC, FACILITY_ID ASC);  



--RUNSTATS ON TABLE CLIMS_LOCAL.SI_TEMP_TSPR_CA006 ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL;
--RUNSTATS ON TABLE CLIMS_LOCAL.SI_TEMP_TSPR_CA008 ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL;
--RUNSTATS ON TABLE CLIMS_LOCAL.SI_TEMP_TSPR_CA010 ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL;
--RUNSTATS ON TABLE CLIMS_LOCAL.SI_TEMP_TSPR_CO021 ON ALL COLUMNS WITH DISTRIBUTION AND DETAILED INDEXES ALL;

commit work;
