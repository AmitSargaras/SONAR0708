DROP TABLE PATCH_CO016_IN;
DROP TABLE PATCH_ERROR_LOG;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCHEMA for PATCHING TABLE
--------------------------------------
CREATE TABLE PATCH_CO016_IN (
	cms_act_col_id 		bigint,
    cms_stg_col_id 		bigint,
    cms_act_insr_id 	bigint,
    cms_stg_insr_id 	bigint,
	IS_VALID 			CHAR(1) DEFAULT 'Y',
	-- Keys
	AA_NUMBER			VARCHAR(35),
	SECURITY_REF_NOTE   VARCHAR(40),
	POLICY_SEQ_NO		VARCHAR(3),
	POLICY_NUMBER       VARCHAR(100),
	INSURER_NAME		VARCHAR(100),
	-- Fields to be update
	INSURER_NAME_CODE 			VARCHAR(3) DEFAULT '117',
	BANK_CUST_ARRANGE_INS_IND 	VARCHAR(1) DEFAULT 'B',
	INSURANCE_TYPE_CODE 		VARCHAR(3),
	EFFECTIVE_DATE 				TIMESTAMP,
	EXPIRY_DATE 				TIMESTAMP,
	INSURED_AMT 				DECIMAL(19,2),
	TYPE_OF_BUILDING			VARCHAR(3),
	BUILDING_OCCUPATION_CODE	VARCHAR(3),
	WALL						VARCHAR(3),
	ROOF						VARCHAR(3),
	TYPE_OF_FLOOR				VARCHAR(3),
	NUMBER_OF_STOREY			DECIMAL(9,2),
	-- Common category code
	INSURER_NAME_CAT 			VARCHAR(15) DEFAULT 'INSURER_NAME',
	BANK_CUST_ARRANGE_INS_CAT 	VARCHAR(15) DEFAULT 'ARR_INSURER',
	INSURANCE_TYPE_CAT 			VARCHAR(15) DEFAULT 'INSURANCE_TYPE',
	BUILDING_OCCUPATION_CAT		VARCHAR(5) 	DEFAULT 'BO',
) in CMS_MIG index in CMS_MIG_INDEX;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCHEMA for PATCHING ERROR LOG
--------------------------------------
CREATE TABLE PATCH_ERROR_LOG (
	SI_NUMBER		BIGINT	GENERATED ALWAYS
								AS IDENTITY (START WITH 0, INCREMENT BY 1, NO CACHE,
								NO MINVALUE, NO MAXVALUE, NO CYCLE, NO ORDER),
	TIME_STAMP		TIMESTAMP,
	SYSTEM_ID	    VARCHAR(10),
	INTERFACE_ID	VARCHAR(10),
	KEY1_VALUE		VARCHAR(50),
	KEY2_VALUE		VARCHAR(50),
	KEY3_VALUE		VARCHAR(50),
	KEY4_VALUE		VARCHAR(50),
	KEY5_VALUE		VARCHAR(50),
	ERROR_CODE		VARCHAR(20),
	ERROR_MSG	    VARCHAR(1000)
) in CMS_MIG index in CMS_MIG_INDEX;
	
CREATE INDEX PATCH_ERROR_LOG_IDX1 ON PATCH_ERROR_LOG
	(INTERFACE_ID ASC, SYSTEM_ID ASC) ALLOW REVERSE SCANS;
