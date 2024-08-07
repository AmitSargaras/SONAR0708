---------------------------------------
----  FACILITY TO Track
---------------------------------------
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'Maintain FacilityNewMaster', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('FACILITY_NEW_MASTER', 'facilityNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DRAFT', 'Draft', 'Maintain FacilityNewMaster', 
    NULL, NULL);


--------------------------------------------
--- FACILITY Tr State Matrix
--------------------------------------------

Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800025, 'FACILITY_NEW_MASTER', 'EDIT_REJECTED_DELETE_FACILITY_NEW_MASTER', 'REJECTED', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800002, 'FACILITY_NEW_MASTER', 'CREATE_FACILITY_NEW_MASTER', 'PENDING_CREATE', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800013, 'FACILITY_NEW_MASTER', 'APPROVE_FACILITY_NEW_MASTER', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800014, 'FACILITY_NEW_MASTER', 'UPDATE_FACILITY_NEW_MASTER', 'ACTIVE', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800015, 'FACILITY_NEW_MASTER', 'APPROVE_CREATE_FACILITY_NEW_MASTER', 'PENDING_CREATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800004, 'FACILITY_NEW_MASTER', 'REJECT_FACILITY_NEW_MASTER', 'PENDING_UPDATE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800005, 'FACILITY_NEW_MASTER', 'EDIT_REJECTED_UPDATE_FACILITY_NEW_MASTER', 'REJECTED', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800016, 'FACILITY_NEW_MASTER', 'CLOSE_REJECTED_CREATE_FACILITY_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800007, 'FACILITY_NEW_MASTER', 'EDIT_REJECTED_CREATE_FACILITY_NEW_MASTER', 'REJECTED', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800017, 'FACILITY_NEW_MASTER', 'DELETE_FACILITY_NEW_MASTER', 'ACTIVE', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800001, 'FACILITY_NEW_MASTER', 'DELETE_FACILITY_NEW_MASTER', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800018, 'FACILITY_NEW_MASTER', 'REJECT_FACILITY_NEW_MASTER', 'PENDING_DELETE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800019, 'FACILITY_NEW_MASTER', 'CLOSE_REJECTED_DELETE_FACILITY_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800003, 'FACILITY_NEW_MASTER', 'UPDATE_FACILITY_NEW_MASTER', 'PENDING_UPDATE', 'ACTIVE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800020, 'FACILITY_NEW_MASTER', 'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800021, 'FACILITY_NEW_MASTER', 'APPROVE_FACILITY_NEW_MASTER', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800022, 'FACILITY_NEW_MASTER', 'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800023, 'FACILITY_NEW_MASTER', 'CREATE_FACILITY_NEW_MASTER', 'ND', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800009, 'FACILITY_NEW_MASTER', 'MAKER_SAVE', 'PENDING_PERFECTION', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800010, 'FACILITY_NEW_MASTER', 'CREATE_FACILITY_NEW_MASTER', 'DRAFT', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800024, 'FACILITY_NEW_MASTER', 'MAKER_UPDATE_SAVE', 'ACTIVE', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800011, 'FACILITY_NEW_MASTER', 'UPDATE_FACILITY_NEW_MASTER', 'DRAFT', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800012, 'FACILITY_NEW_MASTER', 'MAKER_UPDATE_CLOSE', 'DRAFT', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800028, 'FACILITY_NEW_MASTER', 'CHECKER_APPROVE_DELETE', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800026, 'FACILITY_NEW_MASTER', 'CLOSE_REJECTED_UPDATE_FACILITY_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');

Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (800018, 'FACILITY_NEW_MASTER', 'REJECT_FACILITY_NEW_MASTER', 'PENDING_CREATE', 'REJECTED', 
    'REJECTED', '1', '1');    
