
------------------------------------------------------------
---------     SMS INTERFACE LOG 
------------------------------------------------------------
CREATE SEQUENCE sms_log_seq
  MINVALUE 1
  MAXVALUE 99999999999999999
  INCREMENT BY 1
  NOCYCLE
  NOORDER
  NOCACHE
/

CREATE TABLE sms_interface_log (
  upload_id                  VARCHAR2(30)  NULL,
  upload_file_name           VARCHAR2(100) NULL,
  upload_date                TIMESTAMP(9)  NULL,
  file_status                VARCHAR2(25)  NULL,
  successfull_record_count   VARCHAR2(25)  NULL,
  unsuccessfull_record_count VARCHAR2(25)  NULL,
  error_code                 VARCHAR2(25)  NULL,
  error_desc                 VARCHAR2(25)  NULL,
  version_time               NUMBER(19,0)  NULL,
  id                         NUMBER(19,0)  NULL
);
  


CREATE TABLE sms_interface_errorlog (
  upload_id        VARCHAR2(30)  NULL,
  upload_file_name VARCHAR2(100) NULL,
  upload_date      TIMESTAMP(9)  NULL,
  record_count     VARCHAR2(25)  NULL,
  user_id          VARCHAR2(25)  NULL,
  error_code       VARCHAR2(25)  NULL,
  error_desc       VARCHAR2(25)  NULL,
  version_time     NUMBER(19,0)  NULL,
  id               NUMBER(19,0)  NULL
);
---------------------------------------------------
-----
---------------------------------------------------
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (515817596, 'GenerateLAD', 'menu', 10);
   
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (515817596, 'GenerateLAD', 'display', 10);

Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (515817596, 'GenerateLAD', 'prepare_generate', 10);   
   
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (515817596, 'GenerateLAD', 'generate_lad', 10);
   
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (5151817596, 'GenerateLAD', 'update_lad', 10);   

Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (5152817596, 'GenerateLAD', 'view_lad', 10);      
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521817596, 'GenerateLAD', 'prepare_update_lad', 10);   

Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (532817596, 'GenerateLAD', 'prepare_view_lad', 10);
   
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (5151617596, 'GenerateLAD', 'update_document_lad', 10);   

Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'GenerateLAD', 'prepare_update_document_lad', 10);    
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'GenerateLAD', 'prepare_view_lad', 10);     
   
   
   
   
CREATE TABLE cms_lad(
  id          		NUMBER(19,0) NULL,
  lad_id     		NUMBER(19,0) NULL,
  lad_name 			VARCHAR2(50) NULL,
  lad_due_date      TIMESTAMP(9)  NULL,
  generation_date   TIMESTAMP(9)  NULL,
  receive_date      TIMESTAMP(9)  NULL,
  document_date     TIMESTAMP(9)  NULL,
  expiry_date      	TIMESTAMP(9)  NULL,
  lad_counter     	NUMBER(10,0) NULL,
  status 			VARCHAR2(25)  NULL,
  version_time     	NUMBER(19,0) NULL
)
CREATE TABLE cms_lad_item (
  id                           NUMBER(19,0) NULL,
  doc_item_id                  NUMBER(19,0)   NULL,
  lad_id                       NUMBER(19,0)   NULL,
  doc_description              VARCHAR2(500)  NULL,
  status                       VARCHAR2(30)   NULL,
  doc_date                     TIMESTAMP(9)   NULL,
  expiry_date                  TIMESTAMP(9)   NULL,
  version_time     			   NUMBER(19,0) NULL,
  category     				   VARCHAR2(30) NULL
  )
CREATE SEQUENCE lad_seq
  MINVALUE 1
  MAXVALUE 999999999
  INCREMENT BY 1
  CYCLE
  NOORDER
  CACHE 20
/
CREATE SEQUENCE lad_item_seq
  MINVALUE 1
  MAXVALUE 999999999
  INCREMENT BY 1
  CYCLE
  NOORDER
  CACHE 20
/

CREATE SEQUENCE lad_sub_item_seq
  MINVALUE 1
  MAXVALUE 999999999
  INCREMENT BY 1
  CYCLE
  NOORDER
  CACHE 20


