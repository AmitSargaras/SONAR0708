--  SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@

DROP table SI_TEMP_OTHR_PF004;

DROP TABLE SI_TEMP_OTHR_PF003;



CREATE TABLE SI_TEMP_OTHR_PF004(
  COMPOSITE_ID    VARCHAR(100),
  REGION          VARCHAR(3),
  CAR_MAKE        VARCHAR(50),
  CAR_MODEL       VARCHAR(50),
  CAR_YEAR        INTEGER,
  CAR_FSV         DECIMAL(17,2),
  PURCHASE_CURRENCY VARCHAR(3),
  LAST_UPDATE_DATE TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  	IS_VALID      VARCHAR(1) DEFAULT 'Y'
) in CMS_BATCH index in CMS_BATCH_INDEX;


CREATE TABLE SI_TEMP_OTHR_PF003 (
  COMPOSITE_ID    	VARCHAR(100),
  CIF_ID		VARCHAR(20),
  SOURCE_SECURITY_ID	VARCHAR(20),
  VALUER_NAME          	VARCHAR(100),
  VALUER_CODE		VARCHAR(5),
  OMV	         	DECIMAL(17,2),
  FSV	         	DECIMAL(17,2),
  RESERVED_PRICE       	DECIMAL(17,2),
  VALUATION_CURRENCY	VARCHAR(3),
  CMS_COLLATERAL_ID    	BIGINT,
  VALUATION_DATE        TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  NEXT_VALUATION_DATE   TIMESTAMP,  
  VALUATION_FREQ_UNIT  	VARCHAR(20),
  VALUATION_FREQ       	BIGINT,
  HAIRCUT               DECIMAL(5,2),
  MARGIN 		DECIMAL(5,2),
  LAST_UPDATE_DATE 	TIMESTAMP DEFAULT CURRENT TIMESTAMP,
  IS_VALID 		VARCHAR(1) DEFAULT 'Y'
) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE TABLE SI_TEMP_INSR_POLICY (
  APPLICATION_NUM		VARCHAR(20),
  FACILITY_CODE			VARCHAR(3),
  FACILITY_SEQ			BIGINT,
  COLLATERAL_NAME   	VARCHAR(40),
  COLLATERAL_SEQ		VARCHAR(3),
  ACCOUT_NUM	    	VARCHAR(19),
  INSR_POLICY_NO		VARCHAR(20),
  INSURED_AMOUNT    	DECIMAL(15,2),
  GROSS_PREMIUM_AMOUNT	DECIMAL(13,2),
  COMMISSION_AMOUNT    	DECIMAL(13,2),
  REBATE_AMOUNT        	DECIMAL(13,2),
  SERVICE_TAX_AMOUNT   	DECIMAL(13,2),
  STAMP_DUTY_AMOUNT   	DECIMAL(13,2),
  SERVICE_TAX_PERC  	DECIMAL(5,2),
  NET_PREM_TO_BORROWER  DECIMAL(13,2),
  NET_PREM_TO_COMPANY   DECIMAL(13,2),
  INSR_EXPIRY_DATE 		TIMESTAMP,
  IS_VALID 				VARCHAR(1) DEFAULT 'Y'
) in CMS_BATCH index in CMS_BATCH_INDEX;

CREATE INDEX IDX_SI_OTHR_INSR_POL_NO
ON SI_TEMP_INSR_POLICY(COLLATERAL_NAME, COLLATERAL_SEQ, IS_VALID)
ALLOW REVERSE SCANS ;

----------------------
---* INDEX FOR PF004
----------------------
CREATE INDEX SI_OTHR_PF004_IDX1
ON SI_TEMP_OTHR_PF004(REGION, CAR_MAKE, CAR_MODEL, CAR_YEAR)
ALLOW REVERSE SCANS ;

----------------------
---* INDEX FOR PF003
----------------------
CREATE INDEX SI_OTHR_PF003_IDX1
ON SI_TEMP_OTHR_PF003 (CMS_COLLATERAL_ID, OMV, FSV)
ALLOW REVERSE SCANS ;



reorg table SI_TEMP_OTHR_PF004;

reorg table SI_TEMP_OTHR_PF003;



COMMIT;








	
