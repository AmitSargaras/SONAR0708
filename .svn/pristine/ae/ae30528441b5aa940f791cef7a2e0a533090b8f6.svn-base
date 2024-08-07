ALTER TABLE CMS_ASSET_GC_DET
ADD 
(
STOCK_DOC_MONTH VARCHAR2(10),
STOCK_DOC_YEAR VARCHAR2(10)
);

ALTER TABLE CMS_STAGE_ASSET_GC_DET
ADD 
(
STOCK_DOC_MONTH VARCHAR2(10),
STOCK_DOC_YEAR VARCHAR2(10)
);


ALTER TABLE CMS_FCUBSDATA_LOG
ADD 
(
STOCK_DOC_MONTH_YEAR VARCHAR2(20)
);


----FUNCTION----------------------
create or replace Function FindStockDocMonthAndYear
   ( col_id IN varchar2,str IN VARCHAR2 )
   RETURN VARCHAR2
IS
   monthOrYear VARCHAR2(20);
   
  cursor c1 is
  SELECT STOCK_DOC_MONTH FROM CMS_ASSET_GC_DET WHERE GC_DET_ID = (SELECT max(GC_DET_ID) FROM CMS_ASSET_GC_DET WHERE CMS_COLLATERAL_ID = col_id AND 
  DUE_DATE = (SELECT MAX(DUE_DATE) FROM CMS_ASSET_GC_DET WHERE CMS_COLLATERAL_ID = col_id )  ) order by GC_DET_ID desc ;
  
  cursor c2 is
  SELECT STOCK_DOC_YEAR FROM CMS_ASSET_GC_DET WHERE GC_DET_ID = (SELECT max(GC_DET_ID) FROM CMS_ASSET_GC_DET WHERE CMS_COLLATERAL_ID = col_id AND 
  DUE_DATE = (SELECT MAX(DUE_DATE) FROM CMS_ASSET_GC_DET WHERE CMS_COLLATERAL_ID = col_id )  ) order by GC_DET_ID desc ;

BEGIN
  IF (str = 'M') THEN
   open c1;
   fetch c1 into monthOrYear;

   if c1%notfound then
      monthOrYear := null;
   end if;

   close c1;
   
   ELSIF (str = 'Y') THEN
   open c2;
   fetch c2 into monthOrYear;

   if c2%notfound then
      monthOrYear := null;
   end if;

   close c2;
   END IF;

RETURN monthOrYear;

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;


--------------------------------------------------------------------------------------------------------

--------AUTOUPDATION OF LIMITS UPLOAD-----------------------------------------------

SET DEFINE OFF;

INSERT
INTO CMS_FUNCTION_ACCESS
  (
    ID,
    ACTION,
    EVENT,
    ROLE_TYPE
  )
SELECT MAX(ID)+1,'AutoupdationLmtsupload','*','-1' FROM CMS_FUNCTION_ACCESS;

CREATE TABLE STAGE_AUTOUPDATIONLMTS_UPLOAD
  (
    ID                          NUMBER(19),
    FILE_ID                     NUMBER(19),
    PARTY_ID                 VARCHAR2(20),
    PARTY_NAME           VARCHAR2(30),
    FACILITY_ID          VARCHAR2(30),
    FACILITY_NAME         VARCHAR2(50),
    LINE_NO             VARCHAR2(20),
    SERIAL_NO           VARCHAR2(30),
    LIAB_BRANCH             VARCHAR2(30),
    SECURITY_SUB_TYPE             VARCHAR2(50),
    SECURITY_ID                 VARCHAR2(20),
    CMS_LSP_SYS_XREF_ID          VARCHAR2(20),
    FACILITY_SYSTEM_ID          VARCHAR2(50),
    FACILITY_SYSTEM          VARCHAR2(50),
    DUE_DATE                VARCHAR2(40),
    DOC_CODE               VARCHAR2(50),
    LINE_STATUS               VARCHAR2(20),
    AUTOUPDATION_STATUS         VARCHAR2(10 CHAR),
    REASON                      VARCHAR2(200),
    UPLOAD_STATUS       VARCHAR2(5 CHAR)  
  );
  
  