-----------------------------------------------------------------------
-----------------------------------------------------------------------  

  
-----------------------------------------------------------------------
-------- Discrepancy
-----------------------------------------------------------------------  
  
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'prepare_maker_edit_discrepency_receive', 10);    
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'prepare_maker_edit_discrepency_waive', 10);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'prepare_maker_edit_discrepency_defer', 10);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'maker_edit_discrepency', 10);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'maker_edit_discrepency_close', 10);    
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'maker_edit_discrepency_waive', 10);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'maker_edit_discrepency_defer', 10);   
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (521617596, 'Discrepency', 'prepare_maker_edit_discrepency_close', 10);       
   
   
ALTER TABLE  cms_discrepency ADD (
 DOC_REMARKS          DATE          NULL,
 RECEIVE_DATE         DATE          NULL,
 DEFER_DATE           DATE          NULL,
 WAIVE_DATE           DATE          NULL,
 CREDIT_APPROVER      VARCHAR2(50)  NULL) ;
ALTER TABLE  cms_stage_discrepency ADD (
 DOC_REMARKS          DATE          NULL,
 RECEIVE_DATE         DATE          NULL,
 DEFER_DATE           DATE          NULL,
 WAIVE_DATE           DATE          NULL,
 CREDIT_APPROVER      VARCHAR2(50)  NULL) ;
 
   
 ALTER TABLE cms_disc_facility_list
  DROP   CONSTRAINT sys_c0058809  
  
  
 ALTER TABLE stage_checklist_item ADD ( is_mandatory_display      CHAR(1)       NULL);
 ALTER TABLE cms_checklist_item ADD ( is_mandatory_display      CHAR(1)       NULL);
 
  ALTER TABLE cms_checklist_item ADD (  tenure_count              NUMBER(19,0)  NULL,
  tenure_type               VARCHAR2(20)  NULL) ;

  ALTER TABLE stage_checklist_item ADD (  tenure_count              NUMBER(19,0)  NULL,
  tenure_type               VARCHAR2(20)  NULL);


  Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516817596, 'SecurityReceipt', 'view_image_page', 10);
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516817596, 'FacilityReceipt', 'view_image_page', 10);
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516817596, 'CAMReceipt', 'view_image_page', 10);
   
    Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516417596, 'ImageTagMap', 'retrieveImage', 10);
   
   
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (511617596, 'SecurityReceipt', 'retrieveImage', 10);
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (519217596, 'FacilityReceipt', 'retrieveImage', 10);
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516813296, 'CAMReceipt', 'retrieveImage', 10);
 
   
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516813296, 'DocFacilityMaster', 'add_facility_master_resubmit', 6);
   
    
   Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (516813296, 'DocFacilityMaster', 'add_template_item_resubmit', 6);
   
   CREATE TABLE cms_lad_sub_item (
  id              NUMBER(19,0)  NULL,
  doc_sub_item_id NUMBER(19,0)  NULL,
  doc_item_id     NUMBER(19,0)  NULL,
  doc_description VARCHAR2(500) NULL,
  status          VARCHAR2(30)  NULL,
  doc_date        TIMESTAMP(9)  NULL,
  expiry_date     TIMESTAMP(9)  NULL,
  version_time    NUMBER(19,0)  NULL,
  category        VARCHAR2(30)  NULL
);

   
ALTER TABLE cms_checklist_item ADD (  defered_days               VARCHAR2(20)  NULL) ;
  
ALTER TABLE stage_checklist_item ADD ( defered_days               VARCHAR2(20)  NULL);

ALTER TABLE cms_checklist_item ADD (  DEFER_COUNTER               VARCHAR2(10)  NULL) ;
  
