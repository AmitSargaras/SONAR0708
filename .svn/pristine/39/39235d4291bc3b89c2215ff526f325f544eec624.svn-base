create table CMS_FCC_COL_PROCESS_UPLOAD (
	ID NUMBER(19,0), 
	FILETYPE VARCHAR2(300 BYTE), 
	REMOTE_PATH VARCHAR2(300 BYTE),
	FILE_NAME VARCHAR2(300 BYTE), 
	TOTAL_RECORDS VARCHAR2(300 BYTE), 
	UPLOAD_TIME TIMESTAMP (6),
  STATUS VARCHAR2(300 BYTE)
);
CREATE SEQUENCE  CMS_FCC_COL_PROCESS_UPLOAD_SEQ  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;





INSERT INTO COMMON_CODE_CATEGORY_ENTRY
  (
    ENTRY_ID,
    ENTRY_CODE,
    ENTRY_NAME,
    ACTIVE_STATUS,
    CATEGORY_CODE,
    CATEGORY_CODE_ID,
    ENTRY_SOURCE,
    COUNTRY,
    GROUP_ID,
    REF_ENTRY_CODE,
    VERSION_TIME,
    STATUS,
    CREATION_DATE,
    LAST_UPDATE_DATE,
    CPS_ID,
    EOD_SYNC_STATUS
  )
  VALUES
  (
    (SELECT MAX(ENTRY_ID)+1 FROM COMMON_CODE_CATEGORY_ENTRY
    )
    ,
    'RPT0078',
    'NPA-FD-BH-Reject Report',
    '1',
    'REPORTS',
    313,
    NULL,
    'IN',
    NULL,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    'SUCCESSFUL'
  );
  
  INSERT INTO COMMON_CODE_CATEGORY_ENTRY
  (
    ENTRY_ID,
    ENTRY_CODE,
    ENTRY_NAME,
    ACTIVE_STATUS,
    CATEGORY_CODE,
    CATEGORY_CODE_ID,
    ENTRY_SOURCE,
    COUNTRY,
    GROUP_ID,
    REF_ENTRY_CODE,
    VERSION_TIME,
    STATUS,
    CREATION_DATE,
    LAST_UPDATE_DATE,
    CPS_ID,
    EOD_SYNC_STATUS
  )
  VALUES
  (
    (SELECT MAX(ENTRY_ID)+1 FROM COMMON_CODE_CATEGORY_ENTRY
    )
    ,
    'RPT0079',
    'NPA-FD-GC-Reject Report',
    '1',
    'REPORTS',
    313,
    NULL,
    'IN',
    NULL,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    'SUCCESSFUL'
  );
  
  
   INSERT INTO COMMON_CODE_CATEGORY_ENTRY
  (
    ENTRY_ID,
    ENTRY_CODE,
    ENTRY_NAME,
    ACTIVE_STATUS,
    CATEGORY_CODE,
    CATEGORY_CODE_ID,
    ENTRY_SOURCE,
    COUNTRY,
    GROUP_ID,
    REF_ENTRY_CODE,
    VERSION_TIME,
    STATUS,
    CREATION_DATE,
    LAST_UPDATE_DATE,
    CPS_ID,
    EOD_SYNC_STATUS
  )
  VALUES
  (
    (SELECT MAX(ENTRY_ID)+1 FROM COMMON_CODE_CATEGORY_ENTRY
    )
    ,
    'RPT0080',
    'NPA-FD-HK-Reject Report',
    '1',
    'REPORTS',
    313,
    NULL,
    'IN',
    NULL,
    NULL,
    0,
    NULL,
    NULL,
    NULL,
    NULL,
    'SUCCESSFUL'
  );
  
  
CREATE TABLE CMS_FCC_COL_DOWNLOAD_FILE
(
SYSTEM_ID                       VARCHAR2(20),
LIEN_NUMBER                     VARCHAR2(30 CHAR),
SERIAL_NO                       VARCHAR2(20),
CMS_COLLATERAL_ID               VARCHAR2(60),
COLLATERAL_CODE                 VARCHAR2(100),
SUBTYPE_NAME                    VARCHAR2(100 CHAR),
DEPOSIT_RECEIPT_NUMBER          VARCHAR2(25 CHAR),
DEPOSIT_AMOUNT                  NUMBER(38,2),
LIEN_AMOUNT                     NUMBER(17,2),
DEPOSIT_AMOUNT_CURRENCY         CHAR(30 CHAR),
SCI_SECURITY_CURRENCY           CHAR(15 CHAR),
SYSTEM_NAME                     VARCHAR2(50),
FILE_NAME                       VARCHAR2(50),
REJECT_DATE                     VARCHAR2(20),
REJECT_REASON                   VARCHAR2(200),
CREATE_DATE                     TIMESTAMP(9),
FD_SYSTEMS_NAME                  VARCHAR2(50)
);
 
