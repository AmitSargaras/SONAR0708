insert into common_code_category (category_id, category_code, category_name, category_type, active_status, version_time)
values ((select max(CATEGORY_ID) + 1 from common_code_category), 'BANKING_ARRANGEMENT', 'Banking Arrangement', 2, 'A', 0);

insert into stage_common_code_category (category_id, category_code, category_name, category_type, active_status, version_time)
values ((select max(CATEGORY_ID) + 1 from stage_common_code_category), 'BANKING_ARRANGEMENT', 'Banking Arrangement', 2, 'A', 0);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID, STAGING_REFERENCE_ID, STATUS,TEAM_ID,VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_TYPE', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A'),
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
,'ACTIVE',-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID, STAGING_REFERENCE_ID,
STATUS,TEAM_ID,VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_ENTRY', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A'),
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A'),
'ACTIVE',-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'SOLE', 'Sole', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0, sysdate, sysdate);


insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'CONSORTIUM', 'Consortium', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'MULTI_BANKING_ARRANGEMENT', 'Multiple Banking Arrangement', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'UNDER_INTIMATION', 'Under Intimation', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'NA', 'NA', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0, sysdate, sysdate);


insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'BANKING_ARRANGEMENT' and entry_code= 'SOLE' and ACTIVE_STATUS = '1')
,'SOLE', 'Sole', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'BANKING_ARRANGEMENT' and entry_code= 'CONSORTIUM' and ACTIVE_STATUS = '1')
,'CONSORTIUM', 'Consortium', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'BANKING_ARRANGEMENT' and entry_code= 'MULTI_BANKING_ARRANGEMENT' and ACTIVE_STATUS = '1')
,'MULTI_BANKING_ARRANGEMENT', 'Multiple Banking Arrangement', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'BANKING_ARRANGEMENT' and entry_code= 'UNDER_INTIMATION' and ACTIVE_STATUS = '1')
,'UNDER_INTIMATION', 'Under Intimation', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'BANKING_ARRANGEMENT' and entry_code= 'NA' and ACTIVE_STATUS = '1')
,'NA', 'NA', '1', 'BANKING_ARRANGEMENT',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='BANKING_ARRANGEMENT' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='BANKING_ARRANGEMENT' AND active_status='A')
, sysdate, sysdate);

insert into common_code_category (category_id, category_code, category_name, category_type, active_status, version_time)
values ((select max(CATEGORY_ID) + 1 from common_code_category), 'CLAUSE_AS_PER_POLICY', 'Clause as per Policy', 2, 'A', 0);

insert into stage_common_code_category (category_id, category_code, category_name, category_type, active_status, version_time)
values ((select max(CATEGORY_ID) + 1 from stage_common_code_category), 'CLAUSE_AS_PER_POLICY', 'Clause as per Policy', 2, 'A', 0);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID,STAGING_REFERENCE_ID, STATUS,TEAM_ID,
VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_TYPE', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A'),
(SELECT category_id FROM stage_common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A'),
'ACTIVE',-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID, STATUS, STAGING_REFERENCE_ID,TEAM_ID,VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_ENTRY', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A'),'ACTIVE',
(SELECT category_id FROM stage_common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A')
,-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'NA', 'NA', '1', 'CLAUSE_AS_PER_POLICY',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' and active_status = 'A'), 0, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'CLAUSE_AS_PER_POLICY' and entry_code= 'NA' and ACTIVE_STATUS = '1')
,'NA', 'NA', '1', 'CLAUSE_AS_PER_POLICY',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' and active_status = 'A'), 0,
(SELECT category_id FROM stage_common_code_category WHERE category_code='CLAUSE_AS_PER_POLICY' AND active_status='A')
, sysdate, sysdate);

INSERT INTO cms_function_access values ((select max(id) + 1 from CMS_FUNCTION_ACCESS ),'BankingArrangementFacExclusion','*','1004');
INSERT INTO cms_function_access values ((select max(id) + 1 from CMS_FUNCTION_ACCESS ),'BankingArrangementFacExclusion','*','1005');

insert into transaction_type_name (transaction_type, name, transaction_subtype,access_name)
values('BANKING_ARR_FAC_EXC', 'Banking Arrangement Facility Exclusion', null, 2);

insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_CREATE', 'Pending Create',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','REJECTED', 'Rejected',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','CLOSED', 'Closed',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_UPDATE', 'Pending Update',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_DELETE', 'Pending Delete',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Approved',
'Banking Arrangement Facility Exclusion','PENDING_UPDATE',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Approved',
'Banking Arrangement Facility Exclusion','PENDING_CREATE',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','DRAFT', 'Draft',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','DELETED', 'Deleted',
'Banking Arrangement Facility Exclusion',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Closed',
'Banking Arrangement Facility Exclusion','REJECTED',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('BANKING_ARR_FAC_EXC',
'BankingArrangementFacExclusion.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Closed',
'Banking Arrangement Facility Exclusion','DRAFT',null);

insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CREATE', 'ND','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'APPROVE', 'PENDING_UPDATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'UPDATE', 'ACTIVE','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'EDIT_REJECTED_DELETE', 'REJECTED','PENDING_DELETE','PENDING_DELETE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CREATE', 'PENDING_CREATE','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'APPROVE_CREATE', 'PENDING_CREATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'REJECT', 'PENDING_UPDATE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'EDIT_REJECTED_UPDATE', 'REJECTED','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CLOSE_REJECTED_UPDATE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'REJECT', 'PENDING_CREATE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CLOSE_REJECTED_CREATE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'EDIT_REJECTED_CREATE', 'REJECTED','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'DELETE', 'ACTIVE','PENDING_DELETE','PENDING_DELETE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'DELETE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'REJECT', 'PENDING_DELETE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CLOSE_REJECTED_DELETE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'UPDATE', 'PENDING_UPDATE','ACTIVE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CHECKER_APPROVE_DELETE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'APPROVE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'MAKER_SAVE', 'PENDING_PERFECTION','DRAFT','DRAFT', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CREATE', 'DRAFT','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'MAKER_UPDATE_SAVE', 'ACTIVE','DRAFT','DRAFT', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'UPDATE', 'DRAFT','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'MAKER_UPDATE_CLOSE', 'DRAFT','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'BANKING_ARR_FAC_EXC',
'CREATE', 'PENDING_PERFECTION','DRAFT','DRAFT', 1, 1);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='EDIT_REJECTED_DELETE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_DELETE' AND USERSTATE='PENDING_DELETE')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_prepare_resubmit_delete'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='CREATE' and FROMSTATE ='PENDING_CREATE' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1005,'Process','BankingArrangementFacExclusion.do?event=checker_process_create'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='REJECT' and FROMSTATE ='PENDING_UPDATE' AND TOSTATE='REJECTED' AND USERSTATE='REJECTED')
,1005,'Process','BankingArrangementFacExclusion.do?event=checker_process_edit'||'&'||'TrxId=',null);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='EDIT_REJECTED_UPDATE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_UPDATE' AND USERSTATE='PENDING_UPDATE')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_prepare_resubmit_create'||'&'||'TrxId=',null);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='CLOSE_REJECTED_UPDATE' and FROMSTATE ='REJECTED' AND TOSTATE='ACTIVE' AND USERSTATE='ACTIVE')
,1004,'Close','BankingArrangementFacExclusion.do?event=maker_prepare_close'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='EDIT_REJECTED_CREATE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_prepare_resubmit_create'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='DELETE' and FROMSTATE ='PENDING_DELETE' AND TOSTATE='DELETED' AND USERSTATE='DELETED')
,1005,'Process','BankingArrangementFacExclusion.do?event=checker_process_delete'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='UPDATE' and FROMSTATE ='PENDING_UPDATE' AND TOSTATE='ACTIVE' AND USERSTATE='PENDING_UPDATE')
,1005,'Process','BankingArrangementFacExclusion.do?event=checker_process_edit'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='MAKER_SAVE' and FROMSTATE ='PENDING_PERFECTION' AND TOSTATE='DRAFT' AND USERSTATE='DRAFT')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='CREATE' and FROMSTATE ='DRAFT' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='UPDATE' and FROMSTATE ='DRAFT' AND TOSTATE='PENDING_UPDATE' AND USERSTATE='PENDING_UPDATE')
,1004,'Process','BankingArrangementFacExclusion.do?event=maker_update_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='BANKING_ARR_FAC_EXC' 
and OPERATION='MAKER_UPDATE_CLOSE' and FROMSTATE ='DRAFT' AND TOSTATE='ACTIVE' AND USERSTATE='ACTIVE')
,1004,'Close','BankingArrangementFacExclusion.do?event=maker_draft_close_process'||'&'||'TrxId=',null);

Insert into COMMON_CODE_CATEGORY_ENTRY 
(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE,CATEGORY_CODE_ID,ENTRY_SOURCE,COUNTRY,GROUP_ID,
REF_ENTRY_CODE,VERSION_TIME,STATUS,CREATION_DATE,LAST_UPDATE_DATE,CPS_ID,EOD_SYNC_STATUS,ECBF_ID)
values ((select max(ENTRY_ID) + 1 from COMMON_CODE_CATEGORY_ENTRY),'RPT0081','Banking Arrangement on Facility and Line level Report','1','REPORTS'
,(select CATEGORY_ID from COMMON_CODE_CATEGORY where CATEGORY_CODE = 'REPORTS' and ACTIVE_STATUS ='A' ),
null,'IN',null,null,0,null,null,null,null,'SUCCESSFUL',null);