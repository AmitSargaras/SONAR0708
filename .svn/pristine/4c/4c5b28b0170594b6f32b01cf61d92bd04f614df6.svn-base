---------------------------------------
----  COLLATERAL TO Track
---------------------------------------
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'Maintain Collateral New Master', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('COLLATERAL_MASTER', 'collateralNewMaster.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DRAFT', 'Draft', 'Maintain Collateral New Master', 
    NULL, NULL);

--------------------------------------------
--- COLLATERAL Tr State Matrix
--------------------------------------------
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900023, 'COLLATERAL_MASTER', 'CREATE_COLLATERAL_NEW_MASTER', 'ND', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900009, 'COLLATERAL_MASTER', 'MAKER_SAVE', 'PENDING_PERFECTION', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900010, 'COLLATERAL_MASTER', 'CREATE_COLLATERAL_NEW_MASTER', 'DRAFT', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900024, 'COLLATERAL_MASTER', 'MAKER_UPDATE_SAVE', 'ACTIVE', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900011, 'COLLATERAL_MASTER', 'UPDATE_COLLATERAL_NEW_MASTER', 'DRAFT', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900012, 'COLLATERAL_MASTER', 'MAKER_UPDATE_CLOSE', 'DRAFT', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900025, 'COLLATERAL_MASTER', 'EDIT_REJECTED_DELETE_COLLATERAL_NEW_MASTER', 'REJECTED', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900002, 'COLLATERAL_MASTER', 'CREATE_COLLATERAL_NEW_MASTER', 'PENDING_CREATE', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900013, 'COLLATERAL_MASTER', 'APPROVE_COLLATERAL_NEW_MASTER', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900014, 'COLLATERAL_MASTER', 'UPDATE_COLLATERAL_NEW_MASTER', 'ACTIVE', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900015, 'COLLATERAL_MASTER', 'APPROVE_CREATE_COLLATERAL_NEW_MASTER', 'PENDING_CREATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900004, 'COLLATERAL_MASTER', 'REJECT_COLLATERAL_NEW_MASTER', 'PENDING_UPDATE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900005, 'COLLATERAL_MASTER', 'EDIT_REJECTED_UPDATE_COLLATERAL_NEW_MASTER', 'REJECTED', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900026, 'COLLATERAL_MASTER', 'CLOSE_REJECTED_UPDATE_COLLATERAL_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900016, 'COLLATERAL_MASTER', 'CLOSE_REJECTED_CREATE_COLLATERAL_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900007, 'COLLATERAL_MASTER', 'EDIT_REJECTED_CREATE_COLLATERAL_NEW_MASTER', 'REJECTED', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900017, 'COLLATERAL_MASTER', 'DELETE_COLLATERAL_NEW_MASTER', 'ACTIVE', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900001, 'COLLATERAL_MASTER', 'DELETE_COLLATERAL_NEW_MASTER', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900018, 'COLLATERAL_MASTER', 'REJECT_COLLATERAL_NEW_MASTER', 'PENDING_DELETE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900019, 'COLLATERAL_MASTER', 'CLOSE_REJECTED_DELETE_COLLATERAL_NEW_MASTER', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900003, 'COLLATERAL_MASTER', 'UPDATE_COLLATERAL_NEW_MASTER', 'PENDING_UPDATE', 'ACTIVE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900020, 'COLLATERAL_MASTER', 'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900021, 'COLLATERAL_MASTER', 'APPROVE_COLLATERAL_NEW_MASTER', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900022, 'COLLATERAL_MASTER', 'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
    
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (900023, 'COLLATERAL_MASTER', 'REJECT_COLLATERAL_NEW_MASTER', 'PENDING_CREATE', 'REJECTED', 
    'REJECTED', '1', '1');    
