/*********************************************************************
   Build       : GCMS_R1.0_B001V1
   Type        : Data Patch
   Date        : 25/01/2008
   Patch       : Build 1
   Start Email : Wednesday, January 23, 2008 4:32 PM
                          [Lini Elsy Varghese <lini@integrosys.com>]
                          [DB Patch for Build# B001V1 (GEMS AM roles)]  
   End Email   : Friday, January 25, 2008 12:25 PM
                          [Jitendra Parida <jitendra@integrosys.com>]
                          [Data  Patch for Build# B001V1 (CCI)]  
                                                       
*********************************************************************/

/*********************************************************************
   Build : GEMS_R1.0_B001V1
   Type  : Data Patch
   Date  : 23/01/2008
   Owner : Lini
   Patch : Team Type to add GEMS AM and membership for maker, checker
*********************************************************************/

INSERT INTO CMS_TEAM_TYPE (TEAM_TYPE_ID,BUSINESS_CODE,DESCRIPTION,PARENT_ID,IS_ADD_ALLOWED,VERSION_TIME,STATUS,PEER_ORDER) values (18,'GEMSAM','GEMS AM',0,'Y',0,'A',17);

INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (28,'Y',18,999,0,'A',1,'GEMS AM Maker',0);
INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (29,'Y',18,999,0,'A',2,'GEMS AM Checker',0);



/*********************************************************************
   Build : GCMS_R1.0_B001V1
   Type  : Data Patch
   Date  : 25/01/2008
   Owner : Jitu
   Patch : Data Patch for CCI
*********************************************************************/
-- FAP moved to gems_fap.sql


--**************************************************************************************************    
--********************* Create TR_STATE_MATRIX  for CCI  *********************
--**************************************************************************************************    

INSERT INTO TR_STATE_MATRIX VALUES   (6401, 'CCI', 'MAKER_UPDATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6402, 'CCI', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6403, 'CCI', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6404, 'CCI', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6405, 'CCI', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6406, 'CCI', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6407, 'CCI', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6408, 'CCI', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');

