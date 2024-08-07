Insert Into Common_Code_Category (Category_Id, Category_Code, Category_Name, Category_Type, Active_Status, Version_Time)
values ((select max(CATEGORY_ID) + 1 from common_code_category), 'EMPLOYEE_GRADE', 'Employee Grade', 2, 'A', 0);

insert into stage_common_code_category (category_id, category_code, category_name, category_type, active_status, version_time)
values ((select max(CATEGORY_ID) + 1 from stage_common_code_category), 'EMPLOYEE_GRADE', 'Employee Grade', 2, 'A', 0);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID,STAGING_REFERENCE_ID, STATUS,TEAM_ID,
VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_TYPE', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' AND active_status='A'),
(SELECT category_id FROM stage_common_code_category WHERE category_code='EMPLOYEE_GRADE' AND active_status='A'),
'ACTIVE',-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into TRANSACTION 
(TRANSACTION_ID, FROM_STATE,USER_ID,TRANSACTION_TYPE, CREATION_DATE, TRANSACTION_DATE,REFERENCE_ID, STATUS, STAGING_REFERENCE_ID,TEAM_ID,VERSION,TRX_REFERENCE_ID,LEGAL_ID,CUSTOMER_ID,LIMIT_PROFILE_ID
,TEAM_TYPE_ID,TO_GROUP_TYPE_ID,TO_GROUP_ID,TO_USER_ID, TEAM_MEMBERSHIP_ID)
VALUES(
(SELECT MAX(TRANSACTION_ID) + 1 FROM TRANSACTION),'PENDING_UPDATE', -999999999, 'COMMON_CODE_ENTRY', SYSDATE,SYSDATE,
(SELECT category_id FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' AND active_status='A'),'ACTIVE',
(SELECT category_id FROM stage_common_code_category WHERE category_code='EMPLOYEE_GRADE' AND active_status='A')
,-999999999,0,-999999999,-999999999,-999999999,-999999999,
-999999999,-999999999,-999999999,-999999999, -999999999);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((select max(entry_id) + 1 from common_code_category_entry),'E1', 'E1', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'E2', 'E2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'E3', 'E3', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'E4', 'E4', '1', 'EMPLOYEE_GRADE',
(Select Category_Id From Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status = 'A'), 0, Sysdate, Sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'D1', 'D1', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'D2', 'D2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);


insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'D3', 'D3', '1', 'EMPLOYEE_GRADE',
(Select Category_Id From Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status = 'A'), 0, Sysdate, Sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'D4', 'D4', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'D5', 'D5', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
Values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'C1', 'C1', '1', 'EMPLOYEE_GRADE',
(Select Category_Id From Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status = 'A'), 0, Sysdate, Sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
Values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'C2', 'C2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0, sysdate, sysdate);

insert into common_code_category_entry 
(entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, creation_date,last_update_date)
values
((Select Max(Entry_Id) + 1 From Common_Code_Category_Entry),'GH', 'GH', '1', 'EMPLOYEE_GRADE',
(Select Category_Id From Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status = 'A'), 0, Sysdate, Sysdate);


------------

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'E1' and ACTIVE_STATUS = '1')
,'E1', 'E1', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'E2' and ACTIVE_STATUS = '1')
,'E2', 'E2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'E3' and ACTIVE_STATUS = '1')
,'E3', 'E3', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'E4' and ACTIVE_STATUS = '1')
,'E4', 'E4', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'D1' and ACTIVE_STATUS = '1')
,'D1', 'D1', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'D2' and ACTIVE_STATUS = '1')
,'D2', 'D2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'D3' and ACTIVE_STATUS = '1')
,'D3', 'D3', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'D4' and ACTIVE_STATUS = '1')
,'D4', 'D4', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'D5' and ACTIVE_STATUS = '1')
,'D5', 'D5', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'C1' and ACTIVE_STATUS = '1')
,'C1', 'C1', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'C2' and ACTIVE_STATUS = '1')
,'C2', 'C2', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);

