---------------------------------------
----  System Bank And Branches TO Track
---------------------------------------
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Holiday', 
    'REJECTED', NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Holiday', 
    'ND', NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'Maintain Holiday', 
    NULL, NULL);
Insert into CMS_TRX_TOTRACK
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, 
    FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('HOLIDAY', 'holiday.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DRAFT', 'Draft', 'Maintain Holiday', 
    NULL, NULL);


--------------------------------------------
--- System Bank And Branches Tr State Matrix
--------------------------------------------

Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10025, 'HOLIDAY', 'EDIT_REJECTED_DELETE_HOLIDAY', 'REJECTED', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10002, 'HOLIDAY', 'CREATE_HOLIDAY', 'PENDING_CREATE', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10013, 'HOLIDAY', 'APPROVE_HOLIDAY', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10014, 'HOLIDAY', 'UPDATE_HOLIDAY', 'ACTIVE', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10015, 'HOLIDAY', 'APPROVE_CREATE_HOLIDAY', 'PENDING_CREATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10004, 'HOLIDAY', 'REJECT_HOLIDAY', 'PENDING_UPDATE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10005, 'HOLIDAY', 'EDIT_REJECTED_UPDATE_HOLIDAY', 'REJECTED', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10016, 'HOLIDAY', 'CLOSE_REJECTED_CREATE_HOLIDAY', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10007, 'HOLIDAY', 'EDIT_REJECTED_CREATE_HOLIDAY', 'REJECTED', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10017, 'HOLIDAY', 'DELETE_HOLIDAY', 'ACTIVE', 'PENDING_DELETE', 
    'PENDING_DELETE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10001, 'HOLIDAY', 'DELETE_HOLIDAY', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10018, 'HOLIDAY', 'REJECT_HOLIDAY', 'PENDING_DELETE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10019, 'HOLIDAY', 'CLOSE_REJECTED_DELETE_HOLIDAY', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10003, 'HOLIDAY', 'UPDATE_HOLIDAY', 'PENDING_UPDATE', 'ACTIVE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10020, 'HOLIDAY', 'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10021, 'HOLIDAY', 'APPROVE_HOLIDAY', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10022, 'HOLIDAY', 'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10023, 'HOLIDAY', 'CREATE_HOLIDAY', 'ND', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10009, 'HOLIDAY', 'MAKER_SAVE', 'PENDING_PERFECTION', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10010, 'HOLIDAY', 'CREATE_HOLIDAY', 'DRAFT', 'PENDING_CREATE', 
    'PENDING_CREATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10024, 'HOLIDAY', 'MAKER_UPDATE_SAVE', 'ACTIVE', 'DRAFT', 
    'DRAFT', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10011, 'HOLIDAY', 'UPDATE_HOLIDAY', 'DRAFT', 'PENDING_UPDATE', 
    'PENDING_UPDATE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10012, 'HOLIDAY', 'MAKER_UPDATE_CLOSE', 'DRAFT', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10026, 'HOLIDAY', 'CLOSE_REJECTED_UPDATE_HOLIDAY', 'REJECTED', 'ACTIVE', 
    'ACTIVE', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10027, 'HOLIDAY', 'REJECT_HOLIDAY', 'PENDING_CREATE', 'REJECTED', 
    'REJECTED', '1', '1');
Insert into TR_STATE_MATRIX
   (STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, 
    USERSTATE, ENABLEIND, FRONTENDOP)
 Values
   (10028, 'HOLIDAY', 'CHECKER_APPROVE_DELETE', 'PENDING_DELETE', 'DELETED', 
    'DELETED', '1', '1');
