/*********************************************************************
 COMMON CODE PARAMETER CODE ENTRY
*********************************************************************/
------------------------------------------------------
-- CMS function access profile 
------------------------------------------------------
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300001, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_read', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300002, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_edit', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300003, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_edit_paginate', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300004, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_add', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300005, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_update', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300006, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_update_rejected', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300007, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_close', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300008, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_close_paginate', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300009, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_prepare_close', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300010, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_edit_rejected', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300011, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_rejected_paginate', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300012, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_add_rejected', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300013, 'MaintainCommonCodeParameters', 'to_track_paginate', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300014, 'MaintainCommonCodeParameters', 'to_track', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300015, 'MaintainCommonCodeParameters', 'wip', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300024, 'MaintainCommonCodeParameters', 'add_return', 6); 

INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300016, 'MaintainCommonCodeParameters', 'checker_process', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300017, 'MaintainCommonCodeParameters', 'checker_approve', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300018, 'MaintainCommonCodeParameters', 'checker_reject', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300019, 'MaintainCommonCodeParameters', 'checker_process_paginate', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300020, 'MaintainCommonCodeParameters', 'to_track_paginate', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300021, 'MaintainCommonCodeParameters', 'to_track', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300022, 'MaintainCommonCodeParameters', 'maker_edit_common_code_params_read', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19300023, 'MaintainCommonCodeParameters', 'read', 7); 


------------------------------------------------------
-- Transaction state matrix table 
------------------------------------------------------
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4300, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE' , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4301, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4302, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4303, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4304, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_CLOSE', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE, ENABLEIND, FRONTENDOP ) VALUES ( 4305, 'COMMON_CODE_ENTRY', 'COMMON_CODE_ENTRY_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 

------------------------------------------------------
-- CMS transaction to track 
------------------------------------------------------
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain Common Code Parameters', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Common Code Parameters', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Common Code Parameters', 'PENDING_UPDATE', NULL);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Common Code Parameters', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'CLOSED', 'Closed', 'Maintain Common Code Parameters', null, null);
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_ENTRY', 'MaintainCommonCodeParameters.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Common Code Parameters', null, null);  
    
	
	
------------------------------------------------------
-- CMS State matrix action
------------------------------------------------------
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4300, 7, 'Process', 'MaintainCommonCodeParameters.do?event=checker_process&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4302, 7, 'Process', 'MaintainCommonCodeParameters.do?event=checker_process&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4305, 6, 'Process', 'MaintainCommonCodeParameters.do?event=maker_edit_common_code_params_edit_rejected&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4304, 6, 'Close', 'MaintainCommonCodeParameters.do?event=maker_edit_common_code_params_prepare_close&TrxId=', NULL); 



/*********************************************************************
 COMMON CODE PARAMETER CODE CATEGORY
*********************************************************************/
------------------------------------------------------
-- 1 Insert for Function Access
------------------------------------------------------
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200002, 'MaintainCommonCodeTypes', 'maker_edit_common_code_type', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200003, 'MaintainCommonCodeTypes', 'checker_edit_redirect_read', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200004, 'MaintainCommonCodeTypes', 'checker_edit_read', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200005, 'MaintainCommonCodeTypes', 'maker_close_common_code_type', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200006, 'MaintainCommonCodeTypes', 'checker_approve_edit', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200007, 'MaintainCommonCodeTypes', 'checker_reject_edit', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200008, 'MaintainCommonCodeTypes', 'maker_cncl_reject_edit', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200009, 'MaintainCommonCodeTypes', 'maker_edit_reject_edit', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200010, 'MaintainCommonCodeTypes', 'maker_view', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200011, 'MaintainCommonCodeTypes', 'checker_view', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200012, 'MaintainCommonCodeTypes', 'maker_edit_common_code_type_read_rejected', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200013, 'MaintainCommonCodeTypes', 'to_track', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200014, 'MaintainCommonCodeTypes', 'to_track', 7); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200015, 'MaintainCommonCodeTypes', 'maker_close_redirect_common_code_type', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200016, 'MaintainCommonCodeTypes', 'maker_edit_common_code_type_redirect_read_rejected', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200001, 'MaintainCommonCodeTypes', 'maker_edit_common_code_type_read', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200020, 'MaintainCommonCodeTypes', 'view', 26); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200021, 'MaintainCommonCodeTypes', 'view', 14); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200022, 'MaintainCommonCodeTypes', 'view', 15); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200023, 'MaintainCommonCodeTypes', 'view', 27); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200024, 'MaintainCommonCodeTypes', 'prepare_create_type_item', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200025, 'MaintainCommonCodeTypes', 'maker_list_common_code_type', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200026, 'MaintainCommonCodeTypes', 'create_common_code_type', 6); 
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200027, 'MaintainCommonCodeTypes', 'process', 7);     
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES ( 19200028, 'MaintainCommonCodeTypes', 'maker_list_common_code_type', 7);
    
    
------------------------------------------------------
-- 2 Transaction State Matrix
------------------------------------------------------
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4200, 'COMMON_CODE_TYPE', 'CREATE_COMMON_CODE_TYPE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4201, 'COMMON_CODE_TYPE', 'APPROVE_CREATE_COMMON_CODE_TYPE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4202, 'COMMON_CODE_TYPE', 'REJECT_COMMON_CODE_TYPE', 'PENDING_CREATE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4203, 'COMMON_CODE_TYPE', 'CLOSE_REJECTED_CREATE_COMMON_CODE_TYPE', 'REJECTED', 'CLOSED', 'CLOSED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4204, 'COMMON_CODE_TYPE', 'EDIT_REJECTED_CREATE_COMMON_CODE_TYPE', 'REJECTED', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4205, 'COMMON_CODE_TYPE', 'UPDATE_COMMON_CODE_TYPE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4206, 'COMMON_CODE_TYPE', 'APPROVE_UPDATE_COMMON_CODE_TYPE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4207, 'COMMON_CODE_TYPE', 'REJECT_COMMON_CODE_TYPE', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4208, 'COMMON_CODE_TYPE', 'EDIT_REJECTED_UPDATE_COMMON_CODE_TYPE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4209, 'COMMON_CODE_TYPE', 'CLOSE_REJECTED_UPDATE_COMMON_CODE_TYPE', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');     
    

------------------------------------------------------
-- 3 CMS Transaction To Track
------------------------------------------------------
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_TYPE', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Common Code Type', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_TYPE', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Common Code Type', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_TYPE', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=', 'ACTIVE', 'Approved', 'Maintain Common Code Type', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_TYPE', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=', 'CLOSED', 'Closed', 'Maintain Common Code Type', NULL, NULL);  
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'COMMON_CODE_TYPE', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=', 'REJECTED', 'Rejected', 'Maintain Common Code Type', NULL, NULL); 


------------------------------------------------------
-- 4 CMS State Matrix Action
------------------------------------------------------
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4202, 7, 'Process', 'MaintainCommonCodeTypes.do?event=process&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4203, 6, 'Close', 'MaintainCommonCodeTypes.do?event=maker_close_common_code_type&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4204, 6, 'Process', 'MaintainCommonCodeTypes.do?event=maker_edit_common_code_type_read_rejected&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4206, 7, 'Process', 'MaintainCommonCodeTypes.do?event=process&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4208, 6, 'Process', 'MaintainCommonCodeTypes.do?event=maker_edit_common_code_type_read_rejected&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL,TOTRACK_URL ) VALUES ( 4209, 6, 'Close', 'MaintainCommonCodeTypes.do?event=maker_close_common_code_type&transactionId=', 'MaintainCommonCodeTypes.do?event=to_track&transactionId=');  