----------------------------------------------
---COLLATERAL State Matrix Action
----------------------------------------------

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900001,7,'Process','collateralNewMaster.do?event=checker_process_delete&TrxId=',null);8001

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900002,7,'Process','collateralNewMaster.do?event=checker_process_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900003,7,'Process','collateralNewMaster.do?event=checker_process_edit&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900004,7,'Process','collateralNewMaster.do?event=checker_process_edit&TrxId=','collateralNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900005,6,'Process','collateralNewMaster.do?event=maker_prepare_resubmit_create&TrxId=','collateralNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900026,6,'Close','collateralNewMaster.do?event=maker_prepare_close&TrxId=','collateralNewMaster.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900007,6,'Process','collateralNewMaster.do?event=maker_prepare_resubmit_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900025,6,'Process','collateralNewMaster.do?event=maker_prepare_resubmit_delete&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900009,6,'Process','collateralNewMaster.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900010,6,'Process','collateralNewMaster.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900011,6,'Process','collateralNewMaster.do?event=maker_update_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (900012,6,'Close','collateralNewMaster.do?event=maker_draft_close_process&TrxId=',null);
------------------------------------------------------
---- COLLATERAL Maintain Function Access
------------------------------------------------------
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000001, 'collateralNewMaster', 'maker_list_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000002, 'collateralNewMaster', 'maker_view_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000043, 'collateralNewMaster', 'maker_delete_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000004, 'collateralNewMaster', 'maker_edit_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000005, 'collateralNewMaster', 'maker_delete_collateralNewMaster_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000006, 'collateralNewMaster', 'maker_search_list_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000007, 'collateralNewMaster', 'list_pagination', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000008, 'collateralNewMaster', 'checker_list_collateralNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000009, 'collateralNewMaster', 'maker_view_collateralNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000010, 'collateralNewMaster', 'maker_list_collateralNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000011, 'collateralNewMaster', 'checker_edit_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000044, 'collateralNewMaster', 'checker_approve_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000012, 'collateralNewMaster', 'rejected_delete_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000013, 'collateralNewMaster', 'checker_reject_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000014, 'collateralNewMaster', 'maker_prepare_resubmit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000015, 'collateralNewMaster', 'maker_prepare_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000016, 'collateralNewMaster', 'maker_confirm_resubmit_edit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000017, 'collateralNewMaster', 'rejected_delete_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000018, 'collateralNewMaster', 'maker_confirm_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000019, 'collateralNewMaster', 'checker_view_collateralNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000020, 'collateralNewMaster', 'checker_process_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000021, 'collateralNewMaster', 'checker_process_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000022, 'collateralNewMaster', 'maker_prepare_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000023, 'collateralNewMaster', 'maker_confirm_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000024, 'collateralNewMaster', 'maker_prepare_close_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000025, 'collateralNewMaster', 'list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000026, 'collateralNewMaster', 'checker_search_list_collateralNewMaster', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000027, 'collateralNewMaster', 'checker_list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000028, 'collateralNewMaster', 'maker_prepare_create_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000029, 'collateralNewMaster', 'maker_create_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000030, 'collateralNewMaster', 'checker_process_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000031, 'collateralNewMaster', 'maker_prepare_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000032, 'collateralNewMaster', 'maker_confirm_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000033, 'collateralNewMaster', 'checker_reject_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000034, 'collateralNewMaster', 'checker_reject_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000035, 'collateralNewMaster', 'maker_draft_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000036, 'collateralNewMaster', 'maker_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000037, 'collateralNewMaster', 'maker_save_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000038, 'collateralNewMaster', 'maker_update_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000039, 'collateralNewMaster', 'maker_update_draft_collateralNewMaster', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000040, 'collateralNewMaster', 'maker_save_update', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000041, 'collateralNewMaster', 'maker_draft_close_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000042, 'collateralNewMaster', 'maker_confirm_draft_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000045, 'collateralNewMaster', 'maker_edit_collateralNewMaster_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (910000046, 'collateralNewMaster', 'paginate', 6);
	
	
	


------------------------------------------------
-- DDL Statements for table 'ABCLIMS '.'CMS_COLLATERAL_NEW_MASTER'
------------------------------------------------
 


CREATE TABLE cms_collateral_new_master (
  id                          NUMBER(38,0)  NOT NULL,
  version_time                NUMBER(38,0)  NULL,
  create_by                   VARCHAR2(50)  NULL,
  creation_date               DATE          NULL,
  last_update_by              VARCHAR2(50)  NULL,
  last_update_date            DATE          NULL,
  deprecated                  CHAR(1)       NULL,
  status                      VARCHAR2(20)  NULL,
  new_collateral_code         VARCHAR2(300) NULL,
  new_collateral_main_type    VARCHAR2(300) NULL,
  new_collateral_sub_type     VARCHAR2(300) NULL,
  new_collateral_description  VARCHAR2(300) NULL,
  insurance                   VARCHAR2(300) NULL,
  revaluation_frequency_count NUMBER(10,0)  NULL,
  revaluation_frequency_days  VARCHAR2(50)  NOT NULL
)

		 
CREATE TABLE cms_stage_collateral_new_master (
  id                          NUMBER(38,0)  NOT NULL,
  version_time                NUMBER(38,0)  NULL,
  create_by                   VARCHAR2(50)  NULL,
  creation_date               DATE          NULL,
  last_update_by              VARCHAR2(50)  NULL,
  last_update_date            DATE          NULL,
  deprecated                  CHAR(1)       NULL,
  status                      VARCHAR2(20)  NULL,
  new_collateral_code         VARCHAR2(300) NULL,
  new_collateral_main_type    VARCHAR2(300) NULL,
  new_collateral_sub_type     VARCHAR2(300) NULL,
  new_collateral_description  VARCHAR2(300) NULL,
  insurance                   VARCHAR2(300) NULL,
  revaluation_frequency_count NUMBER(10,0)  NULL,
  revaluation_frequency_days  VARCHAR2(50)  NOT NULL
)