--Required by maker to do if checker rejected
INSERT INTO TR_STATE_MATRIX VALUES   (6409, 'CCI', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6410, 'CCI', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');

--to see in checker approve in todo List for approve   
INSERT INTO TR_STATE_MATRIX VALUES   (6411, 'CCI', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6412, 'CCI', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6413, 'CCI', 'MAKER_SUBMIT', 'ND','PENDING_CREATE','PENDING_CREATE','1','1');
INSERT INTO TR_STATE_MATRIX VALUES   (6414, 'CCI', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6415, 'CCI', 'CHECKER_APPROVE', 'ND', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6416, 'CCI', 'MAKER_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6417, 'CCI', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');


--Checker to Approve  if maker delete
INSERT INTO TR_STATE_MATRIX VALUES   (6418, 'CCI', 'CHECKER_APPROVE', 'PENDING_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');
--Checker to Reject  if maker create
INSERT INTO TR_STATE_MATRIX VALUES   (6419, 'CCI', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED', 'REJECTED', '1', '1');
--Checker to reject if maker update
--INSERT INTO TR_STATE_MATRIX VALUES   (6420, 'CCI', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
--Maker   to close if checker rejected
INSERT INTO TR_STATE_MATRIX VALUES   (6421, 'CCI', 'MAKER_CANCEL',   'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
--Checker to reject if maker delete
INSERT INTO TR_STATE_MATRIX VALUES   (6422, 'CCI', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED', 'REJECTED', '1', '1');


--**************************************************************************************************    
--********************* Create CMS_STATEMATRIX_ACTION  for CCI  *********************
--**************************************************************************************************    

-- checker rejected  and maker to do process
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6403, 28, 'Process', 'CounterpartyCCI.do?event=maker_edit_cci_reject&TrxId=', 'CounterpartyCCI.do?event=view');
--checker rejected  and maker to close
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (6409, 28, 'Close', 'CounterpartyCCI.do?event=maker_close_cci&TrxId=');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6411, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');
-- action if CHECKER_REJECT
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6412, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6414, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6415, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6418, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');
-- action if CHECKER_REJECT
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6419, 29, 'Process', 'CounterpartyCCI.do?event=checker_edit_cci&TrxId=', 'CounterpartyCCI.do?event=view');

--**************************************************************************************************    
--********************* Create CMS_TRX_TOTRACK  for CCI  *********************
--**************************************************************************************************    

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'CCI Maintain', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'ACTIVE', 'Closed', 'CCI Maintain', 'REJECTED_DELETE', null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ('CCI', 'CounterpartyCCI.do?event=to_track&TrxId=', 'ACTIVE', 'Closed', 'CCI Maintain', 'REJECTED', null);

/*********************************************************************
   Build : GEMS_R1.0_B001V2
   Type  : Data Patch
   Date  : 29/01/2008
   Owner : Jitendra
   Patch : CCI added function access
*********************************************************************/
-- FAP moved to gems_fap.sql

INSERT INTO TR_STATE_MATRIX VALUES   (6423, 'CCI', 'MAKER_DELETE', 'ACTIVE','PENDING_DELETE', 'PENDING_DELETE', '1', '1');


/*********************************************************************
   Build : GCMS_R1.0_B001V2
   Type  : Data Patch
   Date  : 30/01/2008
   Owner : Jitendra
   Patch : Common Code Patch for CCI - CCI_LE_ID_TYPE
*********************************************************************/
insert into common_code_category (category_id, category_code, category_name,category_type, active_status) values (next value for common_code_category_seq, 'CCI_LE_ID_TYPE', 'Source System relating to CCI LE ID Type', 1, 'A');
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'100','GCIF','1','CCI_LE_ID_TYPE', 'MY', category_id from common_code_category where category_code = 'CCI_LE_ID_TYPE';
insert into common_code_category_entry (entry_id, entry_code, entry_name, active_status, category_code, country, category_code_id) select next value for common_code_category_entry_seq,'700','BWCIF','1','CCI_LE_ID_TYPE', 'SG', category_id from common_code_category where category_code = 'CCI_LE_ID_TYPE';





/*********************************************************************
Build : GEMS_R1.0_B001V2
Type : Data Patch for GEMS team
Date : 31/01/2008
Owner : Lini
Patch : Team Type to add GEMS team and membership for maker, checker
*********************************************************************/
INSERT INTO CMS_TEAM_TYPE (TEAM_TYPE_ID,BUSINESS_CODE,DESCRIPTION,PARENT_ID,IS_ADD_ALLOWED,VERSION_TIME,STATUS,PEER_ORDER) values (19,'GEMS','GEMS',0,'Y',0,'A',18);

INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (30,'Y',19,999,0,'A',1,'GEMS Maker',0);
INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (31,'Y',19,999,0,'A',2,'GEMS Checker',0);


-------------------------------------------------------
-- LMS-Standard Code - Internal Limit Parameter
-- Author: Priya
-- 28 March 2008
-------------------------------------------------------

delete from CMS_INTERNAL_LIMIT_PARAMETER;

INSERT INTO CMS_INTERNAL_LIMIT_PARAMETER (INT_LIMIT_PARAM_ID, DESCRIPTION_CODE, CAP_FUND_AMT_CUR_CODE, CAP_FUND_AMT, TOTAL_LOAN_ADV_AMT_CUR_CODE, TOTAL_LOAN_ADV_AMT,  GP5_LIM_PERCENTAGE, INT_LIM_PERCENTAGE, GROUP_ID, CMS_REF_ID, STATUS, VERSION_TIME) VALUES (2008060200000000 + next value FOR CMS_INTERNAL_LIMIT_PARAMETER_SEQ, 'ABG', 'MYR', 0, 'MYR', 0, 0, 0, 1, 0, 'ACTIVE', 1063366457627);

INSERT INTO CMS_INTERNAL_LIMIT_PARAMETER (INT_LIMIT_PARAM_ID, DESCRIPTION_CODE, CAP_FUND_AMT_CUR_CODE, CAP_FUND_AMT, TOTAL_LOAN_ADV_AMT_CUR_CODE, TOTAL_LOAN_ADV_AMT,  GP5_LIM_PERCENTAGE, INT_LIM_PERCENTAGE, GROUP_ID, CMS_REF_ID, STATUS, VERSION_TIME) VALUES (2008060200000000 + next value FOR CMS_INTERNAL_LIMIT_PARAMETER_SEQ, '2', 'MYR', 0, 'MYR', 0, 0, 0, 1, 0, 'ACTIVE', 1063366457637);

INSERT INTO CMS_INTERNAL_LIMIT_PARAMETER (INT_LIMIT_PARAM_ID, DESCRIPTION_CODE, CAP_FUND_AMT_CUR_CODE, CAP_FUND_AMT, TOTAL_LOAN_ADV_AMT_CUR_CODE, TOTAL_LOAN_ADV_AMT,  GP5_LIM_PERCENTAGE, INT_LIM_PERCENTAGE, GROUP_ID, CMS_REF_ID, STATUS, VERSION_TIME) VALUES (2008060200000000 + next value FOR CMS_INTERNAL_LIMIT_PARAMETER_SEQ, '3', 'MYR', 0, 'MYR', 0, 0, 0, 1, 0, 'ACTIVE', 1063366457647);

INSERT INTO CMS_INTERNAL_LIMIT_PARAMETER (INT_LIMIT_PARAM_ID, DESCRIPTION_CODE, CAP_FUND_AMT_CUR_CODE, CAP_FUND_AMT, TOTAL_LOAN_ADV_AMT_CUR_CODE, TOTAL_LOAN_ADV_AMT,  GP5_LIM_PERCENTAGE, INT_LIM_PERCENTAGE, GROUP_ID, CMS_REF_ID, STATUS, VERSION_TIME) VALUES (2008060200000000 + next value FOR CMS_INTERNAL_LIMIT_PARAMETER_SEQ, '4', 'MYR', 0, 'MYR', 0, 0, 0, 1, 0, 'ACTIVE', 1063366457657);

-- Transaction workflow
delete from TR_STATE_MATRIX where stateins='INTERNAL_LIMIT_PARAM';

INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6701,'INTERNAL_LIMIT_PARAM','MAKER_SAVE','ND','DRAFT','Draft','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6702,'INTERNAL_LIMIT_PARAM','MAKER_UPDATE','ND','PENDING_UPDATE','Pending Create','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6703,'INTERNAL_LIMIT_PARAM','MAKER_UPDATE','REJECTED','PENDING_UPDATE','Pending Update','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6704,'INTERNAL_LIMIT_PARAM','MAKER_UPDATE','ACTIVE','PENDING_UPDATE','Pending Update','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6705,'INTERNAL_LIMIT_PARAM','MAKER_UPDATE','DRAFT','PENDING_UPDATE','Pending Update','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6706,'INTERNAL_LIMIT_PARAM','MAKER_CANCEL','REJECTED','ACTIVE','Close Reject','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6707,'INTERNAL_LIMIT_PARAM','CHECKER_APPROVE','PENDING_UPDATE','ACTIVE','Approved','1','1');
INSERT INTO TR_STATE_MATRIX (STATEID,STATEINS,OPERATION,FROMSTATE,TOSTATE,USERSTATE,ENABLEIND,FRONTENDOP) VALUES (6708,'INTERNAL_LIMIT_PARAM','CHECKER_REJECT','PENDING_UPDATE','REJECTED','Rejected','1','1');

delete from CMS_STATEMATRIX_ACTION where URL like 'InternalLimitList.do?event=%';


INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID,TEAM_MEMBERSHIP_TYPE_ID,USER_ACTION,URL,TOTRACK_URL) VALUES (6703,32,'Process','InternalLimitList.do?event=maker_edit_internalLmt_reject\&trxID=','');
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID,TEAM_MEMBERSHIP_TYPE_ID,USER_ACTION,URL,TOTRACK_URL) VALUES (6706,32,'Close','InternalLimitList.do?event=maker_prepare_close\&trxID=','');
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID,TEAM_MEMBERSHIP_TYPE_ID,USER_ACTION,URL,TOTRACK_URL) VALUES (6707,33,'Process','InternalLimitList.do?event=checker_process_internalLmt\&trxID=','');

delete from CMS_TRX_TOTRACK where TOTRACK_URL like 'InternalLimitList.do?event=to_track%';

INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) VALUES ('INTERNAL_LIMIT_PARAM','InternalLimitList.do?event=to_track\&trxID=','PENDING_UPDATE','Pending Update','Maintain Internal Limit Parameter',null,null);

INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) VALUES ('INTERNAL_LIMIT_PARAM','InternalLimitList.do?event=to_track\&trxID=','REJECTED','Rejected','Maintain Internal Limit Parameter',null,null);

INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) VALUES ('INTERNAL_LIMIT_PARAM','InternalLimitList.do?event=to_track\&trxID=','ACTIVE','Approved','Maintain Internal Limit Parameter',null,null);

INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE,TOTRACK_URL,CURR_STATE,USER_STATE,USER_TRX_TYPE,FROM_STATE,TRANSACTION_SUBTYPE) VALUES ('INTERNAL_LIMIT_PARAM','InternalLimitList.do?event=to_track\&trxID=','ACTIVE','Closed','Maintain Internal Limit Parameter','REJECTED',null);


-- Transaction table record
INSERT INTO TRANSACTION(TRANSACTION_ID, FROM_STATE, TRANSACTION_TYPE, REFERENCE_ID, STATUS, CREATION_DATE, OPSDESC,TO_GROUP_TYPE_ID, LEGAL_ID,TO_GROUP_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TO_USER_ID ) 
SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) as CHAR(17)), 'ND', 'INTERNAL_LIMIT_PARAM', 1, 'ACTIVE', '2008-06-02-10.32.27.000000', 'SYSTEM_CREATE', '-999999999', '-999999999', -999999999, -999999999, -999999999, -999999999 FROM DUAL;

/*********************************************************************
	Build : GEMS_R1.0_B001V3
	Type : Data Patch for GEMS SC team
	Date : 04/02/2008
	Owner : Lini
	Patch : Team Type to add GEMS SC team and membership for maker, checker
*********************************************************************/

