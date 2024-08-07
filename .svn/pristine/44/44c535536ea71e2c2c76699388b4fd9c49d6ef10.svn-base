-----STEPS:----------------------------

--BEFORE EOY: 

--Run below query on last working day to identify the unauthorized recurrent records.
--And ask user to clear it from checker end otherwise those records will not process in EOY.

SELECT TR.*
FROM TRANSACTION TR,CMS_CHECKLIST CHK
WHERE TR.TRANSACTION_TYPE='CHECKLIST'
AND TR.STATUS            ='PENDING_UPDATE'
AND TR.REFERENCE_ID     =CHK.CHECKLIST_ID
AND CHK.CATEGORY ='REC';


--EOY steps:

--A.
----- RUN BELOW QUERY IF TABLE NOT EXISTS------

CREATE TABLE CMS_DOC_CHKLST_TEST_22(

DOCUMENT_CODE      VARCHAR2(100) ,
CHECKLIST_ID       NUMBER(19)    ,
ACTIVITYDATE       DATE          ,
SYSTEMDATE       DATE ,
REASON             VARCHAR2(200) 
);


--B. 
--NOTE: Below table is created for Impacted cases. So if the table already exists then need to drop the table and create again.

----- RUN BELOW QUERY IF TABLE ALREADY EXISTS------
DROP TABLE CMS_EOY_IMPACTED_RECORDS_22;
--------------------------------------------