----------------------------------------------
--- System Bank And Branch State Matrix Action
----------------------------------------------

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10001,7,'Process','holiday.do?event=checker_process_delete&TrxId=',null);8001

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10002,7,'Process','holiday.do?event=checker_process_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10003,7,'Process','holiday.do?event=checker_process_edit&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10004,7,'Process','holiday.do?event=checker_process_edit&TrxId=','holiday.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10005,6,'Process','holiday.do?event=maker_prepare_resubmit_create&TrxId=','holiday.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10026,6,'Close','holiday.do?event=maker_prepare_close&TrxId=','holiday.do?event=to_track&TrxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10007,6,'Process','holiday.do?event=maker_prepare_resubmit_create&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10025,6,'Process','holiday.do?event=maker_prepare_resubmit_delete&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10009,6,'Process','holiday.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10010,6,'Process','holiday.do?event=maker_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10011,6,'Process','holiday.do?event=maker_update_save_process&TrxId=',null);
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (10012,6,'Close','holiday.do?event=maker_draft_close_process&TrxId=',null);
------------------------------------------------------
---- System Bank And Branches Maintain Function Access
------------------------------------------------------
	Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000001, 'holiday', 'maker_list_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000002, 'holiday', 'maker_view_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000003, 'holiday', 'maker_edit_systemBankBranh_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000004, 'holiday', 'maker_edit_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000005, 'holiday', 'maker_delete_holiday_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000006, 'holiday', 'maker_search_list_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000007, 'holiday', 'list_pagination', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000008, 'holiday', 'checker_list_holiday', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000009, 'holiday', 'maker_view_holiday', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000010, 'holiday', 'maker_list_holiday', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000011, 'holiday', 'checker_edit_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000012, 'holiday', 'rejected_delete_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000013, 'holiday', 'checker_reject_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000014, 'holiday', 'maker_prepare_resubmit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000015, 'holiday', 'maker_prepare_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000016, 'holiday', 'maker_confirm_resubmit_edit', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000017, 'holiday', 'rejected_delete_read', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000018, 'holiday', 'maker_confirm_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000019, 'holiday', 'checker_view_holiday', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000020, 'holiday', 'checker_process_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000021, 'holiday', 'checker_process_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000022, 'holiday', 'maker_prepare_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000023, 'holiday', 'maker_confirm_resubmit_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000024, 'holiday', 'maker_prepare_close_delete', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000025, 'holiday', 'list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000026, 'holiday', 'checker_search_list_holiday', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000027, 'holiday', 'checker_list_pagination', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000028, 'holiday', 'maker_prepare_create_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000029, 'holiday', 'maker_create_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000030, 'holiday', 'checker_process_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000031, 'holiday', 'maker_prepare_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000032, 'holiday', 'maker_confirm_resubmit_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000033, 'holiday', 'checker_reject_delete', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000034, 'holiday', 'checker_reject_create', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000035, 'holiday', 'maker_draft_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000036, 'holiday', 'maker_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000037, 'holiday', 'maker_save_create', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000038, 'holiday', 'maker_update_save_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000039, 'holiday', 'maker_update_draft_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000040, 'holiday', 'maker_save_update', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000041, 'holiday', 'maker_draft_close_process', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000042, 'holiday', 'maker_confirm_draft_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000043, 'holiday', 'maker_delete_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000044, 'holiday', 'checker_approve_edit', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (70000045, 'holiday', 'maker_edit_holiday_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008009, 'holiday', 'maker_prepare_upload_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008010, 'holiday', 'maker_event_upload_holiday', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008011, 'holiday', 'checker_process_create_insert', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008012, 'holiday', 'maker_rejected_delete_read', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008013, 'holiday', 'checker_process_create_insert', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008014, 'holiday', 'checker_approve_insert', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008015, 'holiday', 'checker_reject_insert', 7);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008016, 'holiday', 'maker_prepare_insert_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008017, 'holiday', 'maker_confirm_insert_close', 6);
Insert into CMS_FUNCTION_ACCESS
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (16062008018, 'holiday', 'maker_rejected_delete_read', 7);

	


------------------------------------------------
-- DDL Statements for table "ABCLIMS "."CMS_HOLIDAY"
------------------------------------------------
 
CREATE TABLE cms_holiday (
  id               NUMBER(19,0)  NOT NULL,
  version_time     NUMBER(19,0)  NOT NULL,
  create_by        VARCHAR2(50)  NOT NULL,
  creation_date    TIMESTAMP(9)  NOT NULL,
  last_update_by   VARCHAR2(50)  NOT NULL,
  last_update_date TIMESTAMP(9)  NOT NULL,
  deprecated       CHAR(1)       NOT NULL,
  status           VARCHAR2(20)  NOT NULL,
  description      VARCHAR2(300) NOT NULL,
  start_date       TIMESTAMP(9)  NOT NULL,
  end_date         TIMESTAMP(9)  NOT NULL,
  is_recurrent     VARCHAR2(50)  NULL
)
  LOGGING
/


GRANT DELETE,INSERT,REFERENCES,SELECT,UPDATE ON cms_holiday TO PUBLIC;



CREATE TABLE cms_stage_holiday (
  id               NUMBER(19,0)  NOT NULL,
  version_time     NUMBER(19,0)  NOT NULL,
  create_by        VARCHAR2(50)  NOT NULL,
  creation_date    TIMESTAMP(9)  NOT NULL,
  last_update_by   VARCHAR2(50)  NOT NULL,
  last_update_date TIMESTAMP(9)  NOT NULL,
  deprecated       CHAR(1)       NOT NULL,
  status           VARCHAR2(20)  NOT NULL,
  description      VARCHAR2(300) NOT NULL,
  start_date       TIMESTAMP(9)  NOT NULL,
  end_date         TIMESTAMP(9)  NOT NULL,
  is_recurrent     VARCHAR2(50)  NULL
)
  LOGGING
/


GRANT DELETE,INSERT,REFERENCES,SELECT,UPDATE ON cms_holiday TO PUBLIC;