INSERT INTO CMS_TEAM_TYPE (TEAM_TYPE_ID,BUSINESS_CODE,DESCRIPTION,PARENT_ID,IS_ADD_ALLOWED,VERSION_TIME,STATUS,PEER_ORDER) values (20,'GEMSSC','GEMS Standard Code',0,'Y',0,'A',19);

INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (32,'Y',20,999,0,'A',1,'GEMS SC Maker',0);
INSERT INTO CMS_TEAM_TYPE_MEMBERSHIP (TEAM_TYPE_MEMBERSHIP_ID,INCLUDE_IN_ROUTING,TEAM_TYPE_ID,MAX_ALLOWED,VERSION_TIME,STATUS,MEMBERSHIP_TYPE_ID,MEMBERSHIP_NAME,ROLETYPE_ID) values (33,'Y',20,999,0,'A',2,'GEMS SC Checker',0);	


/*********************************************************************
   Build : GEMS_R1.0_B001V88
   Type  : Data Patch
   Date  : 4/02/2008
   Owner : Allen
   Patch : DB patches for Build#001V5 (CCI / External Search Integration )
*********************************************************************/

-- GEMS AM external customer search
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 28);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 28);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 29);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 29);

-- SAC external customer search
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 24);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 24);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 10);
--INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access   WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 10);


/*********************************************************************
   Build : GEMS_R1.0_B001V91
   Type  : Data Patch
   Date  : Wednesday, March 05, 2008 3:15 PM
   Owner : Tan Pei Cheng <pctan@integrosys.com>
   Patch : DB Patch for Build# B001V91(state matrix for Shareholder/ Relationship)
*********************************************************************/
  --  Create transaction state matrix for Maintain shareholder
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6201, 'SHAREHOLDER', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6202, 'SHAREHOLDER', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6203, 'SHAREHOLDER', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6204, 'SHAREHOLDER', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6205, 'SHAREHOLDER', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6206, 'SHAREHOLDER', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6207, 'SHAREHOLDER', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6208, 'SHAREHOLDER', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6209, 'SHAREHOLDER', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6210, 'SHAREHOLDER', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');

	
--  Create transaction state matrix for Maintain  cust relationship
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6101, 'CUST_RELNSHIP', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6102, 'CUST_RELNSHIP', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6103, 'CUST_RELNSHIP', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6104, 'CUST_RELNSHIP', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6105, 'CUST_RELNSHIP', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6106, 'CUST_RELNSHIP', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6107, 'CUST_RELNSHIP', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES  (6108, 'CUST_RELNSHIP', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6109, 'CUST_RELNSHIP', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6110, 'CUST_RELNSHIP', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');

/*********************************************************************
   Build : GEMS_R1.0_B001V91
   Type  : Data Patch
   Date  : Friday, March 07, 2008 10:13 AM
   Owner : Tan Pei Cheng <pctan@integrosys.com>
   Patch : DB Patch for Build# B001V91(state matrix for Exempted Inst)
*********************************************************************/
--  Create transaction state matrix for Maintain Exempted Institution For GP5 Exposure
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6301, 'EXEMPT_INST', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6302, 'EXEMPT_INST', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6303, 'EXEMPT_INST', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6304, 'EXEMPT_INST', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6305, 'EXEMPT_INST', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6306, 'EXEMPT_INST', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6307, 'EXEMPT_INST', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6308, 'EXEMPT_INST', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6309, 'EXEMPT_INST', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6310, 'EXEMPT_INST', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');


--**************************************************************************************************    
--********************* Create TR_STATE_MATRIX  for CGID  *********************
--**************************************************************************************************    

INSERT INTO TR_STATE_MATRIX VALUES   (6601, 'CGID', 'MAKER_UPDATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6602, 'CGID', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6603, 'CGID', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6604, 'CGID', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6605, 'CGID', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6606, 'CGID', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6607, 'CGID', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6608, 'CGID', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');
--Required by maker to do if checker rejected
INSERT INTO TR_STATE_MATRIX VALUES   (6609, 'CGID', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6610, 'CGID', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
--to see in checker approve in todo List for approve   
INSERT INTO TR_STATE_MATRIX VALUES   (6611, 'CGID', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6612, 'CGID', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6613, 'CGID', 'MAKER_SUBMIT', 'ND','PENDING_CREATE','PENDING_CREATE','1','1');
INSERT INTO TR_STATE_MATRIX VALUES   (6614, 'CGID', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6615, 'CGID', 'CHECKER_APPROVE', 'ND', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6616, 'CGID', 'MAKER_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6617, 'CGID', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES  (6618, 'CGID', 'CHECKER_APPROVE', 'PENDING_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');
--Checker to Reject
INSERT INTO TR_STATE_MATRIX VALUES   (6619, 'CGID', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED', 'REJECTED', '1', '1');
--Maker  to close the transaction if checker rejected
--INSERT INTO TR_STATE_MATRIX VALUES   (6620, 'CGID', 'MAKER_CANCEL', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
--Checker want to reject the deleted naker
INSERT INTO TR_STATE_MATRIX VALUES   (6621, 'CGID', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1');
--Maker want to Delete , Active Record
INSERT INTO TR_STATE_MATRIX VALUES   (6622, 'CGID', 'MAKER_DELETE', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6620, 'CGID', 'MAKER_CANCEL', 'REJECTED_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');

--**************************************************************************************************    
--********************* Create CMS_STATEMATRIX_ACTION  for CGID  *********************
--**************************************************************************************************    

-- checker rejected  and maker to do process
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6603, 28, 'Process', 'CustGrpIdentifier.do?event=maker_edit_cgid_reject&TrxId=', 'CustGrpIdentifier.do?event=view');
--checker rejected  and maker to close
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (6609, 28, 'Close', 'CustGrpIdentifier.do?event=maker_close_cgid&TrxId=');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6611, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
-- action if CHECKER_REJECT
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6612, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6614, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
-- action if CHECKER_APPROVE
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6615, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6618, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
-- action if CHECKER_REJECT
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6619, 29, 'Process', 'CustGrpIdentifier.do?event=checker_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6602, 28, 'Process', 'CustGrpIdentifier.do?event=process_update&TrxId=', 'CustGrpIdentifier.do?event=view');
--Maker to close draft which is  not created in actual
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (6610, 28, 'Close', 'CustGrpIdentifier.do?event=maker_close_cgid&TrxId=');
-- checker rejected delete  and maker to do process
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6617, 28, 'Process', 'CustGrpIdentifier.do?event=prepare_rejected_delete&TrxId=', 'CustGrpIdentifier.do?event=view');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (6620, 28, 'Close', 'CustGrpIdentifier.do?event=maker_close_cgid&TrxId=');

--**************************************************************************************************    
--********************* Create CMS_TRX_TOTRACK  for CGID  *********************
--**************************************************************************************************    

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'REJECTED_DELETE', 'Rejected Delete', 'Group Maintenance', null, null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'ACTIVE', 'Closed', 'Group Maintenance', 'REJECTED_DELETE', null);

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES ('CGID', 'CustGrpIdentifier.do?event=to_track&TrxId=', 'ACTIVE', 'Closed', 'Group Maintenance', 'REJECTED', null);

-- No Data Patch for V92

/*********************************************************************
   Build       : GCMS_R1.0_B001V93
   Type        : Data Patch
   Date        : 13/03/2008
   Patch       : Build 93
   Start Email :   Wednesday, March 12, 2008 6:05 PM
                   Chai Siew Kheat <skchai@integrosys.com>
                   DB Patch for Build# B001V91(state matri)
   End Email :     Thursday, March 13, 2008 3:53 PM
                   Chai Siew Kheat <skchai@integrosys.com>
                   DB Patch for Build# B001V93(Statematrix for cust relationship)
                                                       
*********************************************************************/

/*********************************************************************
   Build : GEMS_R1.0_B001V93
   Type  : Data Patch
   Date  : Wednesday, March 12, 2008 6:05 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V91(state matri)
*********************************************************************/
-- ToTrack
-- CUST_RELNSHIP
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Customer Relationship', null, null);
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Customer Relationship', null, null);

-- CRShareHolder
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Share Holder', null, null);
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Share Holder', null, null);

-- cms_statematrix_action - customer relationship & share holder
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6101, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6102, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6103, 28, 'Process', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6207, 29, 'Process', 'CRShareHolder.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6202, 28, 'Process', 'CRShareHolder.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6205, 28, 'Process', 'CRShareHolder.do?event=readMakerClose&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6205, 28, 'Close', 'CRShareHolder.do?event=readMakerClose&offset=0&length=10&trxId=', null); 



insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6107, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6102, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6105, 28, 'Process', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);


/*********************************************************************
   Build : GEMS_R1.0_B001V93
   Type  : Data Patch
   Date  : Thursday, March 13, 2008 3:48 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V93(FAP, Statematrix, Totrack for exempted institution)
*********************************************************************/
-- cms_statematrix_action - exemptedinst
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6307, 33, 'Process', 'ExemptInst.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6302, 32, 'Process', 'ExemptInst.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6305, 32, 'Process', 'ExemptInst.do?event=readMakerClose&offset=0&length=10&trxId=', null);

-- ToTrack
-- Exempted Institution
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Exempted Institution', null, null);
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Exempted Institution', null, null);





/*********************************************************************
   Build : GCMS_R1.0_B001V13
   Type  : Data Patch for CGID
   Date  : 13/03/2008
   Owner : Jitu
   Patch : FOR Group Module. ( Gems maker/Checker)
*********************************************************************/

--********************* Create Function Access (Maker2/Checker2)  for CustGrpIdentifier  *********************
-- FAP moved to gems_FAP.sql

 --********************* MAKER2/CHECKER2 CMS_TRX_TOTRACK  for CGID  *********************

--Required by maker2 to do              
INSERT INTO TR_STATE_MATRIX VALUES   (6623, 'CGID', 'MAKER2_UPDATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6624, 'CGID', 'MAKER2_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6625, 'CGID', 'MAKER2_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6626, 'CGID', 'MAKER2_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX VALUES   (6627, 'CGID', 'MAKER2_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6628, 'CGID', 'MAKER2_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6629, 'CGID', 'MAKER2_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6630, 'CGID', 'MAKER2_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');

--Required by maker2 to do if checker2 rejected
INSERT INTO TR_STATE_MATRIX VALUES   (6631, 'CGID', 'MAKER2_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6632, 'CGID', 'MAKER2_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6633, 'CGID', 'MAKER2_SUBMIT', 'ND','PENDING_CREATE','PENDING_CREATE','1','1');


INSERT INTO TR_STATE_MATRIX VALUES   (6634, 'CGID', 'CHECKER2_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6635, 'CGID', 'CHECKER2_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');


--**************************************************************************************************    
--********************* Create MAKER2/CHECKER2 CMS_STATEMATRIX_ACTION  for CGID  *********************
--**************************************************************************************************    

--MAKER PART---

--action if MAKER-DRAFT ON  Pending_UPDATE 
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6624, 30, 'Process', 'CustGrpIdentifier.do?event=process2_update&TrxId=', 'CustGrpIdentifier.do?event=view');

--for checker rejected  and maker to do process
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6625, 30, 'Process', 'CustGrpIdentifier.do?event=maker2_edit_cgid_reject&TrxId=', 'CustGrpIdentifier.do?event=view');

--for checker rejected  and maker to close
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6631, 30, 'Close', 'CustGrpIdentifier.do?event=maker2_close_cgid&TrxId=',null);

--for Maker to close draft if it is on ND Stage, which is  not created in actual
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6632, 30, 'Close', 'CustGrpIdentifier.do?event=maker2_close_cgid&TrxId=',null);
--CHECKER PART---