CREATE TABLE ACTUAL_AUTOUPDATIONLMTS_UPLOAD
  (
    ID                          NUMBER(19),
    FILE_ID                     NUMBER(19),
    PARTY_ID                 VARCHAR2(20),
    PARTY_NAME           VARCHAR2(30),
    FACILITY_ID          VARCHAR2(30),
    FACILITY_NAME         VARCHAR2(50),
    LINE_NO             VARCHAR2(20),
    SERIAL_NO           VARCHAR2(30),
    LIAB_BRANCH             VARCHAR2(30),
    SECURITY_SUB_TYPE             VARCHAR2(50),
    SECURITY_ID                 VARCHAR2(20),
    CMS_LSP_SYS_XREF_ID          VARCHAR2(20),
    FACILITY_SYSTEM_ID          VARCHAR2(50),
    FACILITY_SYSTEM          VARCHAR2(50),
    DUE_DATE                VARCHAR2(40),
    DOC_CODE               VARCHAR2(50),
    LINE_STATUS               VARCHAR2(20),
    AUTOUPDATION_STATUS         VARCHAR2(10 CHAR),
    REASON                      VARCHAR2(200),
    UPLOAD_STATUS       VARCHAR2(5 CHAR)
  );
  
  DROP TABLE STAGE_AUTOUPDATIONLMTS_UPLOAD;
   DROP TABLE ACTUAL_AUTOUPDATIONLMTS_UPLOAD;
  SET DEFINE OFF;
  
  CREATE SEQUENCE  CMS_AUTO_UPDATE_SEQ  MINVALUE 1 MAXVALUE 9999999 INCREMENT BY 1 START WITH 110 NOCACHE  NOORDER  NOCYCLE;
  
INSERT
INTO CMS_TRX_TOTRACK
  (
    TRANSACTION_TYPE,
    TOTRACK_URL,
    CURR_STATE,
    USER_STATE,
    USER_TRX_TYPE,
    FROM_STATE,
    TRANSACTION_SUBTYPE
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'AutoupdationLmtsupload.do?event=rejected_delete_read&toTrack=yes&TrxId=',
    'PENDING_CREATE',
    'Pending Upload',
    'Autoupdation of Limits',
    'ND',
    NULL
  );
  
  
INSERT
INTO CMS_TRX_TOTRACK
  (
    TRANSACTION_TYPE,
    TOTRACK_URL,
    CURR_STATE,
    USER_STATE,
    USER_TRX_TYPE,
    FROM_STATE,
    TRANSACTION_SUBTYPE
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'AutoupdationLmtsupload.do?event=rejected_delete_read&toTrack=yes&TrxId=',
    'REJECTED',
    'Rejected',
    'Autoupdation of Limits',
    NULL,
    NULL
  );
  
  
INSERT
INTO CMS_TRX_TOTRACK
  (
    TRANSACTION_TYPE,
    TOTRACK_URL,
    CURR_STATE,
    USER_STATE,
    USER_TRX_TYPE,
    FROM_STATE,
    TRANSACTION_SUBTYPE
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'AutoupdationLmtsupload.do?event=rejected_delete_read&toTrack=yes&TrxId=',
    'CLOSED',
    'Closed',
    'Autoupdation of Limits',
    NULL,
    NULL
  );
  
  
INSERT
INTO CMS_TRX_TOTRACK
  (
    TRANSACTION_TYPE,
    TOTRACK_URL,
    CURR_STATE,
    USER_STATE,
    USER_TRX_TYPE,
    FROM_STATE,
    TRANSACTION_SUBTYPE
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'AutoupdationLmtsupload.do?event=rejected_delete_read&toTrack=yes&TrxId=',
    'ACTIVE',
    'Approved',
    'Autoupdation of Limits',
    'PENDING_CREATE',
    NULL
  );
  
  