ALTER TABLE stage_checklist_item ADD ( DEFER_COUNTER               VARCHAR2(10)  NULL);

Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (598813296,'Discrepency','list_discrepency',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (595813296,'Discrepency','view_discrepency',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (595413296,'Discrepency','view_discrepency',10);

---24-oct-2011--------Added by Rajib Aich-----------
  
ALTER table  CMS_ASSET_AIRCRAFT   add(RAMID                     VARCHAR2(50 CHAR),START_DATE                DATE,MATURITY_DATE             DATE);
ALTER table  CMS_STAGE_ASSET_AIRCRAFT   add(RAMID                     VARCHAR2(50 CHAR),START_DATE                DATE,MATURITY_DATE             DATE);
INSERT into CMS_FUNCTION_ACCESS(ID, ACTION,EVENT,ROLE_TYPE ) values(5600029,'AssetCheque','refresh_branch_id',10);

---25-oct-2011--------Added by Bharat Waghela -----------

 INSERT INTO cms_function_access values ('2408201099233','ManualInputCustomer','to_track_view_director','11') ;

 ALTER TABLE stage_sci_le_sub_profile
       MODIFY (funded_share_limit number(32,2) ,
               non_funded_share_limit number(32,2) ,
                total_sanctioned_limit number(32,2),
                funded_share_percent number(22,2) ,
                non_funded_share_percent number(22,2)  ) ;

        ALTER TABLE stage_sci_le_main_profile
       MODIFY (funded_share_limit number(32,2) ,
               non_funded_share_limit number(32,2) ,
                total_sanctioned_limit number(32,2),
                funded_share_percent number(22,2) ,
                non_funded_share_percent number(22,2)   ) ;

ALTER TABLE sci_le_sub_profile
       MODIFY (funded_share_limit number(32,2) ,
               non_funded_share_limit number(32,2) ,
                total_sanctioned_limit number(32,2),
                funded_share_percent number(22,2) ,
                non_funded_share_percent number(22,2)  ) ;

ALTER TABLE sci_le_main_profile
       MODIFY (funded_share_limit number(32,2) ,
               non_funded_share_limit number(32,2) ,
                total_sanctioned_limit number(32,2) , 
                funded_share_percent number(22,2) ,
                non_funded_share_percent number(22,2) ) ;

---01-nov-2011--------Added by Rajib Aich -----------

ALTER TABLE    CMS_ASSET_PDC MODIFY  CHEQUE_AMOUNT     NUMBER(22,2) ;



ALTER TABLE    CMS_STAGE_ASSET_PDC MODIFY  CHEQUE_AMOUNT     NUMBER(22,2) ;
---03-nov-2011--------Added by Rajib Aich -----------

ALTER TABLE    CMS_GUARANTEE

MODIFY (

  GUARANTERS_NAME    VARCHAR2(100 CHAR),
  GUARANTERS_FULL_NAME  VARCHAR2(100 CHAR)
  
  ) ;

ALTER TABLE    CMS_STAGE_GUARANTEE

MODIFY (

  GUARANTERS_NAME    VARCHAR2(100 CHAR),
  GUARANTERS_FULL_NAME  VARCHAR2(100 CHAR)
  
  ) ;

  ---04-nov-2011--------Added by Bharat waghela -----------
   ALTER TABLE sci_le_cri
      MODIFY INDUSTRY_EXPOSER NUMBER(7,2);

        ALTER TABLE sci_le_cri_staging
      MODIFY INDUSTRY_EXPOSER NUMBER(7,2);
      
 ---07-nov-2011--------Added by Bharat waghela -----------      

  INSERT INTO cms_function_access VALUES ('2408201099239','ManualInputCustomer','calculate_financial_detail','10');
     INSERT INTO cms_function_access VALUES ('2408201099240','ManualInputCustomer','calculate_financial_detail_in_edit','10');
     INSERT INTO cms_function_access VALUES ('2408201099241','ManualInputCustomer','calculate_financial_detail_in_resubmit','10');
	 
	 
	  ---10-nov-2011--------Added by Pradeep -----------   

Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099195,'udf','prepare_add_udf',6);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099198,'udf','delete_udf',6);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099233,'udf','freeze_udf',6);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099194,'udf','add_udf',6);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099193,'udf','list_udf',6);


Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099200,'ManualInputCustomer','display_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099202,'ManualInputCustomer','process_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099205,'ManualInputCustomer','close_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099206,'ManualInputCustomer','create_checker_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099207,'ManualInputCustomer','create_checker_udf_details',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099208,'ManualInputCustomer','to_track_udf_details',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099214,'ManualInputCustomer','to_track_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099215,'ManualInputCustomer','view_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099216,'ManualInputCustomer','view_udf_details',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099217,'ManualInputCustomer','edit_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099218,'ManualInputCustomer','edit_udf_details',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099219,'ManualInputCustomer','checker_update_udf_details',10);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099220,'ManualInputCustomer','checker_update_udf_details',11);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099228,'ManualInputCustomer','view_udf_details_checker',11);	  
 
 ---10-nov-2011--------Added by Govind Sahu -----------  