--for CHECKER_APPROVE for Pending Update to Active
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6634, 31, 'Process', 'CustGrpIdentifier.do?event=checker2_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');

--for CHECKER_REJECT for Pending Update to Active
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6635, 31, 'Process', 'CustGrpIdentifier.do?event=checker2_edit_cgid&TrxId=', 'CustGrpIdentifier.do?event=view');


/*********************************************************************
   Build : GCMS_R1.0_B001V94
   Type  : Data Patch for CGID
   Date  : Friday, March 14, 2008 3:14 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V94 (cust relationship)
*********************************************************************/
-- FAP moved to gems_FAP.sql

/*********************************************************************
   Build : GCMS_R1.0_B001V94
   Type  : Data Patch for CGID
   Date  : Friday, March 14, 2008 3:14 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V94 (exempted inst)
*********************************************************************/
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6308, 33, 'Process', 'ExemptInst.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6304, 32, 'Process', 'ExemptInst.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6306, 32, 'Close', 'ExemptInst.do?event=readMakerClose&offset=0&length=10&trxId=', null);

--delete from cms_statematrix_action where url = 'ExemptInst.do?event=readMakerClose&offset=0&length=10&trxId=' and state_id = 6305;
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6305, 32, 'Close', 'ExemptInst.do?event=readMakerClose&offset=0&length=10&trxId=', null); 



/*********************************************************************
   Build : GCMS_R1.0_B001V94
   Type  : Data Patch for Exempt Facility
   Date  : Friday, March 14, 2008 8:00 PM
   Owner : Lini <lini@integrosys.com>
   Patch : DB Patch for Build# B001V94 (exempted facility)
*********************************************************************/
-- Create transaction state matrix for Maintain Exempted Facility


INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6501, 'EXEMPT_FACILITY', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6502, 'EXEMPT_FACILITY', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6503, 'EXEMPT_FACILITY', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6504, 'EXEMPT_FACILITY', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6505, 'EXEMPT_FACILITY', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6506, 'EXEMPT_FACILITY', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6507, 'EXEMPT_FACILITY', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6508, 'EXEMPT_FACILITY', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6509, 'EXEMPT_FACILITY', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6510, 'EXEMPT_FACILITY', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES (6511, 'EXEMPT_FACILITY', 'MAKER_CREATE', 'CLOSED', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6510, 33, 'Process', 'ExemptFacility.do?event=checker_process&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6508, 33, 'Process', 'ExemptFacility.do?event=checker_process&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track'); 
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6507, 33, 'Process', 'ExemptFacility.do?event=checker_process&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track'); 
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6506, 32, 'Close', 'ExemptFacility.do?event=maker_close&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6505, 32, 'Close', 'ExemptFacility.do?event=maker_close&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track'); 
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6504, 32, 'Process', 'ExemptFacility.do?event=read&offset=0&length=10&trxID=', 'ExemptFacility.do?event=to_track');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES (6502, 32, 'Process', 'ExemptFacility.do?event=read&offset=0&length=10&trxID=',  'ExemptFacility.do?event=to_track');

insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Exempted Facilities',  null,  null); 
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Exempted Facilities',  null,  null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'ACTIVE', 'Approved', 'Maintain Exempted Facilities',  null,  null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'DRAFT', 'Draft', 'Maintain Exempted Facilities',  null,  null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'REJECTED_UPDATE', 'Rejected', 'Maintain Exempted Facilities',  null,  null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Exempted Facilities', null, null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'CLOSED', 'Closed', 'Maintain Exempted Facilities',  'REJECTED_CREATE',  null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES ('EXEMPT_FACILITY', 'ExemptFacility.do?event=to_track&trxID=', 'ACTIVE', 'Closed', 'Maintain Exempted Facilities',  'REJECTED_UPDATE',  null);


INSERT INTO TRANSACTION ( TRANSACTION_ID, FROM_STATE, USER_ID,TRANSACTION_TYPE, REFERENCE_ID, STAGING_REFERENCE_ID,STATUS, OPSDESC, TEAM_ID, TRX_REFERENCE_ID,LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, TO_GROUP_TYPE_ID,TO_GROUP_ID, TO_USER_ID )
SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) as CHAR(17)), 'ND' , -999999999 ,'EXEMPT_FACILITY' , 0 ,0 ,'ND' , 'SYSTEM_CREATE', -999999999, -999999999,'-999999999', -999999999,-999999999,20,CHAR(-999999999),-999999999,-999999999 FROM DUAL;



/*********************************************************************
   Build : GCMS_R1.0_B001V95
   Type  : Data Patch for CGID
   Date  : 17/03/2008
   Owner : Jitu
   Patch : DB Patch for Build# B001V95( CCI)
*********************************************************************/
--DELETE FROM tr_state_matrix  WHERE stateid = 6420;

/*********************************************************************
   Build : GCMS_R1.0_B001V95
   Type  : Data Patch for CGID
   Date  : 803/2008
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V95 (customer relationship)
*********************************************************************/
--- V 95 Customer Relationship
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6108, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6104, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6106, 28, 'Close', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);

-- V 95 Customer Share holder
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6208, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6204, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
--insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6206, 28, 'Close', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);
 
--- V 95 Customer Relationship
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6108, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6104, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6106, 28, 'Close', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);

-- V 95 Customer Share holder
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6208, 29, 'Process', 'CRShareHolder.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6204, 28, 'Process', 'CRShareHolder.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6206, 28, 'Close', 'CRShareHolder.do?event=readMakerClose&offset=0&length=10&trxId=', null);
 

 /*********************************************************************
   Build : GEMS_R1.0_B001V96
   Type  : Schema Patch
   Date  : 19/03/2008
   Owner : lini
   Patch : DB Patch for Build# B001V96 (GEMS SC renamed to GEMS Parame
*********************************************************************/

update cms_team_type
set description = 'GEMS Parameter'
where team_type_id = 20;

update CMS_TEAM_TYPE_MEMBERSHIP
set MEMBERSHIP_NAME = 'GEMS Parameter Maker'
where TEAM_TYPE_MEMBERSHIP_ID = 32;

update CMS_TEAM_TYPE_MEMBERSHIP
set MEMBERSHIP_NAME = 'GEMS Parameter Checker'
where TEAM_TYPE_MEMBERSHIP_ID = 33;
 
 /*********************************************************************
   Build : GCMS_R1.0_B001V97
   Type  : 
   Date  : 24/03/2008
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V97 (customer relationship & exempted institution)
*********************************************************************/
--97
--Cust Relationship
insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Customer Relationship', null, null);

insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Customer Relationship', null, null);

-- Share Holder
insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Share Holder', null, null);

insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Share Holder', null, null);

-- V97
insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Exempted Institution', null, null);

insert into cms_trx_totrack 
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values
('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Exempted Institution', null, null);





/*********************************************************************
   Build : GCMS_R1.0_B001V99
   Type  : data
   Date  : Friday, March 28, 2008 12:24 PM
   Owner : Lini Elsy Varghese <lini@integrosys.com>
   Patch : DB Patch for Build# B001V99(Statematrix - v95 resend)
*********************************************************************/
delete from cms_statematrix_action
where state_id IN (6108,6104,6106,6208,6204,6206); 
 
--- V 95 Customer Relationship
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6108, 29, 'Process', 'CustRelationship.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
 
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6104, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
 
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6106, 28, 'Close', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null);
 
-- V 95 Customer Share holder
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6208, 29, 'Process', 'CRShareHolder.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);
 
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6204, 28, 'Process', 'CRShareHolder.do?event=readMakerEdit&offset=0&length=10&trxId=', null);
 
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6206, 28, 'Close', 'CRShareHolder.do?event=readMakerClose&offset=0&length=10&trxId=', null);

/*********************************************************************
   Build : GCMS_R1.0_B001V99
   Type  : data
   Date  : Friday, March 28, 2008 2:04 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V99 (Customer Relationship)
*********************************************************************/
delete from cms_statematrix_action where url like 'CustRelationship.do%' and State_ID > 6200;

delete from cms_statematrix_action where url like 'CustRelationship.do%' and State_ID = 6102;

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) values (6102, 28, 'Process', 'CustRelationship.do?event=readMakerEdit&offset=0&length=10&trxId=', null);




/*********************************************************************
   Build : GCMS_R1.0_B001V99A
   Type  : data
   Date  : Friday, March 28, 2008 6:23 PM
   Owner : Chai Siew Kheat <skchai@integrosys.com>
   Patch : DB Patch for Build# B001V99 (Customer Relationship ver 2)
*********************************************************************/
delete from cms_statematrix_action where url like 'CustRelationship.do%' and State_ID = 6101;
delete from cms_statematrix_action where url like 'CustRelationship.do%' and State_ID = 6103;
delete from cms_statematrix_action where url like 'CustRelationship.do%' and State_ID = 6105;
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6105, 28, 'Close', 'CustRelationship.do?event=readMakerClose&offset=0&length=10&trxId=', null); 