----------------------------------------------
---FACILITY State Matrix Action
----------------------------------------------

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800001,7,'Process','facilityNewMaster.do?event=checker_process_delete&TrxId=',null);8001

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800002,7,'Process','facilityNewMaster.do?event=checker_process_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800003,7,'Process','facilityNewMaster.do?event=checker_process_edit&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800004,7,'Process','facilityNewMaster.do?event=checker_process_edit&TrxId=','facilityNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800005,6,'Process','facilityNewMaster.do?event=maker_prepare_resubmit_create&TrxId=','facilityNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800026,6,'Close','facilityNewMaster.do?event=maker_prepare_close&TrxId=','facilityNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800007,6,'Process','facilityNewMaster.do?event=maker_prepare_resubmit_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800025,6,'Process','facilityNewMaster.do?event=maker_prepare_resubmit_delete&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800009,6,'Process','facilityNewMaster.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800010,6,'Process','facilityNewMaster.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800011,6,'Process','facilityNewMaster.do?event=maker_update_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (800012,6,'Close','facilityNewMaster.do?event=maker_draft_close_process&TrxId=',null);
------------------------------------------------------
---- FACILITY Maintain Function Access
------------------------------------------------------
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000043, 'facilityNewMaster', 'maker_delete_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000001, 'facilityNewMaster', 'maker_list_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000002, 'facilityNewMaster', 'maker_view_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000004, 'facilityNewMaster', 'maker_edit_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000005, 'facilityNewMaster', 'maker_delete_facilityNewMaster_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000006, 'facilityNewMaster', 'maker_search_list_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000007, 'facilityNewMaster', 'list_pagination', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000008, 'facilityNewMaster', 'checker_list_facilityNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000009, 'facilityNewMaster', 'maker_view_facilityNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000010, 'facilityNewMaster', 'maker_list_facilityNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000011, 'facilityNewMaster', 'checker_edit_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000044, 'facilityNewMaster', 'checker_approve_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000012, 'facilityNewMaster', 'rejected_delete_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000013, 'facilityNewMaster', 'checker_reject_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000014, 'facilityNewMaster', 'maker_prepare_resubmit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000015, 'facilityNewMaster', 'maker_prepare_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000016, 'facilityNewMaster', 'maker_confirm_resubmit_edit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000017, 'facilityNewMaster', 'rejected_delete_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000018, 'facilityNewMaster', 'maker_confirm_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000019, 'facilityNewMaster', 'checker_view_facilityNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000020, 'facilityNewMaster', 'checker_process_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000021, 'facilityNewMaster', 'checker_process_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000022, 'facilityNewMaster', 'maker_prepare_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000023, 'facilityNewMaster', 'maker_confirm_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000024, 'facilityNewMaster', 'maker_prepare_close_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000025, 'facilityNewMaster', 'list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000026, 'facilityNewMaster', 'checker_search_list_facilityNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000027, 'facilityNewMaster', 'checker_list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000028, 'facilityNewMaster', 'maker_prepare_create_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000029, 'facilityNewMaster', 'maker_create_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000030, 'facilityNewMaster', 'checker_process_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000031, 'facilityNewMaster', 'maker_prepare_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000032, 'facilityNewMaster', 'maker_confirm_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000033, 'facilityNewMaster', 'checker_reject_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000034, 'facilityNewMaster', 'checker_reject_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000035, 'facilityNewMaster', 'maker_draft_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000036, 'facilityNewMaster', 'maker_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000037, 'facilityNewMaster', 'maker_save_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000038, 'facilityNewMaster', 'maker_update_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000039, 'facilityNewMaster', 'maker_update_draft_facilityNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000040, 'facilityNewMaster', 'maker_save_update', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000041, 'facilityNewMaster', 'maker_draft_close_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000042, 'facilityNewMaster', 'maker_confirm_draft_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (800000045, 'facilityNewMaster', 'maker_edit_facilityNewMaster_read', 6);
	
	
	


------------------------------------------------
-- DDL Statements for table 'ABCLIMS '.'CMS_FACILITY_NEW_MASTER'
------------------------------------------------
 


CREATE TABLE cms_facility_new_master (
  id                    NUMBER(38,0)  NOT NULL,
  version_time          NUMBER(38,0)  NULL,
  create_by             VARCHAR2(50)  NULL,
  creation_date         DATE          NULL,
  last_update_by        VARCHAR2(50)  NULL,
  last_update_date      DATE          NULL,
  deprecated            CHAR(1)       NULL,
  status                VARCHAR2(20)  NULL,
  new_facility_code     VARCHAR2(300) NULL,
  new_facility_name     VARCHAR2(300) NULL,
  new_facility_type     VARCHAR2(300) NULL,
  new_facility_category VARCHAR2(300) NULL,
  new_facility_system   VARCHAR2(300) NULL,
  line_number           VARCHAR2(300) NULL,
  purpose               VARCHAR2(300) NULL,
  weightage             NUMBER(5,2)  NULL
)


CREATE TABLE cms_stage_facility_new_master (
  id                    NUMBER(38,0)  NOT NULL,
  version_time          NUMBER(38,0)  NULL,
  create_by             VARCHAR2(50)  NULL,
  creation_date         DATE          NULL,
  last_update_by        VARCHAR2(50)  NULL,
  last_update_date      DATE          NULL,
  deprecated            CHAR(1)       NULL,
  status                VARCHAR2(20)  NULL,
  new_facility_code     VARCHAR2(300) NULL,
  new_facility_name     VARCHAR2(300) NULL,
  new_facility_type     VARCHAR2(300) NULL,
  new_facility_category VARCHAR2(300) NULL,
  new_facility_system   VARCHAR2(300) NULL,
  line_number           VARCHAR2(300) NULL,
  purpose               VARCHAR2(300) NULL,
  weightage             NUMBER(5,2)  NULL
)