CREATE OR REPLACE FUNCTION find_secPriority_priOrSec(sec_priority varchar2) RETURN VARCHAR AS
sec_pri_name varchar(10);
BEGIN
 
   IF sec_priority = 'Y' THEN
        sec_pri_name := 'Primary';
   ELSIF sec_priority = 'N' THEN
       sec_pri_name := 'Secondary';
   ELSE
       sec_pri_name := null;
   END IF;
  RETURN sec_pri_name;
END;


 ---21-nov-2011--------Added by Bharat waghela -----------  
insert into cms_function_access values ('2408201099289','ManualInputCustomer','delete_banking_method','10')
insert into cms_function_access values ('2408201099290','ManualInputCustomer','delete_banking_method_in_edit','10');
insert into cms_function_access values ('2408201099291','ManualInputCustomer','delete_banking_method_in_resubmit','10');


alter table sci_le_cri
modify CUSTOMER_EXT_RATING varchar2(100);

alter table SCI_LE_CRI_STAGING
modify CUSTOMER_EXT_RATING varchar2(100);

-----------------------------------------------------------

 ---24-nov-2011-------- Added by Dattatray Thorat -----------
ALTER TABLE CMS_STAGE_PROPERTY  
MODIFY (PROPERTY_ADDRESS VARCHAR2(100 CHAR) );

ALTER TABLE CMS_PROPERTY  
MODIFY (PROPERTY_ADDRESS VARCHAR2(100 CHAR) );

ALTER TABLE CMS_STAGE_PROPERTY  
MODIFY (PROPERTY_ADDRESS_2 VARCHAR2(100 CHAR) );

ALTER TABLE CMS_PROPERTY  
MODIFY (PROPERTY_ADDRESS_2 VARCHAR2(100 CHAR) );

ALTER TABLE CMS_STAGE_PROPERTY  
MODIFY (PROPERTY_ADDRESS_3 VARCHAR2(100 CHAR) );

ALTER TABLE CMS_PROPERTY  
MODIFY (PROPERTY_ADDRESS_3 VARCHAR2(100 CHAR) );

ALTER TABLE CMS_PROPERTY  
MODIFY (DEVELOPER_GROUP_COMPANY VARCHAR2(100 CHAR) );

ALTER TABLE CMS_STAGE_PROPERTY  
MODIFY (DEVELOPER_GROUP_COMPANY VARCHAR2(100 CHAR) );

ALTER TABLE CMS_PROPERTY  
MODIFY (DEVELOPER_NAME VARCHAR2(150 CHAR) );

ALTER TABLE CMS_STAGE_PROPERTY  
MODIFY (DEVELOPER_NAME VARCHAR2(150 CHAR) );
----------------------------------------------------------
-----------------------------------------------------------

---24-nov-2011--------Added by S N Gupta -----------
Insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) values ('LIMIT','MILimit.do?event=track&trxID=','DELETED','Deleted','Manual Input Limit','PENDING_DELETE','MANUAL');
Insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) values ('LIMIT','MILimit.do?event=track&trxID=','ACTIVE','Delete Closed','Manual Input Limit','REJECTED_DELETE','MANUAL');

ALTER TABLE SCI_LSP_APPR_LMTS  
MODIFY (IS_DP DEFAULT 'N' );

ALTER TABLE SCI_LSP_APPR_LMTS  
MODIFY (TOTAL_RELEASED_AMOUNT DEFAULT 0 );

ALTER TABLE STAGE_LIMIT  
MODIFY (IS_DP DEFAULT 'N' );

ALTER TABLE STAGE_LIMIT  
MODIFY (TOTAL_RELEASED_AMOUNT DEFAULT 0 );

ALTER TABLE STAGE_LIMIT  
MODIFY (LMT_CRRNCY_ISO_CODE CHAR(30 CHAR) );

ALTER TABLE SCI_LSP_APPR_LMTS
MODIFY (LMT_CRRNCY_ISO_CODE CHAR(30 CHAR) );

