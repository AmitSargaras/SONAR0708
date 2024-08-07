CREATE TABLE HOST_BRANCH (
    CMS_HOST_BRANCH_ID        	BIGINT NOT NULL,
	BRANCH_NUM					VARCHAR(10),
	BRANCH_NAME					VARCHAR(50),
	FIS_BRANCH_ID 				VARCHAR(3),
	CONVENTIONAL_ISLAMIC_IND	CHAR(1),
	BANK_BRANCH_ID              VARCHAR(40),
	SPTF_BRANCH_ID              VARCHAR(40),
    BRANCH_OPENING_DATE         TIMESTAMP,
    CLOSED_BRANCH_IND	        CHAR(1),
	COUNTRY						CHAR(2),
	STATE						VARCHAR(10),
	-- RC_CODE						VARCHAR(10),
	-- CAC_CODE					VARCHAR(10),
	CENTRE_TYPE		        VARCHAR(10),
	CENTRE_CODE		        VARCHAR(10),
    STATUS                      VARCHAR(10),
    LAST_UPDATED_DATE           TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX HOST_BRANCH_IDX1
	ON HOST_BRANCH (CENTRE_TYPE, CENTRE_CODE, BRANCH_NUM)
	ALLOW REVERSE SCANS;

CREATE SEQUENCE HOST_BRANCH_SEQ AS INTEGER
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 999999999
	MINVALUE 1
	CYCLE
	NO CACHE
	NO ORDER;

CREATE TABLE HOST_PRODUCT_TYPE (
	LOAN_TYPE				VARCHAR(10),
	DESC					VARCHAR(40),
	GROUP_CODE				VARCHAR(10),
	GROUP_DESC				VARCHAR(20),
	COMMERCIAL_RETAIL_IND	CHAR(1),
	CURRENCY				CHAR(3),
	MIN_INT_RATE			DECIMAL(11,9),
	MAX_INT_RATE			DECIMAL(11,9),
	RATE_FLOOR				DECIMAL(11,9),
	RATE_CEILING			DECIMAL(11,9),
	STAFF_IND				CHAR(1),
	ACT_IND					CHAR(1),
	TIER_LOAN_IND			CHAR(1),
	SPTF_LOAN_TYPE			CHAR(1),
	PRIME_RATE_NUM			VARCHAR(10),
	MAX_LOAN_TENURE			SMALLINT,
	MIN_LOAN_TENURE			SMALLINT,
	SOURCE					VARCHAR(10),
    STATUS                  VARCHAR(10),
    INTEREST_BASE			CHAR(1),
    CONCEPT_CODE			CHAR(2),
    PRODUCT_GROUP 			VARCHAR(2),
    DEALER_PRODUCT_IND      CHAR(1),
	PRODUCT_LIMIT      		DECIMAL(15,2),
	PRODUCT_EXPIRY_DATE		TIMESTAMP,
	PRODUCT_AGE_LIMIT		SMALLINT,
	PAYMENT_FREQUENCY      	SMALLINT,
	PAYMENT_FREQ_CODE		CHAR(1),
	PAYMENT_CODE			SMALLINT,
    GRATUITY_FINANCING		CHAR(1),
    INTEREST_MODE 		    CHAR(1),
    PROMO_PACKAGE_CODE 		CHAR(1),
    REBATE_METHOD_BANK 		CHAR(1),
    LAST_UPDATED_DATE       TIMESTAMP,
    VAR_RATE                CHAR(1)
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX HOST_PRODUCT_TYPE_IDX1
	ON HOST_PRODUCT_TYPE (LOAN_TYPE, SPTF_LOAN_TYPE, CONCEPT_CODE, INTEREST_BASE)
	ALLOW REVERSE SCANS;

CREATE INDEX "HOST_PRODUCT_TYPE_IDX2" 
	ON "HOST_PRODUCT_TYPE" ("LOAN_TYPE" ASC, "CURRENCY" ASC, "SPTF_LOAN_TYPE" ASC)
	ALLOW REVERSE SCANS;	


CREATE TABLE HOST_FACILITY_TYPE (
	FACILITY_CODE			VARCHAR(10),
	LOAN_TYPE				VARCHAR(10),
	CURRENCY				CHAR(3),
	REVOLVING_IND			CHAR(1),
	REV_OS_BAL_ORGAMT		CHAR(1),
	DESC					VARCHAR(50),
	ACCOUNT_TYPE      		CHAR(1),
    STATUS                  VARCHAR(10),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX "HOST_FACILITY_TYPE_IDX1" 
	ON "HOST_FACILITY_TYPE" ("FACILITY_CODE" ASC, "ACCOUNT_TYPE" DESC)
	ALLOW REVERSE SCANS;


CREATE TABLE HOST_CENTRE (
	CENTRE_TYPE		        VARCHAR(10),
	CENTRE_CODE		        VARCHAR(10),
	NAME			        VARCHAR(50),
	HAS_BRANCH		        CHAR(1),
    STATUS                  VARCHAR(10),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX HOST_CENTRE_IDX1
	ON HOST_CENTRE (CENTRE_TYPE, CENTRE_CODE) 
	ALLOW REVERSE SCANS;

CREATE TABLE HOST_DEALER (
	DEALER_NUM				VARCHAR(15),
	DEALER_NAME				VARCHAR(255),
	DEALER_SHORT_NAME		VARCHAR(255),
	FORMATTED_SHORT_NAME	VARCHAR(255),
	CIF						VARCHAR(20),
	ADDR_LINE_1				VARCHAR(255),
	ADDR_LINE_2				VARCHAR(255),
	ADDR_LINE_3				VARCHAR(255),
	PHONE_1					VARCHAR(30),
	PHONE_2					VARCHAR(30),
	LIMIT_AMT				DECIMAL(20,2),
	RESERVE_AMT				DECIMAL(20,2),
	AMT_UTILISED			DECIMAL(20,2),
	DEALER_PLAN				CHAR(1),
	DEALER_GROUP			VARCHAR(20),
	OFFICER_CODE			VARCHAR(20),
	EXPIRY_DATE_1			TIMESTAMP,
	EXPIRY_DATE_2			TIMESTAMP,
	REVOLVING_IND			CHAR(1),
	ACCRUAL_PERCENT			DECIMAL(11,9),
	DEALER_STATUS			CHAR(2),
	DATE_RECRUITED_1		TIMESTAMP,
	DATE_RECRUITED_2		TIMESTAMP,
	MIN_INT_DAYS			SMALLINT,
	INT_SUBSIDY_DAYS		SMALLINT,
	PRODUCT_GRP				CHAR(5),
	BRANCH_SERVED			VARCHAR(20),
	GROSS_DEV_VALUE			DECIMAL(20,2),
	GROSS_DEV_COST			DECIMAL(20,2),
	SECURITY_VAL			DECIMAL(20,2),
	UNDER_LIMIT_FBR			DECIMAL(20,2),
	UNDER_LIMIT_FBT			DECIMAL(20,2),
	RECOND_IND				CHAR(1),
	USED_IND				CHAR(1),
	NEW_IND					CHAR(1),
	NEW_NATIONAL			CHAR(1),
	DEALER_STATUS_2			CHAR(1),
	DEALER_STATUS_DATE_1	TIMESTAMP,
	DEALER_STATUS_DATE_2	TIMESTAMP,
	RESCHEDULED_IND			CHAR(1),
	DELIQUENCY_RATE			DECIMAL(11,9),
	FIS_MEMBER_IND			CHAR(1),
	FIS_DEALER_CODE			VARCHAR(20),
	REMARKS					VARCHAR(255),
	TYPE					CHAR(1),
    STATUS                  VARCHAR(20),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX HOST_DEALER_IDX1
	ON HOST_DEALER (DEALER_NUM, DEALER_STATUS_2, STATUS)
	ALLOW REVERSE SCANS;

CREATE TABLE HOST_INSURANCE_CO (
	INS_NUM			        VARCHAR(10),
	INS_NAME		        VARCHAR(40),
	INS_ADDRESS		        VARCHAR(40),
	INS_CITY_STATE	        VARCHAR(40),
	INS_PHONE		        VARCHAR(30),
	RESERVE_PERCENT	        DECIMAL(11,9),
	PANEL_IND		        CHAR(1),
    STATUS                  VARCHAR(10),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE TABLE HOST_LAWYER (
	LAWYER_CODE		        VARCHAR(10),
	LAWYER_TYPE		        CHAR(1),
	LAWYER_REF_NUM	        VARCHAR(40),
	LAWYER_NAME		        VARCHAR(40),
	STATUS			        CHAR(1),
	REMARKS			        VARCHAR(50),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE TABLE CMS_WORKING_DAYS (
	PROCESSING_DATE		TIMESTAMP,
	BIZ_DAY_FLAG		CHAR(1),
	BRANCH				VARCHAR(10),
    STATUS              VARCHAR(10),
    LAST_UPDATED_DATE   TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;


CREATE INDEX CMS_WORKING_DAYS_IDX1
	ON CMS_WORKING_DAYS(PROCESSING_DATE, BRANCH)
	ALLOW REVERSE SCANS ;
	

CREATE TABLE CMS_TEMP_WORKING_DAYS (
	PROCESSING_DATE		TIMESTAMP,
	BIZ_DAY_FLAG		CHAR(1),
	BRANCH			VARCHAR(10),
    	STATUS              	VARCHAR(10),
    	LAST_UPDATED_DATE   	TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;


CREATE INDEX CMS_TEMP_WORKING_DAYS_IDX1
	ON CMS_TEMP_WORKING_DAYS(PROCESSING_DATE, BRANCH)
	ALLOW REVERSE SCANS ;


CREATE TABLE HOST_CUST_LMT (
	BANK_NUM				VARCHAR(10),
	LAST_MAINTENANCE_DATE	TIMESTAMP,
	ISCL_SECURED_LOAN		DECIMAL(7,4),
	ISCL_UNSECURED_LOAN		DECIMAL(7,4),
	SECURED_INDIVIDUAL		DECIMAL(17,2),
	UNSECURED_INDIVIDUAL	DECIMAL(17,2),
	 CAPITAL_FUNDS 			DECIMAL(17,2),
    STATUS                  VARCHAR(10),
    LAST_UPDATED_DATE       TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;


CREATE TABLE HOST_PRODUCT_PACKAGE (
	PACKAGE_CODE		VARCHAR(10),
	DESCRIPTION			VARCHAR(40),
	EXPIRY_DATE			TIMESTAMP,
	EFFECTIVE_DATE		TIMESTAMP,
	FUND_ALLOCATED		DECIMAL(15,2),
	STATUS				VARCHAR(10),
	LAST_UPDATE_DATE	TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;


CREATE TABLE CMS_PUBLIC_HOLIDAY (
	HOLIDAY_DATE     	TIMESTAMP NOT NULL,
	COUNTRY_ISO_CODE 	VARCHAR(3) NOT NULL,
	STATE_CODE          	VARCHAR(3),
	DESCRIPTION      	VARCHAR(60),
	STATUS			VARCHAR(10),
	LAST_UPDATED_DATE	TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX CMS_PUBLIC_HOLIDAY_IDX1
	ON CMS_PUBLIC_HOLIDAY(HOLIDAY_DATE, COUNTRY_ISO_CODE,STATE_CODE)
	ALLOW REVERSE SCANS ;

CREATE TABLE CMS_TEMP_PUBLIC_HOLIDAY (
	HOLIDAY_DATE     	TIMESTAMP NOT NULL,
	COUNTRY_ISO_CODE 	VARCHAR(3) NOT NULL,
	STATE_CODE          	VARCHAR(3),
	DESCRIPTION      	VARCHAR(60),
	STATUS			VARCHAR(10),
	LAST_UPDATED_DATE	TIMESTAMP
) IN CMS_SMALL_DATA INDEX IN CMS_INDEX;

CREATE INDEX CMS_TEMP_PUBLIC_HOLIDAY_IDX1
	ON CMS_TEMP_PUBLIC_HOLIDAY(HOLIDAY_DATE, COUNTRY_ISO_CODE,STATE_CODE)
	ALLOW REVERSE SCANS ;