CREATE TABLE CMS_FCC_COL_DOWNLOAD_FILE_LOGS
(
SYSTEM_ID                       VARCHAR2(20),
LIEN_NUMBER                     VARCHAR2(30 CHAR),
SERIAL_NO                       VARCHAR2(20),
CMS_COLLATERAL_ID               VARCHAR2(60),
COLLATERAL_CODE                 VARCHAR2(100),
SUBTYPE_NAME                    VARCHAR2(100 CHAR),
DEPOSIT_RECEIPT_NUMBER          VARCHAR2(25 CHAR),
DEPOSIT_AMOUNT                  NUMBER(38,2),
LIEN_AMOUNT                     NUMBER(17,2),
DEPOSIT_AMOUNT_CURRENCY         CHAR(30 CHAR),
SCI_SECURITY_CURRENCY           CHAR(15 CHAR),
SYSTEM_NAME                     VARCHAR2(50),
FILE_NAME                       VARCHAR2(50),
REJECT_DATE                     VARCHAR2(20),
REJECT_REASON                   VARCHAR2(200),
CREATE_DATE                     TIMESTAMP(9),
FD_SYSTEMS_NAME                  VARCHAR2(50)
);
 -- NEW PROCEDURE ADDED SP_FCC_TEMP_TO_ACTUAL 
 




create or replace PROCEDURE SP_FCC_TEMP_TO_ACTUAL
AS

    CURSOR CR_TEMP_FCC_DOWNLOAD
        IS
            SELECT *
            FROM CMS_FCC_COL_DOWNLOAD_FILE WHERE SYSTEM_NAME IN ('BAHRAIN','GIFTCITY','HONGKONG') ;
            RC_TEMP_FCC CR_TEMP_FCC_DOWNLOAD%ROWTYPE;

            

    BEGIN

      OPEN CR_TEMP_FCC_DOWNLOAD;
          LOOP
                FETCH CR_TEMP_FCC_DOWNLOAD INTO RC_TEMP_FCC;
                EXIT
                WHEN CR_TEMP_FCC_DOWNLOAD%NOTFOUND;

                   



                  INSERT INTO CMS_FCC_COL_DOWNLOAD_FILE_LOGS
                  (
                    SYSTEM_ID                       ,
					LIEN_NUMBER                     ,
					SERIAL_NO                       ,
					CMS_COLLATERAL_ID               ,
					COLLATERAL_CODE                 ,
					SUBTYPE_NAME                    ,
					DEPOSIT_RECEIPT_NUMBER          ,
					DEPOSIT_AMOUNT                 ,
					LIEN_AMOUNT                    ,
					DEPOSIT_AMOUNT_CURRENCY         ,
					SCI_SECURITY_CURRENCY           ,
					SYSTEM_NAME                     ,
					FILE_NAME                       ,
					REJECT_DATE                     ,
					REJECT_REASON 					,
					CREATE_DATE
                    )
                    VALUES
                    (
                    RC_TEMP_FCC.SYSTEM_ID,
                    RC_TEMP_FCC.LIEN_NUMBER,
                    RC_TEMP_FCC.SERIAL_NO,
                    RC_TEMP_FCC.CMS_COLLATERAL_ID,
                    RC_TEMP_FCC.COLLATERAL_CODE,
                    RC_TEMP_FCC.SUBTYPE_NAME,
                    RC_TEMP_FCC.DEPOSIT_RECEIPT_NUMBER,
                    RC_TEMP_FCC.DEPOSIT_AMOUNT,
                    RC_TEMP_FCC.LIEN_AMOUNT,
                    RC_TEMP_FCC.DEPOSIT_AMOUNT_CURRENCY,
                    RC_TEMP_FCC.SCI_SECURITY_CURRENCY,
                    RC_TEMP_FCC.SYSTEM_NAME,
                    RC_TEMP_FCC.FILE_NAME,
                    RC_TEMP_FCC.REJECT_DATE,
                    RC_TEMP_FCC.REJECT_REASON,
					RC_TEMP_FCC.CREATE_DATE
                    );
   commit;

  DELETE FROM CMS_FCC_COL_DOWNLOAD_FILE WHERE SYSTEM_NAME IN ('BAHRAIN','GIFTCITY','HONGKONG');
 commit;
  END LOOP;
  commit;
   CLOSE CR_TEMP_FCC_DOWNLOAD;

END SP_FCC_TEMP_TO_ACTUAL;
  