/*********************************************************************
   Build : GCMS_R1.0_B001V99A
   Type  : data
   Date  : Monday, March 31, 2008 3:00 PM
   Owner : LINI
   Patch : DB Patch for Build# B001V99 (To track user Trx updated - MBBGEMS-240)
*********************************************************************/
update CMS_TRX_TOTRACK set user_trx_type = 'Update Shareholder Information' where transaction_type = 'SHAREHOLDER';
update CMS_TRX_TOTRACK set user_trx_type = 'Update Director Information' where transaction_type = 'CUST_RELNSHIP';
update CMS_TRX_TOTRACK set user_trx_type = 'Maintain Exempted Institutions' where transaction_type = 'EXEMPT_INST';



 
/*********************************************************************
   Build : GCMS_R1.0_B001V99B
   Type  :  data
   Date  :  Tuesday, April 01, 2008 12:20 PM
   Owner :  Chai Siew Kheat <skchai@integrosys.com>
   Patch :  DB Patch for Build# B001V99b (Share Holder state matrix fix for Process, Close)
*********************************************************************/
delete from cms_statematrix_action where url like 'CRShareHolder.do%' and State_ID = 6205;
insert into cms_statematrix_action
(state_id, team_membership_type_id, user_action, url, totrack_url)
values
(6205, 28, 'Close', 'CRShareHolder.do?event=readMakerClose&offset=0&length=10&trxId=', null); 

 
/*********************************************************************
   Build : GCMS_R1.0_B001V99C
   Type  :  data
   Date  :  Thursday, April 03, 2008 1:58 AM
   Owner :  Chai Siew Kheat <skchai@integrosys.com>
   Patch :  DB Patch for Build# B001V99c (Cust Relationship, Share Holder and Exempted Institution Totrack entries)
*********************************************************************/
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Maintain Exempted Institutions', 'PENDING_CREATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Maintain Exempted Institutions', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Maintain Exempted Institutions', 'PENDING_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('EXEMPT_INST', 'ExemptInst.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Maintain Exempted Institutions', 'REJECTED_CREATE', null);

-- V99c
-- custrelationship
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Update Director Information', 'PENDING_CREATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Update Director Information', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Update Director Information', 'PENDING_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('CUST_RELNSHIP', 'CustRelationship.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Update Director Information', 'REJECTED_CREATE', null);

-- V99c
--share holder
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Update Shareholder Information', 'PENDING_CREATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Update Shareholder Information', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Update Shareholder Information', 'PENDING_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) values ('SHAREHOLDER', 'CRShareHolder.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Update Shareholder Information', 'REJECTED_CREATE', null);

 
 /*********************************************************************
   Build : GCMS_R1.0_B001V99C
   Type  :  data
   Date  :  Friday, April 04, 2008 5:16 PM
   Owner :  Lini Elsy Varghese <lini@integrosys.com>
   Patch : DB Patch for Build# B001V99c
*********************************************************************/
update tr_state_matrix set tostate = 'ACTIVE',userstate = 'ACTIVE' where stateid = 6506 and stateins = 'EXEMPT_FACILITY';

/*********************************************************************
   Build : GCMS_R1.0
   Type  :  data
   Date  :  Thursday, May 29, 2008 2.07PM
   Owner :  Andy Wong <awong@integrosys.com>
   Patch :  DB Patch for Build #53 (Bank Entity Branch Code Param)
*********************************************************************/

INSERT INTO TR_STATE_MATRIX VALUES   (6901, 'BANK_ENTITY_BRANCH', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6902, 'BANK_ENTITY_BRANCH', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6903, 'BANK_ENTITY_BRANCH', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6904, 'BANK_ENTITY_BRANCH', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6905, 'BANK_ENTITY_BRANCH', 'MAKER_CLOSE_REJECTED', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX VALUES   (6906, 'BANK_ENTITY_BRANCH', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (6903, 33, 'Process' , 'bankEntityBranchParam.do?event=checker_prepare&TrxId=', null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (6906, 32, 'Process' , 'bankEntityBranchParam.do?event=maker_prepare_resubmit&TrxId=', null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (6905, 32, 'Close' , 'bankEntityBranchParam.do?event=maker_prepare_close&TrxId=', null);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
VALUES ('BANK_ENTITY_BRANCH', 'bankEntityBranchParam.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Bank Entity Branch Code', 'PENDING_UPDATE', null);
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
VALUES ('BANK_ENTITY_BRANCH', 'bankEntityBranchParam.do?event=to_track&TrxId=', 'ACTIVE', 'Closed', 'Maintain Bank Entity Branch Code', 'REJECTED', null);
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
VALUES ('BANK_ENTITY_BRANCH', 'bankEntityBranchParam.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Bank Entity Branch Code', null, null);
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
VALUES ('BANK_ENTITY_BRANCH', 'bankEntityBranchParam.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain Bank Entity Branch Code', null, null);

INSERT INTO TRANSACTION ( TRANSACTION_ID, FROM_STATE, USER_ID,TRANSACTION_TYPE, REFERENCE_ID,STATUS, OPSDESC, TEAM_ID, TRX_REFERENCE_ID,LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, TO_GROUP_TYPE_ID,TO_GROUP_ID, TO_USER_ID )
SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) as CHAR(17)), 'ACTIVE' , -999999999 , 'BANK_ENTITY_BRANCH' , 1 , 'ACTIVE' , 'SYSTEM_CREATE', -999999999, -999999999,'-999999999', -999999999,-999999999,20,CHAR(-999999999),-999999999,-999999999 FROM DUAL;

/**************************************************************************
Entity Limit - LMS Standard Code 
Author : Siew Kheat
Date : 4 June 2008
Description : Create transaction state matrix for Maintaining Entity Limit entry
*************************************************************************/
--delete from TR_STATE_MATRIX where STATEINS = 'ENTITY_LIMIT';

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7001, 'ENTITY_LIMIT', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7002, 'ENTITY_LIMIT', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7003, 'ENTITY_LIMIT', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7004, 'ENTITY_LIMIT', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7005, 'ENTITY_LIMIT', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7006, 'ENTITY_LIMIT', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7007, 'ENTITY_LIMIT', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7008, 'ENTITY_LIMIT', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7009, 'ENTITY_LIMIT', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7010, 'ENTITY_LIMIT', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');
	
--delete from cms_statematrix_action where  user_action like 'EntityLimit%';

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7007, 33, 'Process', 'EntityLimit.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7002, 32, 'Process', 'EntityLimit.do?event=readMakerEdit&offset=0&length=10&trxId=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7005, 32, 'Close', 'EntityLimit.do?event=readMakerClose&offset=0&length=10&trxId=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7008, 33, 'Process', 'EntityLimit.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7004, 32, 'Process', 'EntityLimit.do?event=readMakerEdit&offset=0&length=10&trxId=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url)
values (7006, 32, 'Close', 'EntityLimit.do?event=readMakerClose&offset=0&length=10&trxId=', null);


-- delete from cms_trx_totrack where TRANSACTION_TYPE = 'ENTITY_LIMIT';

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Entity Limit', null, null);

insert into cms_trx_totrack  (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Entity Limit', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Entity Limit', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Entity Limit', null, null);


-- ToTrack Entry
insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Maintain Entity Limit', 'PENDING_CREATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Maintain Entity Limit', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Maintain Entity Limit', 'PENDING_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('ENTITY_LIMIT', 'EntityLimit.do?event=to_track&trxId=', 'ACTIVE', 'Closed', 'Maintain Entity Limit', 'REJECTED_CREATE', null);


/***************************
Setup data for country rating in country limit param

***************************/

INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M1', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M2', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M3', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M4', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M5', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M6', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M7', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M8', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M9', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M10', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M11', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M12', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M13', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M14', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M15', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M16', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M17', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M18', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M19', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M20', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M21', 1, 0);
INSERT INTO CMS_COUNTRY_RATING (COUNTRY_RATING_ID, COUNTRY_RATING_CODE, GROUP_ID, VERSION_TIME) 
values
(next value for COUNTRY_RATING_SEQ, 'M22', 1, 0);

	
INSERT INTO TRANSACTION ( TRANSACTION_ID, FROM_STATE, USER_ID,TRANSACTION_TYPE, REFERENCE_ID, STAGING_REFERENCE_ID,STATUS, OPSDESC, TEAM_ID, TRX_REFERENCE_ID,LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, TO_GROUP_TYPE_ID,TO_GROUP_ID, TO_USER_ID )
SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR TRX_SEQ), 2)) as CHAR(17)), 'ACTIVE' , -999999999 , 'COUNTRY_LIMIT' , 1 ,0 , 'ACTIVE' , 'SYSTEM_CREATE', -999999999, -999999999,'-999999999', -999999999,-999999999,20,CHAR(-999999999),-999999999,-999999999 FROM DUAL;	