INSERT
INTO CMS_TRX_TOTRACK
  (
    TRANSACTION_TYPE,
    TOTRACK_URL,
    CURR_STATE,
    USER_STATE,
    USER_TRX_TYPE,
    FROM_STATE,
    TRANSACTION_SUBTYPE
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'AutoupdationLmtsupload.do?event=rejected_delete_read&toTrack=yes&TrxId=',
    'ACTIVE',
    'Closed',
    'Autoupdation of Limits',
    'REJECTED',
    NULL
  );
  
  SELECT * FROM tr_state_matrix WHERE stateins = 'AUTO_UPLOAD';
  SELECT * FROM tr_state_matrix WHERE stateins = 'ACK_UPLOAD';
INSERT
INTO tr_state_matrix
  (
    stateid,
    stateins,
    operation,
    fromstate,
    tostate,
    userstate,
    enableind,
    frontendop
  )
  VALUES
  (
    (SELECT MAX(stateid)+1 FROM tr_state_matrix
    )
    ,
    'AUTO_UPLOAD',
    'APPROVE_FILEUPLOAD_NEW',
    'PENDING_CREATE',
    'ACTIVE',
    'ACTIVE',
    '1',
    '1'
  );
  
  
INSERT
INTO tr_state_matrix
  (
    stateid,
    stateins,
    operation,
    fromstate,
    tostate,
    userstate,
    enableind,
    frontendop
  )
  VALUES
  (
    (SELECT MAX(stateid)+1 FROM tr_state_matrix
    )
    ,
    'AUTO_UPLOAD',
    'CLOSE_REJECTED_UPDATE_FILEUPLOAD',
    'REJECTED',
    'ACTIVE',
    'ACTIVE',
    '1',
    '1'
  );
  

  
  
INSERT
INTO CMS_STATEMATRIX_ACTION
  (
    STATE_ID,
    TEAM_MEMBERSHIP_TYPE_ID,
    USER_ACTION,
    URL,
    TOTRACK_URL
  )
  VALUES
  (
    (SELECT STATEID
      FROM TR_STATE_MATRIX
      WHERE STATEINS='AUTO_UPLOAD'
      AND OPERATION ='APPROVE_FILEUPLOAD_NEW'
      AND FROMSTATE ='PENDING_CREATE'
      AND TOSTATE   ='ACTIVE'
    )
    ,
    1007,
    'Process',
    'AutoupdationLmtsupload.do?event=checker_process_create_autoupdationlmts&TrxId=',
    NULL
  );
  
  
  
  
INSERT
INTO CMS_STATEMATRIX_ACTION
  (
    STATE_ID,
    TEAM_MEMBERSHIP_TYPE_ID,
    USER_ACTION,
    URL,
    TOTRACK_URL
  )
  VALUES
  (
    (SELECT STATEID
      FROM TR_STATE_MATRIX
      WHERE STATEINS='AUTO_UPLOAD'
      AND OPERATION ='CLOSE_REJECTED_UPDATE_FILEUPLOAD'
      AND FROMSTATE ='REJECTED'
      AND TOSTATE   ='ACTIVE'
    )
    ,
    1006,
    'Close',
    'AutoupdationLmtsupload.do?event=maker_prepare_autoupdationlmts_close&TrxId=',
    'AutoupdationLmtsupload.do.do?event=to_track='
  );
  
  
INSERT
INTO transaction_type_name
  (
    TRANSACTION_TYPE,
    NAME,
    TRANSACTION_SUBTYPE,
    ACCESS_NAME
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'Autoupdation of Limits',
    NULL,
    '2'
  );
  
  
INSERT
INTO transaction_type_name
  (
    TRANSACTION_TYPE,
    NAME,
    TRANSACTION_SUBTYPE,
    ACCESS_NAME
  )
  VALUES
  (
    'AUTO_UPLOAD',
    'Autoupdation of Limits',
    NULL,
    '3'
  );
---------------------------------------------------------------------------------------