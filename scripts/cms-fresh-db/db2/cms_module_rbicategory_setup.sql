
---------------------------------------------------
--insert script for Rbi Category Function Access
---------------------------------------------------

INSERT INTO cms_function_access (ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690001, 'rbi_category', 'get_list_rbi_category_page', '6');
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690002, 'rbi_category', 'maker_list_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690003, 'rbi_category', 'maker_view_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690004, 'rbi_category', 'maker_edit_rbi_category_read', '6');
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690007, 'rbi_category', 'maker_delete_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690008, 'rbi_category', 'maker_edit_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690009, 'rbi_category', 'maker_delete_rbi_category_read', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690010, 'rbi_category', 'maker_search_list_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690011, 'rbi_category', 'list_pagination', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690022, 'rbi_category', 'checker_list_rbi_category', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690023, 'rbi_category', 'maker_view_rbi_category', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690026, 'rbi_category', 'maker_list_rbi_category', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690027, 'rbi_category', 'checker_edit_read', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690028, 'rbi_category', 'checker_approve_edit', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690029, 'rbi_category', 'rejected_delete_read', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690030, 'rbi_category', 'checker_reject_edit', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690031, 'rbi_category', 'maker_prepare_resubmit', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690032, 'rbi_category', 'maker_prepare_close', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690033, 'rbi_category', 'maker_confirm_resubmit_edit', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690034, 'rbi_category', 'rejected_delete_read', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690035, 'rbi_category', 'maker_confirm_close', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690036, 'rbi_category', 'checker_view_rbi_category', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690037, 'rbi_category', 'checker_process_edit', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690038, 'rbi_category', 'checker_process_delete', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690039, 'rbi_category', 'maker_prepare_resubmit_delete', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690040, 'rbi_category', 'maker_confirm_resubmit_delete', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690041, 'rbi_category', 'maker_prepare_close_delete', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690042, 'rbi_category', 'list_pagination', '7');
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690043, 'rbi_category', 'checker_search_list_rbi_category', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690044, 'rbi_category', 'checker_list_pagination', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690046, 'rbi_category', 'maker_create_rbi_category', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690047, 'rbi_category', 'checker_process_create', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690048, 'rbi_category', 'maker_prepare_resubmit_create', '6'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690049, 'rbi_category', 'maker_confirm_resubmit_create', '6');
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690050, 'rbi_category', 'checker_reject_delete', '7'); 
INSERT INTO cms_function_access(ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690051, 'rbi_category', 'checker_reject_create', '7');  
INSERT INTO cms_function_access (ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690061, 'rbi_category', 'redirect_list_rbi_category', '6')
INSERT INTO cms_function_access (ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690062, 'rbi_category', 'maker_list_rbi_category_page', '6')
INSERT INTO cms_function_access (ID , ACTION , EVENT , ROLE_TYPE ) VALUES
(690063, 'rbi_category', 'maker_prepare_create_rbi_category', '6')

---------------------------------------
--- Credit Approval  TO Track
---------------------------------------
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'RBI Category', 'REJECTED', null);
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'RBI Category', 'ND', null);
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'RBI Category', null, null); 
INSERT INTO CMS_TRX_TOTRACK(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE) VALUES
('RBI_CATEGORY', 'rbi_category.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'RBI Category', null, null);

--------------------------------------------
--- Credit Approval Tr State Matrix
--------------------------------------------
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9301, 'RBI_CATEGORY', 'EDIT_REJECTED_DELETE_RBI_CATEGORY', 'REJECTED', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9302, 'RBI_CATEGORY', 'CREATE_RBI_CATEGORY', 'PENDING_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9303, 'RBI_CATEGORY', 'APPROVE_RBI_CATEGORY', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9304, 'RBI_CATEGORY', 'UPDATE_RBI_CATEGORY', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9305, 'RBI_CATEGORY', 'APPROVE_CREATE_RBI_CATEGORY', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9306, 'RBI_CATEGORY', 'REJECT_RBI_CATEGORY', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9307, 'RBI_CATEGORY', 'EDIT_REJECTED_UPDATE_RBI_CATEGORY', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9308, 'RBI_CATEGORY', 'CLOSE_REJECTED_UPDATE_RBI_CATEGORY', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9309, 'RBI_CATEGORY', 'REJECT_RBI_CATEGORY', 'PENDING_CREATE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9310, 'RBI_CATEGORY', 'CLOSE_REJECTED_CREATE_RBI_CATEGORY', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9311, 'RBI_CATEGORY', 'EDIT_REJECTED_CREATE_RBI_CATEGORY', 'REJECTED', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9312, 'RBI_CATEGORY', 'DELETE_RBI_CATEGORY', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9313, 'RBI_CATEGORY', 'DELETE_RBI_CATEGORY', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9314, 'RBI_CATEGORY', 'REJECT_RBI_CATEGORY', 'PENDING_DELETE', 'REJECTED', 'REJECTED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9315, 'RBI_CATEGORY', 'CLOSE_REJECTED_DELETE_RBI_CATEGORY', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9316, 'RBI_CATEGORY', 'UPDATE_RBI_CATEGORY', 'PENDING_UPDATE', 'ACTIVE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9317, 'RBI_CATEGORY', 'CHECKER_APPROVE_UPDATE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9318, 'RBI_CATEGORY', 'CHECKER_APPROVE_DELETE', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1');
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9319, 'RBI_CATEGORY', 'APPROVE_RBI_CATEGORY', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9320, 'RBI_CATEGORY', 'CHECKER_APPROVE_UPDATE', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9321, 'RBI_CATEGORY', 'CREATE_RBI_CATEGORY', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX (STATEID , STATEINS , OPERATION , FROMSTATE , TOSTATE , USERSTATE , ENABLEIND , FRONTENDOP ) VALUES
(9327, 'RBI_CATEGORY', 'UPDATE_RBI_CATEGORY', 'ACTIVE', 'REJECTED', 'PENDING_UPDATE', '1', '1'); 


----------------------------------------------
--- Credit Approval State Matrix Action
----------------------------------------------
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9313, 7, 'Process', 'rbi_category.do?event=checker_process_delete&TrxId=', null); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9302, 7, 'Process', 'rbi_category.do?event=checker_process_create&TrxId=', null); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9316, 7, 'Process', 'rbi_category.do?event=checker_process_edit&TrxId=', null); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9306, 7, 'Process', 'rbi_category.do?event=checker_process_edit&TrxId=', 'rbi_category.do?event=to_track&TrxId='); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9307, 6, 'Process', 'rbi_category.do?event=maker_prepare_resubmit_edit&TrxId=', 'rbi_category.do?event=to_track&TrxId='); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9308, 6, 'Close', 'rbi_category.do?event=maker_prepare_close&TrxId=', 'rbi_category.do?event=to_track&TrxId='); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9311, 6, 'Process', 'rbi_category.do?event=maker_prepare_resubmit&TrxId=', null); 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL) VALUES
(9301, 6, 'Process', 'rbi_category.do?event=maker_prepare_resubmit_delete&TrxId=', null); 

