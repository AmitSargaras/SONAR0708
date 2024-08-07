-- Create transaction state matrix for liquidation module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500001, 'Liquidation', 'checker_view', 11);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500002, 'Liquidation', 'maker_edit_reject_confirm', 10);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500003, 'Liquidation', 'prepare', 11);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500004, 'Liquidation', 'view', 11);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500005, 'Liquidation', 'view', 10);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500006, 'Liquidation', 'to_track', 11);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500007, 'Liquidation', 'to_track', 10);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500008, 'Liquidation', 'maker_edit_liquidation_reject', 10);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500009, 'Liquidation', 'maker_close_liquidation_confirm', 10);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500010, 'Liquidation', 'checker_reject_edit_liquidation', 11);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500011, 'Liquidation', 'checker_approve_edit_liquidation', 11);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500012, 'Liquidation', 'checker_edit_liquidation', 11);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500013, 'Liquidation', 'maker_close_liquidation', 10);                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500014, 'Liquidation', 'maker_edit_liquidation_confirm', 10);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500015, 'Liquidation', 'list', 10);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500016, 'Liquidation', 'prepare', 10);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500017, 'Liquidation', 'view_npl_info', 10);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500018, 'Liquidation', 'view_npl_info', 11);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500019, 'Liquidation', 'remove_recovery_expense', 10);                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500020, 'Liquidation', 'remove_recovery_income', 10);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500021, 'Liquidation', 'prepare_recovery_add_income', 10);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500022, 'Liquidation', 'prepare_recovery_add_expense', 10);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500023, 'Liquidation', 'view_recovery_income', 10);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500024, 'Liquidation', 'view_recovery_expense', 10);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500025, 'Liquidation', 'view_recovery_income', 11);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500026, 'Liquidation', 'view_recovery_expense', 11);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500027, 'Liquidation', 'edit_recovery_income', 10);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500028, 'Liquidation', 'edit_recovery_expense', 10);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500029, 'Liquidation', 'prepare_edit_recovery_income', 10);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500030, 'Liquidation', 'prepare_edit_recovery_expense', 10);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500031, 'Liquidation', 'add_recovery_income', 10);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500032, 'Liquidation', 'add_recovery_expense', 10);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500033, 'Liquidation', 'view_recovery', 10);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500034, 'Liquidation', 'view_recovery', 11);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500035, 'Liquidation', 'edit_recovery', 10);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500036, 'Liquidation', 'prepare_edit_recovery', 10);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500037, 'Liquidation', 'add_recovery', 10);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500038, 'Liquidation', 'prepare_add_recovery', 10);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500039, 'Liquidation', 'remove_recovery', 10);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500040, 'Liquidation', 'prepare_add_recovery_expense', 10);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22500041, 'Liquidation', 'prepare_add_recovery_income', 10);    



-- Create transaction state matrix for liquidation module
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5601, 'LIQUIDATION', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5602, 'LIQUIDATION', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5603, 'LIQUIDATION', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5604, 'LIQUIDATION', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5605, 'LIQUIDATION', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5606, 'LIQUIDATION', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5607, 'LIQUIDATION', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5608, 'LIQUIDATION', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5609, 'LIQUIDATION', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5610, 'LIQUIDATION', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5611, 'LIQUIDATION', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5612, 'LIQUIDATION', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');

insert into tr_state_matrix
   (stateid, stateins, operation, fromstate, tostate, userstate, enableind, frontendop) 
values 
   (5613, 'LIQUIDATION', 'MAKER_CLOSE', 'REJECTED', 'CLOSED', 'CLOSED', '1', '1'); 
   

	
-- Create transaction to track for liquidation module

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('LIQUIDATION', 'Liquidation.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Liquidation', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('LIQUIDATION', 'Liquidation.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Maintain Liquidation', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('LIQUIDATION', 'Liquidation.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Liquidation', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('LIQUIDATION', 'Liquidation.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain Liquidation', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('LIQUIDATION', 'Liquidation.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Liquidation', null, null);



-- Create transaction state matrix action for Liquidation module

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5611, 11, 'Process', 'Liquidation.do?event=checker_edit_liquidation&TrxId=', 'Liquidation.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5612, 11, 'Process', 'Liquidation.do?event=checker_edit_liquidation&TrxId=', 'Liquidation.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5603, 10, 'Process', 'Liquidation.do?event=maker_edit_liquidation_reject&TrxId=', 'Liquidation.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5609, 10, 'Close', 'Liquidation.do?event=maker_close_liquidation&TrxId=');
   
   