insert into STAGE_COMMON_CODE_ENTRY 
(stage_id, entry_id, entry_code, entry_name, active_status, category_code, category_code_id,version_time, STAGING_REFERENCE_ID, creation_date,last_update_date)
values
((select max(stage_id) + 1 from STAGE_COMMON_CODE_ENTRY),
(select entry_id from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE = 'EMPLOYEE_GRADE' and entry_code= 'GH' and ACTIVE_STATUS = '1')
,'GH', 'GH', '1', 'EMPLOYEE_GRADE',
(SELECT CATEGORY_ID FROM common_code_category WHERE category_code='EMPLOYEE_GRADE' and active_status = 'A'), 0,
(Select Category_Id From Stage_Common_Code_Category Where Category_Code='EMPLOYEE_GRADE' And Active_Status='A')
, sysdate, sysdate);


INSERT INTO cms_function_access values ((select max(id) + 1 from CMS_FUNCTION_ACCESS ),'LimitsOfAuthorityMaster','*','1004');
INSERT INTO cms_function_access values ((select max(id) + 1 from CMS_FUNCTION_ACCESS ),'LimitsOfAuthorityMaster','*','1005');

insert into transaction_type_name (transaction_type, name, transaction_subtype,access_name)
values('LIMITS_OF_AUTHORITY', 'Limits of Authority Master', null, 2);

insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_CREATE', 'Pending Create',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','REJECTED', 'Rejected',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','CLOSED', 'Closed',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_UPDATE', 'Pending Update',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','PENDING_DELETE', 'Pending Delete',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Approved',
'Limits of Authority Master','PENDING_UPDATE',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Approved',
'Limits of Authority Master','PENDING_CREATE',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','DRAFT', 'Draft',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','DELETED', 'Deleted',
'Limits of Authority Master',null,null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Closed',
'Limits of Authority Master','REJECTED',null);
insert into CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
values ('LIMITS_OF_AUTHORITY',
'LimitsOfAuthorityMaster.do?event=rejected_delete_read'||'&'||'toTrack=yes'||'&'||'TrxId=','ACTIVE', 'Closed',
'Limits of Authority Master','DRAFT',null);

insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CREATE', 'ND','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'APPROVE', 'PENDING_UPDATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'UPDATE', 'ACTIVE','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'EDIT_REJECTED_DELETE', 'REJECTED','PENDING_DELETE','PENDING_DELETE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CREATE', 'PENDING_CREATE','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'APPROVE_CREATE', 'PENDING_CREATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'REJECT', 'PENDING_UPDATE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'EDIT_REJECTED_UPDATE', 'REJECTED','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CLOSE_REJECTED_UPDATE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'REJECT', 'PENDING_CREATE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CLOSE_REJECTED_CREATE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'EDIT_REJECTED_CREATE', 'REJECTED','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'DELETE', 'ACTIVE','PENDING_DELETE','PENDING_DELETE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'DELETE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'REJECT', 'PENDING_DELETE','REJECTED','REJECTED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CLOSE_REJECTED_DELETE', 'REJECTED','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'UPDATE', 'PENDING_UPDATE','ACTIVE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CHECKER_APPROVE_DELETE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'APPROVE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE','DELETED','DELETED', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'MAKER_SAVE', 'PENDING_PERFECTION','DRAFT','DRAFT', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CREATE', 'DRAFT','PENDING_CREATE','PENDING_CREATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'MAKER_UPDATE_SAVE', 'ACTIVE','DRAFT','DRAFT', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'UPDATE', 'DRAFT','PENDING_UPDATE','PENDING_UPDATE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'MAKER_UPDATE_CLOSE', 'DRAFT','ACTIVE','ACTIVE', 1, 1);
insert into TR_STATE_MATRIX (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP)
values((select max(stateid) + 1 from TR_STATE_MATRIX), 'LIMITS_OF_AUTHORITY',
'CREATE', 'PENDING_PERFECTION','DRAFT','DRAFT', 1, 1);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='EDIT_REJECTED_DELETE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_DELETE' AND USERSTATE='PENDING_DELETE')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_prepare_resubmit_delete'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='CREATE' and FROMSTATE ='PENDING_CREATE' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1005,'Process','LimitsOfAuthorityMaster.do?event=checker_process_create'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='REJECT' and FROMSTATE ='PENDING_UPDATE' AND TOSTATE='REJECTED' AND USERSTATE='REJECTED')
,1005,'Process','LimitsOfAuthorityMaster.do?event=checker_process_edit'||'&'||'TrxId=',null);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='EDIT_REJECTED_UPDATE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_UPDATE' AND USERSTATE='PENDING_UPDATE')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_prepare_resubmit_create'||'&'||'TrxId=',null);


insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='CLOSE_REJECTED_UPDATE' and FROMSTATE ='REJECTED' AND TOSTATE='ACTIVE' AND USERSTATE='ACTIVE')
,1004,'Close','LimitsOfAuthorityMaster.do?event=maker_prepare_close'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='EDIT_REJECTED_CREATE' and FROMSTATE ='REJECTED' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_prepare_resubmit_create'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='DELETE' and FROMSTATE ='PENDING_DELETE' AND TOSTATE='DELETED' AND USERSTATE='DELETED')
,1005,'Process','LimitsOfAuthorityMaster.do?event=checker_process_delete'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='UPDATE' and FROMSTATE ='PENDING_UPDATE' AND TOSTATE='ACTIVE' AND USERSTATE='PENDING_UPDATE')
,1005,'Process','LimitsOfAuthorityMaster.do?event=checker_process_edit'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='MAKER_SAVE' and FROMSTATE ='PENDING_PERFECTION' AND TOSTATE='DRAFT' AND USERSTATE='DRAFT')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='CREATE' and FROMSTATE ='DRAFT' AND TOSTATE='PENDING_CREATE' AND USERSTATE='PENDING_CREATE')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='UPDATE' and FROMSTATE ='DRAFT' AND TOSTATE='PENDING_UPDATE' AND USERSTATE='PENDING_UPDATE')
,1004,'Process','LimitsOfAuthorityMaster.do?event=maker_update_save_process'||'&'||'TrxId=',null);

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values((select stateid from TR_STATE_MATRIX where STATEINS ='LIMITS_OF_AUTHORITY' 
and OPERATION='MAKER_UPDATE_CLOSE' and FROMSTATE ='DRAFT' AND TOSTATE='ACTIVE' AND USERSTATE='ACTIVE')
,1004,'Close','LimitsOfAuthorityMaster.do?event=maker_draft_close_process'||'&'||'TrxId=',null);


Insert into COMMON_CODE_CATEGORY_ENTRY 
(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE,CATEGORY_CODE_ID,ENTRY_SOURCE,COUNTRY,GROUP_ID,
Ref_Entry_Code,Version_Time,Status,Creation_Date,Last_Update_Date,Cps_Id,Eod_Sync_Status,Ecbf_Id)
values ((select max(ENTRY_ID) + 1 from COMMON_CODE_CATEGORY_ENTRY),'RPT0083','LOA Master Report','1','REPORTS'
,(Select Category_Id From Common_Code_Category Where Category_Code = 'REPORTS' And Active_Status ='A' )
,null,'IN',null,null,0,null,null,null,null,'SUCCESSFUL',null);

Insert into COMMON_CODE_CATEGORY_ENTRY 
(ENTRY_ID,ENTRY_CODE,ENTRY_NAME,ACTIVE_STATUS,CATEGORY_CODE,CATEGORY_CODE_ID,ENTRY_SOURCE,COUNTRY,GROUP_ID,
Ref_Entry_Code,Version_Time,Status,Creation_Date,Last_Update_Date,Cps_Id,Eod_Sync_Status,Ecbf_Id)
values ((select max(ENTRY_ID) + 1 from COMMON_CODE_CATEGORY_ENTRY),'RPT0084','LOA Transaction Report','1','REPORTS'
,(Select Category_Id From Common_Code_Category Where Category_Code = 'REPORTS' And Active_Status ='A' )
,null,'IN',null,null,0,null,null,null,null,'SUCCESSFUL',null);