ALTER TABLE CMS_SECURITY  
MODIFY (FSV_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_SECURITY  
MODIFY (CMV_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_SECURITY  
MODIFY (SCI_SECURITY_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_SECURITY  
MODIFY (FSV_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_SECURITY  
MODIFY (CMV_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_SECURITY  
MODIFY (SCI_ORIG_SECURITY_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_SECURITY  
MODIFY (SCI_SECURITY_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_SECURITY  
MODIFY (SCI_ORIG_SECURITY_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_LIMIT_SECURITY_MAP  
MODIFY (LMT_CRRNCY_ISO_CODE CHAR(30 CHAR) );

ALTER TABLE CMS_LIMIT_SECURITY_MAP  
MODIFY (DRAW_AMOUNT_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_LIMIT_SECURITY_MAP  
MODIFY (PLEDGE_AMOUNT_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_LIMIT_SECURITY_MAP  
MODIFY (LMT_CRRNCY_ISO_CODE CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_LIMIT_SECURITY_MAP  
MODIFY (DRAW_AMOUNT_CURRENCY CHAR(30 CHAR) );

ALTER TABLE CMS_STAGE_LIMIT_SECURITY_MAP  
MODIFY (PLEDGE_AMOUNT_CURRENCY CHAR(30 CHAR) );

----------------------------------------------------
---25-nov-2011--------Added by Govind Sahu ----------- 
CREATE OR REPLACE FUNCTION calculate_dp(gc_det_id_in NUMBER,FUNDED_AMT_PERCENTAGE NUMBER) RETURN VARCHAR2 AS
DP_AMOUNT varchar2(25);
SUM_CURR_LIABI NUMBER;
SUM_CURR_ASSET NUMBER;
BEGIN
  select sum(lonable) into SUM_CURR_LIABI from cms_asset_gc_stock_det where gc_det_id=gc_det_id_in and stock_type='CurrentLiabilities';
  select sum(lonable) into SUM_CURR_ASSET from cms_asset_gc_stock_det where gc_det_id=gc_det_id_in and stock_type='CurrentAsset';
  DP_AMOUNT:=((SUM_CURR_ASSET-SUM_CURR_LIABI)*FUNDED_AMT_PERCENTAGE)/100;
  RETURN DP_AMOUNT;
END CALCULATE_DP; 

-----
CREATE OR REPLACE FUNCTION calculate_rec_date(
      CUST_ID NUMBER,
      docCode VARCHAR2)
    RETURN DATE
  AS
    REC_DATE DATE;
  BEGIN
    SELECT chkitem.received_date
    INTO REC_DATE
    FROM CMS_CHECKLIST_ITEM chkItem,
      CMS_DOCUMENT_GLOBALLIST recMaster
    WHERE chkitem.checklist_id IN
      (SELECT chk.checklist_id
      FROM CMS_CHECKLIST chk
      WHERE chk.cms_lsp_lmt_profile_id =
        (SELECT pf.cms_lsp_lmt_profile_id
        FROM sci_lsp_lmt_profile pf,
          sci_le_sub_profile sp
        WHERE sp.cms_le_sub_profile_id = pf.cms_customer_id
        AND pf.cms_customer_id         = CUST_ID
        )
      AND chk.category='REC'
      )
    AND chkitem.document_code   =recmaster.document_code
    AND recmaster.category      ='REC'
    AND recmaster.statement_type='STOCK_STATEMENT'
    AND chkitem.status          = 'RECEIVED'
    AND chkitem.document_code   = docCode;
    RETURN REC_DATE;
  END CALCULATE_REC_DATE;
----------------------------------------------------------------------------------



---25-nov-2011--------Added by S N Gupta -----------
ALTER TABLE CMS_PROPERTY  
MODIFY (PROPERTY_ADDRESS NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (STD_QUIT_RENT NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (NON_STD_QUIT_RENT NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (QUIT_RENT_RECEIPT NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (MARGAGE_TYPE NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (MORGAGE_CREATED_BY NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (DOCUMENT_BLOCK NULL);

ALTER TABLE CMS_PROPERTY  
MODIFY (PINCODE NULL);

---29-nov-2011--------Added by Govind S -----------
ALTER table CMS_ASSET_GOLD
MODIFY  GOLD_UNIT_PRICE_CURRENCY CHAR(30);
------------------------------------------------------

---30-nov-2011---------
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099290,'systemHandOff','performEoy',1011);
Insert into CMS_FUNCTION_ACCESS (ID,ACTION,EVENT,ROLE_TYPE) values (2408201099289,'systemHandOff','performEod',1011);
-------------------------


--05-Dec-2011--------Added for SESSION_TIMEOUT
INSERT INTO CMS_GENERAL_PARAM (PARAM_ID,PARAM_CODE,PARAM_NAME,PARAM_VALUE,UI_VIEW,LAST_UPDATE_DATE,FEED_REF,FEED_GROUP_ID) values (11,'SESSION_TIMEOUT','Max Inactive Interval (In Minutes)','30','Y',to_date('05-DEC-11','DD-MON-RR'),11,532);
INSERT INTO CMS_STAGE_GENERAL_PARAM (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, UI_VIEW, LAST_UPDATE_DATE, FEED_REF, FEED_GROUP_ID) VALUES ('11', 'SESSION_TIMEOUT', 'Max Inactive Interval (In Minutes)', '25', 'Y', TO_DATE('18-NOV-11', 'DD-MON-RR'), '11', (SELECT STAGING_REFERENCE_ID FROM TRANSACTION  where TRANSACTION_TYPE = 'GENERAL_PARAM_GROUP'));
commit;

--06-Dec-2011--------To idetify the request from server for ContentMeanger scheduler to resolve NLB issue
ALTER TABLE CMS_TEMP_IMAGE_UPLOAD ADD (FROM_SERVER VARCHAR2(10) );
ALTER TABLE CMS_TEMP_IMAGE_UPLOAD MODIFY (IMG_FILENAME VARCHAR2(100 CHAR) );

--09-Dec-2011-------
ALTER TABLE CMS_LOGIN_AUDIT 
ADD (SERVER VARCHAR2(50));

----131211---------By Shiv--- Report 18
ALTER TABLE SCI_LE_MAIN_PROFILE ADD(
	Funded_INCRE_DECRE NUMBER(32, 2),
	NonFunded_INCRE_DECRE NUMBER(32, 2),
	MemoExpos_INCRE_DECRE NUMBER(32, 2)
);
ALTER TABLE STAGE_SCI_LE_MAIN_PROFILE add(
	Funded_INCRE_DECRE NUMBER(32, 2),
	NonFunded_INCRE_DECRE NUMBER(32, 2),
	MemoExpos_INCRE_DECRE NUMBER(32, 2)
);

ALTER TABLE SCI_LE_SUB_PROFILE ADD(
	Funded_INCRE_DECRE NUMBER(32, 2),
	NonFunded_INCRE_DECRE NUMBER(32, 2),
	MemoExpos_INCRE_DECRE NUMBER(32, 2)
);
ALTER TABLE STAGE_SCI_LE_SUB_PROFILE add(
	Funded_INCRE_DECRE NUMBER(32, 2),
	NonFunded_INCRE_DECRE NUMBER(32, 2),
	MemoExpos_INCRE_DECRE NUMBER(32, 2)
);
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('16062011062','MILimit','refresh_facility_liability','10');

alter table CMS_LOGIN_AUDIT add(HOST_NAME VARCHAR2(250));  --221212
alter table CMS_AUTHENTICATION add(HOST_NAME VARCHAR2(250));  --231212
------------------------------
-----create function GET_OLD_USER_ID_DETAIL to get old user id from staging table for user admin report based on user login id and rownum: Govind S:20/12/2011
create or replace
FUNCTION GET_OLD_USER_ID_DETAIL(in_usr_login_id varchar2,IN_ROWNUM number) RETURN VARCHAR AS
OUT_USER_ID NUMBER(19,0);
BEGIN
 SELECT  USER_ID into OUT_USER_ID FROM  (select stg_usr.branch_code, STG_USR.USER_ID,ROWNUM RM 
                                          from stage_user stg_usr 
                                          where stg_usr.LOGIN_ID = in_usr_login_id and 
                                        STG_USR.LOGIN_ID in (
                                        
                                       select LOGIN_ID from stage_user where LOGIN_ID = in_usr_login_id
                                        
                                        )  ORDER BY USER_ID DESC )  WHERE RM =IN_ROWNUM;
  RETURN OUT_USER_ID;
END;
-----------------------------------------------------------------------
----040112---------By Shiv---
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('16062011063','MILmtSecDetail','search_secpropdetail','10');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('16062011064','PropCommGeneralCollateral','autocomplete','10');

ALTER TABLE SCI_LE_CRI  
MODIFY (CUSTOMER_EXT_RATING VARCHAR2(100 BYTE) );

ALTER TABLE SCI_LE_CRI_STAGING  
MODIFY (CUSTOMER_EXT_RATING VARCHAR2(100 BYTE) );
------------------------------------------------