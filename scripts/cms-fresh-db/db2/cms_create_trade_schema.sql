--drop table TRADE_MASTER_TRANS;
--drop table TRADE_TRANS_ERROR;
--drop table TRADE_TRANS;
--drop table TRADE_TRANS_HISTORY;
--DROP TABLE TRADE_BIZ_ERROR_CODE;

CREATE TABLE TRADE_MASTER_TRANS ( 
	MASTER_TRX_ID	        BIGINT NOT NULL,
	TRANSACTION_ID        VARCHAR(20),
	STATUS       			VARCHAR(20),
	TRANSACTION_TYPE		VARCHAR(20),
	REFERENCE_ID			BIGINT,
	LAST_SUBMISSION_DATE timestamp,
	PRIMARY KEY(MASTER_TRX_ID)
) IN CMS_STP INDEX IN CMS_STP_INDEX;

CREATE INDEX TRADE_MASTER_TRX_IDX1
	ON TRADE_MASTER_TRANS (TRANSACTION_ID, TRANSACTION_TYPE)
	ALLOW REVERSE SCANS;
	
CREATE INDEX TRADE_MASTER_TRX_IDX2
ON TRADE_MASTER_TRANS (STATUS, LAST_SUBMISSION_DATE)
ALLOW REVERSE SCANS;	

CREATE TABLE TRADE_TRANS_HISTORY ( 
	TRX_HISTORY_ID			BIGINT NOT NULL,
	TRX_ID	         		BIGINT NOT NULL,
	MASTER_TRX_ID			BIGINT,
	USER_ID                	BIGINT,
	TRX_TYPE		       	VARCHAR(10),
	CREATION_DATE          	TIMESTAMP,
	LAST_UPDATE_DATE       	TIMESTAMP,
	STATUS                 	VARCHAR(30),
	CUR_TRX_HISTORY_ID     	VARCHAR(20),
	MSG_COUNT				INTEGER DEFAULT 0,
	REQUEST_MSG				BLOB(4096),
	RESPONSE_CODE			VARCHAR(2),
	TRX_UID						BIGINT,
	REFERENCE_ID			BIGINT,
	OPS_DESC					VARCHAR(20),
	PRIMARY KEY(TRX_HISTORY_ID)
) IN CMS_STP INDEX IN CMS_STP_INDEX;

CREATE SEQUENCE TRADE_MASTER_TRANS_SEQ AS INTEGER
	MINVALUE 1 MAXVALUE 999999999
	START WITH 1 INCREMENT BY 1
	NO CACHE CYCLE NO ORDER; 

CREATE SEQUENCE CMS_CORRELATION_ID_SEQ AS INTEGER
	MINVALUE 1 MAXVALUE 999999999
	START WITH 1 INCREMENT BY 1
	NO CACHE CYCLE NO ORDER; 

CREATE SEQUENCE TRADE_TRANS_HISTORY_SEQ AS INTEGER
	MINVALUE 1 MAXVALUE 999999999
	START WITH 1 INCREMENT BY 1
	NO CACHE CYCLE NO ORDER; 
  