--  Create transaction state matrix for Maintain Maintain Country Limit For GP5 Exposure
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6801, 'COUNTRY_LIMIT', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6802, 'COUNTRY_LIMIT', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6803, 'COUNTRY_LIMIT', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6804, 'COUNTRY_LIMIT', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6805, 'COUNTRY_LIMIT', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6806, 'COUNTRY_LIMIT', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6807, 'COUNTRY_LIMIT', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6808, 'COUNTRY_LIMIT', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6809, 'COUNTRY_LIMIT', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (6810, 'COUNTRY_LIMIT', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');

--statematrix
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6802, 32, 'Process', 'CountryLimitParam.do?event=process_update&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6804, 32, 'Process', 'CountryLimitParam.do?event=process_update&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6807, 33, 'Process', 'CountryLimitParam.do?event=process&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6808, 33, 'Process', 'CountryLimitParam.do?event=process&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6806, 32, 'Close', 'CountryLimitParam.do?event=prepare_close&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (6805, 32, 'Close', 'CountryLimitParam.do?event=prepare_close&trxID=', null); 


insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'ACTIVE', 'Approved', 'Maintain Country Limit', 'PENDING_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'ACTIVE', 'Closed', 'Maintain Country Limit', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Country Limit', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Country Limit', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Country Limit', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('COUNTRY_LIMIT', 'CountryLimitParam.do?event=track&trxID=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Country Limit', null, null);

-------------------------------------------------------
-- LMS-Standard Code - Internal Credit Rating Parameter
-- Author: Priya
-- 03 June 2008
-------------------------------------------------------
         
-- State Matrix Entry
                        
-- delete from TR_STATE_MATRIX where stateins='INT_CRED_RAT';

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7201, 'INT_CRED_RAT', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7202, 'INT_CRED_RAT', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7203, 'INT_CRED_RAT', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7204, 'INT_CRED_RAT', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7205, 'INT_CRED_RAT', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7206, 'INT_CRED_RAT', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX  ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7207, 'INT_CRED_RAT', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7208, 'INT_CRED_RAT', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7209, 'INT_CRED_RAT', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7210, 'INT_CRED_RAT', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');


/**************************************************************************
 Requestor : Grace Teh Mooi Eng
 Desc :  Script for Internal CRedit Rating Parameter module.
 Task :  statematrix action flow 
 Date :  12/6/2008
*************************************************************************/

--delete from CMS_STATEMATRIX_ACTION where URL like 'InternalCreditRatingParam.do?event=%';

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7202, 32, 'Process', 'InternalCreditRatingParam.do?event=maker_prepare_update&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7204, 32, 'Process', 'InternalCreditRatingParam.do?event=maker_prepare_update&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7207, 33, 'Process', 'InternalCreditRatingParam.do?event=checker_prepare_process&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7208, 33, 'Process', 'InternalCreditRatingParam.do?event=checker_prepare_process&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7206, 32, 'Close', 'InternalCreditRatingParam.do?event=maker_prepare_close&trxID=', null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url, totrack_url) 
values (7205, 32, 'Close', 'InternalCreditRatingParam.do?event=maker_prepare_close&trxID=', null);


--delete from CMS_TRX_TOTRACK where TRANSACTION_TYPE='INT_CRED_RAT';

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'ACTIVE', 'Approved', 'Maintain Internal Credit Rating Parameter', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'CLOSED ', 'Closed', 'Maintain Internal Credit Rating Parameter', 'REJECTED_CREATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'ACTIVE', 'Closed', 'Maintain Internal Credit Rating Parameter', 'REJECTED_UPDATE', null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Internal Credit Rating Parameter', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Internal Credit Rating Parameter', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Internal Credit Rating Parameter', null, null);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('INT_CRED_RAT', 'InternalCreditRatingParam.do?event=to_track&trxID=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Internal Credit Rating Parameter', null, null);




/*********************************************************************
   Build : GCMS_R1.0
   Type  :  data
   Date  :  Friday, June 6, 2008 11.13AM
   Owner :  Syukri Jamaluddin <abdul@integrosys.com>
   Patch :  DB Patch for Build #53 (Sector Limit Parameter)
*********************************************************************/

--DELETE FROM TR_STATE_MATRIX WHERE STATEINS = 'SECTOR_LIMIT';

INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7101, 'SECTOR_LIMIT', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7102, 'SECTOR_LIMIT', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7103, 'SECTOR_LIMIT', 'MAKER_DELETE', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7104, 'SECTOR_LIMIT', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7105, 'SECTOR_LIMIT', 'MAKER_CLOSE_CREATE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7106, 'SECTOR_LIMIT', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7107, 'SECTOR_LIMIT', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7108, 'SECTOR_LIMIT', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7109, 'SECTOR_LIMIT', 'MAKER_CLOSE_DELETE', 'REJECTED_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7110, 'SECTOR_LIMIT', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7111, 'SECTOR_LIMIT', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7112, 'SECTOR_LIMIT', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7113, 'SECTOR_LIMIT', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7114, 'SECTOR_LIMIT', 'CHECKER_APPROVE', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7115, 'SECTOR_LIMIT', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1');




--DELETE FROM CMS_STATEMATRIX_ACTION WHERE URL LIKE 'SectorLimitParam%';

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7104, 32, 'Process', 'SectorLimitParam.do?event=maker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7105, 32, 'Close', 'SectorLimitParam.do?event=prepare_close&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7106, 32, 'Process', 'SectorLimitParam.do?event=maker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7107, 32, 'Close', 'SectorLimitParam.do?event=prepare_close&trxId=', NULL); 

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7108, 32, 'Process', 'SectorLimitParam.do?event=maker_process_delete&trxId=', NULL);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7109, 32, 'Close', 'SectorLimitParam.do?event=prepare_close&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7110, 33, 'Process' , 'SectorLimitParam.do?event=checker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7112, 33, 'Process', 'SectorLimitParam.do?event=checker_process&trxId=', NULL); 

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7114, 33, 'Process', 'SectorLimitParam.do?event=checker_process&trxId=', NULL); 