CREATE TABLE CMS_EOY_IMPACTED_RECORDS_22 AS 
(
select * from CMS_CHECKLIST_ITEM where is_deleted='N'
     and expiry_date > to_timestamp( (SELECT TRUNC ((select to_date (activity_performed,'dd/mm/yyyy hh24:mi') 
  from cms_general_param where param_code = 'USER_HAND_OFF') ,'YEAR')-1 FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM')  
     and expiry_date < to_timestamp((SELECT ADD_MONTHS(TRUNC ((select to_date (activity_performed,'dd/mm/yyyy hh24:mi') 
  from cms_general_param where param_code = 'USER_HAND_OFF') ,'YEAR'),12) FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM')     
     and checklist_id  in 
    (select checklist_id from cms_checklist where category ='REC' )
	AND checklist_id NOT IN(SELECT REFERENCE_ID
FROM TRANSACTION
WHERE TRANSACTION_TYPE='CHECKLIST'
AND STATUS            ='PENDING_UPDATE')
);

--C.
----- RUN BELOW QUERY IF TABLE NOT EXISTS------
DROP TABLE checklist_eoy_IMPACTED_CHKIDS_UAT;
--------------------------------------------

CREATE TABLE checklist_eoy_IMPACTED_CHKIDS_UAT(
checklist_id varchar2(100),
stg_checklist_id varchar2(100),
SYSTEMDATE date,
DOC_DESCRIPTION varchar2(1000),
STATEMENT_TYPE varchar2(1000),
DOCUMENT_CODE varchar2(1000)

);
------------------------------------------------------------

--D.Complile Procedure "PROC_STATEMENT_REC_EOY_D".


--a.Exceute steps 1,3 before EOY activity and after user hand-off process.

--1.take count of cms_holiday and CMS_DOCUMENT_GLOBALLIST and note it down for verifying same after EOY is completed.

select count(1) from cms_holiday; 
select count(1) from CMS_DOCUMENT_GLOBALLIST; 

--2.Run below queries to take backup.

create table cms_holiday_22Y as select * from cms_holiday;   
create table CMS_DOCUMENT_GLOBALLIST_22Y  as select * from CMS_DOCUMENT_GLOBALLIST; 
create table STAGE_DOCUMENT_GLOBALLIST_22Y as select * from STAGE_DOCUMENT_GLOBALLIST; 
create table TRANSACTION_22Y as select * from TRANSACTION; 
create table CMS_CHECKLIST_ITEM_22Y as select * from CMS_CHECKLIST_ITEM; 
create table STAGE_CHECKLIST_ITEM_22Y as select * from STAGE_CHECKLIST_ITEM;

--3.Run below query to take backup of unauthorized recurrent records.

CREATE TABLE REC_TRX_PENDING_22Y AS
SELECT TR.*
FROM TRANSACTION TR,CMS_CHECKLIST CHK
WHERE TR.TRANSACTION_TYPE='CHECKLIST'
AND TR.STATUS            ='PENDING_UPDATE'
AND TR.REFERENCE_ID     =CHK.CHECKLIST_ID
AND CHK.CATEGORY ='REC';


--b.To confirm whether EOY activity is completed successfully or not execute the below step 3.1 and step 3.2

--3.1 Check whether application date is proper in cms_general_param. 
select param_value from cms_general_param where param_code='APPLICATION_DATE'; 

--3.2 Take count of cms_holiday and CMS_DOCUMENT_GLOBALLIST and compare it with count taken at step 1. If there are addition in count as compared to previous then it is ok.
select count(1) from cms_holiday; 
select count(1) from CMS_DOCUMENT_GLOBALLIST; 


--4.If EOY get's failed then perform date change. Refer 'DateAndFlagChange.txt' for the same. collect the logs.





------------------------------------------------------------------------------------------------------

----EOY PROCEDURE----------------------

create or replace
PROCEDURE PROC_STATEMENT_REC_EOY_D
AS
 
  CURSOR CR_PROC_STATEMENT_REC_EOY_D
  IS
  
    select * from CMS_CHECKLIST_ITEM where is_deleted='N'
     and expiry_date > to_timestamp( (SELECT TRUNC ((select to_date (activity_performed,'dd/mm/yyyy hh24:mi') 
  from cms_general_param where param_code = 'USER_HAND_OFF') ,'YEAR')-1 FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM')  
     and expiry_date < to_timestamp((SELECT ADD_MONTHS(TRUNC ((select to_date (activity_performed,'dd/mm/yyyy hh24:mi') 
  from cms_general_param where param_code = 'USER_HAND_OFF') ,'YEAR'),12) FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM')     
     and checklist_id  in 
    (select checklist_id from cms_checklist where category ='REC' )
	AND checklist_id NOT IN(SELECT REFERENCE_ID
FROM TRANSACTION
WHERE TRANSACTION_TYPE='CHECKLIST'
AND STATUS            ='PENDING_UPDATE')
	; 

  RC_PROC_STATEMENT_REC_EOY_D CR_PROC_STATEMENT_REC_EOY_D%ROWTYPE;
   
  v_received_date DATE;
  v_expiry_date DATE;
  v_checklist_id               VARCHAR2 (50);
  v_document_code        VARCHAR2 (50);
  v_document_code_count         NUMBER (19);
  v_checklist_item_id       NUMBER (19);
  v_stg_checklist_item_id       NUMBER (19);
  v_stg_checklist_id         NUMBER (19);
  v_doc_item_ref_id       NUMBER (19);
  v_stg_checklist_item_ref_id NUMBER (19);
  v_checklist_item_ref_id NUMBER (19);
  doc_in_checklist_count NUMBER (19);
  v_document_id  NUMBER (19);
  v_tenure_count NUMBER (19);
  v_tenure_type  VARCHAR2 (50);
  staging_reference_id_count NUMBER (19);
  
  D_sysdate DATE   ;
       

BEGIN

select to_date (activity_performed,'dd/mm/yyyy hh24:mi') into D_sysdate
  from cms_general_param where param_code = 'USER_HAND_OFF';
  
  OPEN CR_PROC_STATEMENT_REC_EOY_D;
  LOOP
    
    FETCH CR_PROC_STATEMENT_REC_EOY_D INTO RC_PROC_STATEMENT_REC_EOY_D;
     
    EXIT
  WHEN CR_PROC_STATEMENT_REC_EOY_D%NOTFOUND;
     v_document_code:= null  ;v_expiry_date:= null  ; v_document_id:= null  ;v_tenure_count:= null  ;v_tenure_type:= null  ;
     v_stg_checklist_id:=null;

     begin 
      
      with det as (
      SELECT   gdl.document_code , gdl.expiry_date ,gdl.document_id , gdl.tenure_count, gdl.tenure_type   
      , row_number() over (order by document_id asc) recno FROM CMS_DOCUMENT_GLOBALLIST gdl
       WHERE      gdl.category ='REC'   
       and gdl.status='ENABLE'
        and gdl.OLD_DOCUMENT_CODE= RC_PROC_STATEMENT_REC_EOY_D.DOCUMENT_CODE
        )
      select document_code,expiry_date,document_id,tenure_count,tenure_type 
      INTO v_document_code   ,v_expiry_date, v_document_id,v_tenure_count,v_tenure_type  from det where recno=1;
     exception
     when others then

        INSERT INTO CMS_DOC_CHKLST_TEST_22 VALUES(RC_PROC_STATEMENT_REC_EOY_D.DOCUMENT_CODE,RC_PROC_STATEMENT_REC_EOY_D.checklist_id,D_sysdate,sysdate,'Document Not Found');
        continue;
     end;
     
      SELECT COUNT(1)    INTO doc_in_checklist_count    FROM cms_checklist_item chkitem
    WHERE     chkitem.DOCUMENT_CODE =v_document_code  --New GLB doc code from part 1
    and chkitem.checklist_id=RC_PROC_STATEMENT_REC_EOY_D.checklist_id; 


      if doc_in_checklist_count=0
    then
    SELECT COUNT(1)    INTO  staging_reference_id_count            FROM transaction 
    WHERE transaction_type='CHECKLIST' 
    and reference_id= RC_PROC_STATEMENT_REC_EOY_D.checklist_id;
    
    IF staging_reference_id_count =1 THEN   
     SELECT staging_reference_id      INTO v_stg_checklist_id       FROM transaction 
    WHERE transaction_type='CHECKLIST' 
    and reference_id= RC_PROC_STATEMENT_REC_EOY_D.checklist_id;
  
    END if;
    select TO_CHAR (SYSDATE, 'YYYYMMDD') || LPAD(EOY13_CHECKLIST_ITEM_SEQ.NEXTVAL,9,'0')  into v_checklist_item_id from dual;
    select TO_CHAR (SYSDATE, 'YYYYMMDD') || LPAD(EOY13_CHECKLIST_ITEM_STAGE_SEQ.NEXTVAL,9,'0') into v_stg_checklist_item_id from dual;
    
    select TO_CHAR (SYSDATE, 'YYYYMMDD') || LPAD(EOY13_CHECKLIST_ITEM_REF_SEQ.NEXTVAL,9,'0') into v_checklist_item_ref_id from dual;
    select TO_CHAR (SYSDATE, 'YYYYMMDD') || LPAD(EOY13_CHKLIST_ITEM_REF_STG_SEQ.NEXTVAL,9,'0') into v_stg_checklist_item_ref_id from dual;    
    
            Insert into CMS_CHECKLIST_ITEM (
                    DOC_ITEM_ID,DOC_DESCRIPTION,IS_PRE_APPROVE,IS_INHERITED,
                    IN_VAULT,IN_EXT_CUSTODY,IS_MANDATORY,ACTION_PARTY,
                    STATUS,DOC_DATE,EXPIRY_DATE,IS_AUDIT,
                    REMARKS,IS_DELETED,CHECKLIST_ID,DOCUMENT_ID,
                    DOCUMENT_CODE,DOC_ITEM_REF,FORM_NO,DOC_REFERENCE,
                    DEFER_EXPIRY_DATE,MONITOR_TYPE,IS_LOCKED,IDENTIFY_DATE,
                    DOC_COMPLETION_DATE,LAST_UPDATE_DATE,CPC_CUST_STATUS,PARENT_CHECKLIST_ITEM_REF,
                    DEFER_EXTENDED_DATE,CPC_CUST_STATUS_UPDATE_DATE,EFFECTIVE_DATE,CUST_STATUS_LAST_UPDATE_DATE,
                    SHARE_STATUS,RECEIVED_DATE,COMPLETED_DATE,EXPECTED_RETURN_DATE,
                    WAIVED_DATE,LODGED_DATE,TEMP_UPLIFTED_DATE,PERM_UPLIFTED_DATE,
                    CREDIT_APPROVER,TENURE_COUNT,TENURE_TYPE,IS_MANDATORY_DISPLAY,
                    DEFERED_DAYS,DEFER_COUNTER,CURRENCY,DOC_AMT,
                    HDFC_AMT,STATEMENT_TYPE) values (
                    v_checklist_item_id,RC_PROC_STATEMENT_REC_EOY_D.DOC_DESCRIPTION,'N','N',
                    'N','N','N',null,
                    'AWAITING',null,v_expiry_date,'N',
                    null,'N',RC_PROC_STATEMENT_REC_EOY_D.checklist_id,v_document_id,
                    v_document_code,v_checklist_item_ref_id,null,null,
                    null,null,'N',null,
                    null,null,null,-999999999,
                    null,null,null,null,
                    'N',null,null,null,
                    null,null,null,null,
                    null,v_tenure_count,v_tenure_type,'N',
                    null,null,null,null,
                    null,RC_PROC_STATEMENT_REC_EOY_D.STATEMENT_TYPE);
                    
                    if staging_reference_id_count=1 then
                      Insert into STAGE_CHECKLIST_ITEM (
                      DOC_ITEM_ID,DOC_DESCRIPTION,IS_PRE_APPROVE,IS_INHERITED,
                      IN_VAULT,IN_EXT_CUSTODY,IS_MANDATORY,ACTION_PARTY,
                      STATUS,DOC_DATE,EXPIRY_DATE,IS_AUDIT,
                      REMARKS,IS_DELETED,CHECKLIST_ID,DOCUMENT_ID,
                      DOCUMENT_CODE,DOC_ITEM_REF,FORM_NO,DOC_REFERENCE,
                      DEFER_EXPIRY_DATE,MONITOR_TYPE,IS_LOCKED,IDENTIFY_DATE,
                      DOC_COMPLETION_DATE,LAST_UPDATE_DATE,CPC_CUST_STATUS,PARENT_CHECKLIST_ITEM_REF,
                      DEFER_EXTENDED_DATE,CPC_CUST_STATUS_UPDATE_DATE,EFFECTIVE_DATE,CUST_STATUS_LAST_UPDATE_DATE,
                      SHARE_STATUS,RECEIVED_DATE,COMPLETED_DATE,EXPECTED_RETURN_DATE,
                      WAIVED_DATE,LODGED_DATE,TEMP_UPLIFTED_DATE,PERM_UPLIFTED_DATE,
                      CREDIT_APPROVER,TENURE_COUNT,TENURE_TYPE,IS_MANDATORY_DISPLAY,
                      DEFERED_DAYS,DEFER_COUNTER,CURRENCY,DOC_AMT,
                      HDFC_AMT,STATEMENT_TYPE) values (
                      v_stg_checklist_item_id,RC_PROC_STATEMENT_REC_EOY_D.DOC_DESCRIPTION,'N','N',
                      'N','N','N',null,
                      'AWAITING',null,v_expiry_date,'N',
                      null,'N',v_stg_checklist_id,v_document_id,
                      v_document_code,v_stg_checklist_item_ref_id,null,null,
                      null,null,'N',null,
                      null,null,null,-999999999,
                      null,null,null,null,
                      'N',null,null,null,
                      null,null,null,null,
                      null,v_tenure_count,v_tenure_type,'N',
                      null,null,null,null,
                      null,RC_PROC_STATEMENT_REC_EOY_D.STATEMENT_TYPE);
                    

                    update transaction set transaction_date= sysdate , system_date= sysdate 
                    where transaction_type='CHECKLIST'
                    and reference_id=RC_PROC_STATEMENT_REC_EOY_D.checklist_id;
              end if;
              insert into checklist_eoy_IMPACTED_CHKIDS_UAT(checklist_id,stg_checklist_id,SYSTEMDATE,DOC_DESCRIPTION,STATEMENT_TYPE,DOCUMENT_CODE) values(RC_PROC_STATEMENT_REC_EOY_D.checklist_id,v_stg_checklist_id,sysdate,RC_PROC_STATEMENT_REC_EOY_D.DOC_DESCRIPTION,
			  RC_PROC_STATEMENT_REC_EOY_D.STATEMENT_TYPE,v_document_code);
                
             -- COMMIT;
    else
       INSERT INTO CMS_DOC_CHKLST_TEST_22 VALUES(RC_PROC_STATEMENT_REC_EOY_D.DOCUMENT_CODE,RC_PROC_STATEMENT_REC_EOY_D.checklist_id,D_sysdate,sysdate,'Document Already Created');
    End if;
        -- COMMIT;
  END LOOP;
  
  CLOSE CR_PROC_STATEMENT_REC_EOY_D;  
  --------------------diseble previous year documents------------   
    update CMS_DOCUMENT_GLOBALLIST set status = 'DISABLE' where category = 'REC'
    and expiry_date <to_timestamp((SELECT ADD_MONTHS(TRUNC (D_sysdate ,'YEAR'),12) FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM');

    update STAGE_DOCUMENT_GLOBALLIST set status = 'DISABLE' where document_id in
    (select staging_reference_id from transaction where transaction_type = 'DOCITEM' 
    and transaction_subtype = 'RECURRENT_GLOBAL_TEMPLATE' 
    and reference_id in (select document_id from  CMS_DOCUMENT_GLOBALLIST  where category = 'REC' 
    and expiry_date < to_timestamp((SELECT ADD_MONTHS(TRUNC (D_sysdate ,'YEAR'),12) FROM DUAL),'DD-MM-YY HH.MI.SS.FF AM')));
      commit;
  
END PROC_STATEMENT_REC_EOY_D;

 -----------------------------------------------------------------------------------   
    