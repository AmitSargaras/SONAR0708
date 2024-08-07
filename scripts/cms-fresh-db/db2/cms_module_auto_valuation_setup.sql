-------------------------------------------------------------------------------------------------
-- Step 1 Create transaction to track for auto valuation parameter module
-------------------------------------------------------------------------------------------------
insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'ACTIVE', 'Approved', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'REJECTED', 'Rejected', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'CLOSED', 'Closed', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Auto Valuation Parameter', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('AUTO_VAL_PARAM', 'AutoValParam.do?event=to_track&paramTrxId=', 'DELETED', 'Deleted', 'Maintain Auto Valuation Parameter', null, null);



-------------------------------------------------------------------------------------------------
-- Step 2 Create transaction state matrix for auto valuation parameter module
-------------------------------------------------------------------------------------------------
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4500, 'AUTO_VAL_PARAM', 'EDIT_REJECTED_DELETE_PRPA', 'REJECTED', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4501, 'AUTO_VAL_PARAM', 'CREATE_PRPA', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4502, 'AUTO_VAL_PARAM', 'APPROVE_CREATE_PRPA', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4503, 'AUTO_VAL_PARAM', 'UPDATE_PRPA', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4504, 'AUTO_VAL_PARAM', 'APPROVE_UPDATE_PRPA', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4505, 'AUTO_VAL_PARAM', 'REJECT_PRPA', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4506, 'AUTO_VAL_PARAM', 'EDIT_REJECTED_UPDATE_PRPA', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4507, 'AUTO_VAL_PARAM', 'CLOSE_REJECTED_UPDATE_PRPA', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4508, 'AUTO_VAL_PARAM', 'REJECT_PRPA', 'PENDING_CREATE', 'REJECTED', 'REJECTED', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4509, 'AUTO_VAL_PARAM', 'CLOSE_REJECTED_CREATE_PRPA', 'REJECTED', 'CLOSED', 'CLOSED', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4510, 'AUTO_VAL_PARAM', 'EDIT_REJECTED_CREATE_PRPA', 'REJECTED', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4511, 'AUTO_VAL_PARAM', 'DELETE_PRPA', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4512, 'AUTO_VAL_PARAM', 'APPROVE_DELETE_PRPA', 'PENDING_DELETE', 'DELETED', 'DELETED', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4513, 'AUTO_VAL_PARAM', 'REJECT_PRPA', 'PENDING_DELETE', 'REJECTED', 'REJECTED', '1', '1');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4514, 'AUTO_VAL_PARAM', 'CLOSE_REJECTED_DELETE_PRPA', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');




-------------------------------------------------------------------------------------------------
-- Step 3 Create transaction state matrix action for auto valuation parameter module
-------------------------------------------------------------------------------------------------
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4502, 7, 'Process' , 'AutoValParam.do?event=checker_process_create&paramTrxId=', 'AutoValParam.do?event=to_track&paramTrxId=');

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4504, 7, 'Process' , 'AutoValParam.do?event=checker_process_edit&paramTrxId=', 'AutoValParam.do?event=to_track&paramTrxId=');

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4506, 6, 'Process' , 'AutoValParam.do?event=maker_prepare_resubmit_edit&paramTrxId=', 'AutoValParam.do?event=to_track&paramTrxId=');

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4507, 6, 'Close' , 'AutoValParam.do?event=maker_prepare_close_edit&paramTrxId=', 'AutoValParam.do?event=to_track&paramTrxId=');

insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4512, 7, 'Process' , 'AutoValParam.do?event=checker_process_delete&paramTrxId=', 'AutoValParam.do?event=to_track&paramTrxId=');



-------------------------------------------------------------------------------------------------
-- Step 4 Create FAP for auto valuation parameter module
-------------------------------------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600001, 'AutoValParam', 'auto_val_param_list', 6);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600002, 'AutoValParam', 'maker_prepare_create', 6);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600003, 'AutoValParam', 'maker_confirm_create', 6);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600004, 'AutoValParam', 'view_auto_val_param', 6);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600005, 'AutoValParam', 'to_track', 6);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600006, 'AutoValParam', 'to_track', 7);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600007, 'AutoValParam', 'checker_process_create', 7);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600008, 'AutoValParam', 'checker_process_edit', 7);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600009, 'AutoValParam', 'checker_process_delete', 7);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600010, 'AutoValParam', 'checker_confirm_approve_create', 7);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600011, 'AutoValParam', 'checker_confirm_approve_edit', 7);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600012, 'AutoValParam', 'checker_confirm_approve_delete', 7);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600013, 'AutoValParam', 'checker_confirm_reject_create', 7);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600014, 'AutoValParam', 'checker_confirm_reject_edit', 7);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600015, 'AutoValParam', 'checker_confirm_reject_delete', 7);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600016, 'AutoValParam', 'maker_prepare_resubmit_create', 6);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600017, 'AutoValParam', 'maker_prepare_resubmit_edit', 6);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600018, 'AutoValParam', 'maker_prepare_resubmit_delete', 6);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600019, 'AutoValParam', 'maker_resubmit_change_list_create', 6);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600020, 'AutoValParam', 'maker_resubmit_change_list_edit', 6);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600021, 'AutoValParam', 'maker_confirm_resubmit_create', 6);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600022, 'AutoValParam', 'maker_confirm_resubmit_edit', 6);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600023, 'AutoValParam', 'maker_confirm_resubmit_delete', 6);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600024, 'AutoValParam', 'maker_prepare_close_create', 6);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600025, 'AutoValParam', 'maker_prepare_close_edit', 6);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600026, 'AutoValParam', 'maker_prepare_close_delete', 6);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600027, 'AutoValParam', 'maker_confirm_close_create', 6);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600028, 'AutoValParam', 'maker_confirm_close_edit', 6);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600029, 'AutoValParam', 'maker_confirm_close_delete', 6);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600030, 'AutoValParam', 'maker_prepare_change_list_create', 6);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600031, 'AutoValParam', 'maker_prepare_edit', 6);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600032, 'AutoValParam', 'maker_prepare_change_list_edit', 6);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600033, 'AutoValParam', 'maker_confirm_edit', 6);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600034, 'AutoValParam', 'maker_prepare_delete', 6);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600035, 'AutoValParam', 'maker_confirm_delete', 6);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19600036, 'AutoValParam', 'checker_view', 7);                                                        