--DELETE FROM CMS_TRX_TOTRACK WHERE TRANSACTION_TYPE = 'SECTOR_LIMIT';

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'REJECTED_DELETE', 'Rejected Delete', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'ACTIVE', 'Approved', 'Maintain Sector Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'DELETED', 'Deleted', 'Maintain Sector Limit', 'NULL', NULL);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('SECTOR_LIMIT', 'SectorLimitParam.do?event=track&trxId=', 'CLOSED ', 'Closed', 'Maintain Sector Limit', NULL, null);

/**************************************************************************
CR_ABCMSEXT-199 - Auto Finance Report
*************************************************************************/
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'001','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'002','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'003','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'004','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'005','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'007','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'008','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'009','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'010','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'011','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'012','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'013','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'015','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'016','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'017','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'018','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'019','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'021','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'022','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'023','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'024','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'025','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'026','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'028','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'029','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'030','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'031','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'032','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'035','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'038','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'039','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'040','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'041','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'042','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'043','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'045','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'046','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'047','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'048','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'049','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'051','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'054','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'055','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'057','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'058','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'059','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'061','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'062','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'063','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'066','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'069','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'073','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'075','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'076','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'077','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'078','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'079','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'080','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'082','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'083','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'084','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'085','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'086','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'087','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'088','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'501','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'502','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'503','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'504','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'505','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'507','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'508','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'509','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'510','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'511','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'512','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'513','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'515','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'516','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'517','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'518','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'519','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'521','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'522','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'523','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'524','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'525','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'526','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'528','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'529','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'530','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'531','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'532','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'535','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'538','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'539','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'540','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'541','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'542','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'543','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'545','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'546','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'547','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'548','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'549','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'551','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'554','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'555','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'557','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'558','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'559','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'561','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'562','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'563','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'566','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'569','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'573','EAST','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'575','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'576','NORTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'577','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'578','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'579','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'580','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'582','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'583','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'584','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'585','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'586','SOUTH','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'587','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'588','CENTRAL','A');
insert into CMS_BRANCH_MAP (BRANCH_MAP_ID, BRANCH_CODE, REGION, ACTIVE_STATUS) values (next value for branch_map_seq,'604','CENTRAL','A');

--delete from TR_STATE_MATRIX where STATEINS='LIMIT_BOOKING';
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7401, 'LIMIT_BOOKING', 'MAKER_CREATE_APPROVE', 'ND', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7402, 'LIMIT_BOOKING', 'MAKER_UPDATE_APPROVE', 'ACTIVE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7403, 'LIMIT_BOOKING', 'MAKER_DELETE_APPROVE', 'ACTIVE', 'CLOSED', 'CLOSED', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7404, 'LIMIT_BOOKING', 'MAKER_SUCCESS_APPROVE', 'ACTIVE', 'CLOSED', 'CLOSED', '1', '1');

-- update team description and membership name to the correct name for CLIMS project
update CMS_TEAM_TYPE set BUSINESS_CODE='LMSAM', DESCRIPTION='LMS AM' where TEAM_TYPE_ID = 18;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS AM Maker' where TEAM_TYPE_MEMBERSHIP_ID = 28;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS AM Checker' where TEAM_TYPE_MEMBERSHIP_ID = 29;

update CMS_TEAM_TYPE set BUSINESS_CODE='LMS', DESCRIPTION='LMS' where TEAM_TYPE_ID = 19;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS Maker' where TEAM_TYPE_MEMBERSHIP_ID = 30;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS Checker' where TEAM_TYPE_MEMBERSHIP_ID = 31;

update CMS_TEAM_TYPE set BUSINESS_CODE='LMSSC', DESCRIPTION='LMS Parameter' where TEAM_TYPE_ID = 20;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS Parameter Maker' where TEAM_TYPE_MEMBERSHIP_ID = 32;
update CMS_TEAM_TYPE_MEMBERSHIP set MEMBERSHIP_NAME='LMS Parameter Checker' where TEAM_TYPE_MEMBERSHIP_ID = 33;


--DELETE FROM TR_STATE_MATRIX WHERE STATEINS = 'PRODUCT_LIMIT';

INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7501, 'PRODUCT_LIMIT', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7502, 'PRODUCT_LIMIT', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7503, 'PRODUCT_LIMIT', 'MAKER_DELETE', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7504, 'PRODUCT_LIMIT', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7505, 'PRODUCT_LIMIT', 'MAKER_CLOSE_CREATE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7506, 'PRODUCT_LIMIT', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7507, 'PRODUCT_LIMIT', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7508, 'PRODUCT_LIMIT', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7509, 'PRODUCT_LIMIT', 'MAKER_CLOSE_DELETE', 'REJECTED_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
VALUES (7510, 'PRODUCT_LIMIT', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7511, 'PRODUCT_LIMIT', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7512, 'PRODUCT_LIMIT', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7513, 'PRODUCT_LIMIT', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7514, 'PRODUCT_LIMIT', 'CHECKER_APPROVE', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1');

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES (7515, 'PRODUCT_LIMIT', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1');

--DELETE FROM CMS_STATEMATRIX_ACTION WHERE URL LIKE 'ProductProgramLimitParam%';

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7504, 32, 'Process', 'ProductProgramLimitParam.do?event=maker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7505, 32, 'Close', 'ProductProgramLimitParam.do?event=prepare_close&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7506, 32, 'Process', 'ProductProgramLimitParam.do?event=maker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7507, 32, 'Close', 'ProductProgramLimitParam.do?event=prepare_close&trxId=', NULL); 

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7508, 32, 'Process', 'ProductProgramLimitParam.do?event=maker_process_delete&trxId=', NULL);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7509, 32, 'Close', 'ProductProgramLimitParam.do?event=prepare_close&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7510, 33, 'Process' , 'ProductProgramLimitParam.do?event=checker_process&trxId=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES (7512, 33, 'Process', 'ProductProgramLimitParam.do?event=checker_process&trxId=', NULL); 

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) 
values (7514, 33, 'Process', 'ProductProgramLimitParam.do?event=checker_process&trxId=', NULL); 


--DELETE FROM CMS_TRX_TOTRACK WHERE TRANSACTION_TYPE = 'PRODUCT_LIMIT';

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'REJECTED_DELETE', 'Rejected Delete', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'ACTIVE', 'Approved', 'Maintain Product Limit', NULL, NULL);

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
VALUES ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'DELETED', 'Deleted', 'Maintain Product Limit', 'NULL', NULL);

insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) 
values ('PRODUCT_LIMIT', 'ProductProgramLimitParam.do?event=track&trxId=', 'CLOSED ', 'Closed', 'Maintain Product Limit', NULL, null);

COMMIT WORK;
