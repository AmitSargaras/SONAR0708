-----------------------------------------------------------------------
-- 1.Initial data for CMS_EARMARK_GROUP table 
-----------------------------------------------------------------------
-- delete old data, all of it. 
--DELETE FROM CMS_EARMARK_GROUP ;

-- insert for a feed id into earmark group 
INSERT INTO CMS_EARMARK_GROUP ( EARMARK_GROUP_ID , FEED_ID , SOURCE_SYSTEM_ID , CMS_ACTUAL_HOLDING , EARMARK_HOLDING , EARMARK_CURRENT , BREACH_IND , LAST_BATCH_UPDATE , VERSION_TIME , STATUS ) 
	SELECT NEXT VALUE FOR CMS_EARMARK_GROUP_SEQ , CMS_PRICE_FEED.FEED_ID , CMS_NOMINEES.SOURCE_SYSTEM_ID , 0 , 0 , 0 , '0' , CURRENT TIMESTAMP , 0 , '0'
	FROM CMS_PRICE_FEED , CMS_CREDIT_RISK_PARAM , CMS_NOMINEES 
	WHERE CMS_PRICE_FEED.FEED_ID = CMS_CREDIT_RISK_PARAM.FEED_ID 
	AND CMS_NOMINEES.FEED_ID = CMS_CREDIT_RISK_PARAM.FEED_ID ;


-----------------------------------------------------------------------
-- 2. data for possible states ( TR_STATE_MATRIX )
-----------------------------------------------------------------------
--DELETE FROM TR_STATE_MATRIX WHERE STATEINS='PRE_DEAL' ;

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5000, 'PRE_DEAL', 'MAKER_CREATE_EAR_MARK'         , 'ND'             , 'PENDING_CREATE' , 'PENDING_CREATE' , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5001, 'PRE_DEAL', 'MAKER_DELETE_EAR_MARK'         , 'ACTIVE'         , 'PENDING_DELETE' , 'PENDING_DELETE' , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5002, 'PRE_DEAL', 'MAKER_TRANSFER_EAR_MARK'       , 'ACTIVE'         , 'PENDING_UPDATE' , 'ACTIVE'         , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5003, 'PRE_DEAL', 'MAKER_RELEASE_EAR_MARK'        , 'ACTIVE'         , 'PENDING_UPDATE' , 'ACTIVE'         , '1', '1');     
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5004, 'PRE_DEAL', 'CHECKER_APPROVE_EAR_MARK'      , 'PENDING_DELETE' , 'DELETED'        , 'DELETED'        , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5005, 'PRE_DEAL', 'CHECKER_APPROVE_EAR_MARK'      , 'PENDING_UPDATE' , 'ACTIVE'         , 'PENDING_UPDATE' , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5006, 'PRE_DEAL', 'CHECKER_APPROVE_EAR_MARK'      , 'PENDING_CREATE' , 'ACTIVE'         , 'PENDING_CREATE' , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5007, 'PRE_DEAL', 'CHECKER_REJECT_EAR_MARK'       , 'PENDING_DELETE' , 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5008, 'PRE_DEAL', 'CHECKER_REJECT_EAR_MARK'       , 'PENDING_UPDATE' , 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5009, 'PRE_DEAL', 'CHECKER_REJECT_EAR_MARK'       , 'PENDING_CREATE' , 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5010, 'PRE_DEAL', 'MAKER_CLOSE_EAR_MARK'          , 'REJECTED_DELETE', 'ACTIVE'         , 'ACTIVE'         , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5011, 'PRE_DEAL', 'MAKER_CLOSE_EAR_MARK'          , 'REJECTED_UPDATE', 'ACTIVE'         , 'ACTIVE'         , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5012, 'PRE_DEAL', 'MAKER_CLOSE_EAR_MARK'          , 'REJECTED_CREATE', 'ACTIVE'         , 'ACTIVE'         , '1', '1');
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 5013, 'PRE_DEAL', 'MAKER_UPDATE_REJECTED_EAR_MARK', 'REJECTED_CREATE', 'PENDING_CREATE' , 'PENDING_CREATE' , '1', '1'); 



-----------------------------------------------------------------------
-- 3. Data for transaction engine to retrieve links for certain states 
-----------------------------------------------------------------------
--DELETE FROM CMS_TRX_TOTRACK WHERE TRANSACTION_TYPE='PRE_DEAL' ;

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending create', 'Pre-Deal', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'PENDING_DELETE', 'Pending delete', 'Pre-Deal', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending update', 'Pre-Deal', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'REJECTED_DELETE', 'Rejected'      , 'Pre-Deal', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'REJECTED_UPDATE', 'Rejected'      , 'Pre-Deal', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'PRE_DEAL', 'PreDeal.do?event=to_track&TrxId=', 'REJECTED_CREATE', 'Rejected'      , 'Pre-Deal', NULL, NULL); 



-----------------------------------------------------------------------
-- 4. CMS State matrix action
-----------------------------------------------------------------------
--DELETE FROM CMS_STATEMATRIX_ACTION WHERE URL LIKE 'PreDeal.do?event=%' ;

-- process deletion 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5004, 27, 'Process', 'PreDeal.do?event=checker_process_delete&TrxId=', NULL);

-- process new  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5006, 27, 'Process', 'PreDeal.do?event=checker_process_new&TrxId=', NULL);

-- process either release , or transfer  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5005, 27, 'Process', 'PreDeal.do?event=checker_process&TrxId=', NULL); 

-- process either release , or transfer 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5005, 11, 'Process', 'PreDeal.do?event=checker_process&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5010, 26, 'Close'  , 'PreDeal.do?event=maker_prepare_close_delete&TrxId=', NULL);  
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5012, 26, 'Close'  , 'PreDeal.do?event=maker_prepare_close_create&TrxId=', NULL); 

-- process new 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5013, 26, 'Process', 'PreDeal.do?event=maker_prepare_update_rejected_create&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5011, 26, 'Close'  , 'PreDeal.do?event=maker_prepare_close_update&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5011, 10, 'Close'  , 'PreDeal.do?event=maker_prepare_close_release&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5010, 10, 'Close',   'PreDeal.do?event=maker_prepare_close_delete&TrxId=', NULL);
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5012, 10, 'Close',   'PreDeal.do?event=maker_prepare_close_create&TrxId=', NULL);
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5013, 10, 'Process', 'PreDeal.do?event=maker_prepare_update_rejected_create&TrxId=', NULL);
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5011, 10, 'Close',   'PreDeal.do?event=maker_prepare_close_update&TrxId=', NULL)    ;
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5004, 11, 'Process', 'PreDeal.do?event=checker_process_delete&TrxId=', NULL);
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 5006, 11, 'Process', 'PreDeal.do?event=checker_process_new&TrxId=', NULL);




-----------------------------------------------------------------------
-- 5. CMS function access profile 
-----------------------------------------------------------------------
--DELETE FROM CMS_FUNCTION_ACCESS WHERE ACTION = 'PreDeal' ;
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300001, 'PreDeal', 'maker_prepare_search', 26);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300002, 'PreDeal', 'maker_search', 26);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300003, 'PreDeal', 'maker_view_ear_mark', 26);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300004, 'PreDeal', 'maker_prepare_search', 15);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300005, 'PreDeal', 'maker_search', 15);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300006, 'PreDeal', 'maker_view_ear_mark', 15);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300007, 'PreDeal', 'maker_prepare_search', 10);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300008, 'PreDeal', 'maker_search', 10);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300009, 'PreDeal', 'maker_view_ear_mark', 10);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300010, 'PreDeal', 'maker_prepare_new_mark', 26);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300011, 'PreDeal', 'maker_presubmit_new_ear_mark', 26);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300012, 'PreDeal', 'maker_submit_new_ear_mark', 26);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300013, 'PreDeal', 'maker_calculate', 26);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300014, 'PreDeal', 'maker_prepare_update_rejected_create', 26);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300015, 'PreDeal', 'maker_preupdate_rejected_create', 26);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300016, 'PreDeal', 'maker_update_rejected_create', 26);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300017, 'PreDeal', 'maker_calculate_rejected', 26);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300018, 'PreDeal', 'max_cap_breach', 26);                                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300019, 'PreDeal', 'quota_cap_breach', 26);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300020, 'PreDeal', 'maker_prepare_release', 10);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300021, 'PreDeal', 'maker_submit_release', 10);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300022, 'PreDeal', 'maker_prepare_delete', 26);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300023, 'PreDeal', 'maker_submit_delete', 26);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300024, 'PreDeal', 'maker_prepare_transfer', 26);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300025, 'PreDeal', 'maker_submit_transfer', 26);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300026, 'PreDeal', 'maker_prepare_close_update', 10);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300027, 'PreDeal', 'maker_prepare_close_release', 10);                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300028, 'PreDeal', 'maker_close_update', 10);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300029, 'PreDeal', 'maker_submit_close', 10);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300030, 'PreDeal', 'maker_prepare_close_update', 26);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300031, 'PreDeal', 'maker_prepare_close_create', 26);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300032, 'PreDeal', 'maker_prepare_close_delete', 26);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300033, 'PreDeal', 'maker_close_update', 26);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300034, 'PreDeal', 'maker_close_create', 26);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300035, 'PreDeal', 'maker_submit_close', 26);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300036, 'PreDeal', 'wip', 10);                                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300037, 'PreDeal', 'error_page', 10);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300038, 'PreDeal', 'wip', 26);                                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300039, 'PreDeal', 'error_page', 26);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300040, 'PreDeal', 'checker_process_new', 27);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300041, 'PreDeal', 'checker_approve_new', 27);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300042, 'PreDeal', 'checker_reject_new', 27);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300043, 'PreDeal', 'checker_process', 11);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300044, 'PreDeal', 'checker_approve', 11);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300045, 'PreDeal', 'checker_reject', 11);                                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300046, 'PreDeal', 'checker_process', 27);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300047, 'PreDeal', 'checker_approve', 27);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300048, 'PreDeal', 'checker_reject', 27);                                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300049, 'PreDeal', 'checker_process_delete', 27);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300050, 'PreDeal', 'maker_prepare_search', 14);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300051, 'PreDeal', 'maker_search', 14);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300052, 'PreDeal', 'maker_view_ear_mark', 14);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300053, 'PreDeal', 'to_track', 26);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300054, 'PreDeal', 'to_track', 27);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300055, 'PreDeal', 'to_track', 10);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300056, 'PreDeal', 'to_track', 11);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300057, 'PreDeal', 'to_track', 15);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300058, 'PreDeal', 'to_track', 14);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300059, 'PreDeal', 'maker_prepare_new_mark', 10);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300060, 'PreDeal', 'maker_presubmit_new_ear_mark', 10);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300061, 'PreDeal', 'maker_submit_new_ear_mark', 10);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300062, 'PreDeal', 'maker_prepare_sourcesystem', 10);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300063, 'PreDeal', 'maker_prepare_sourcesystem_rejected', 10);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300064, 'PreDeal', 'maker_prepare_sourcesystem', 26);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300065, 'PreDeal', 'maker_prepare_sourcesystem_rejected', 26);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300066, 'PreDeal', 'maker_calculate', 10);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300067, 'PreDeal', 'maker_prepare_update_rejected_create', 10);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300068, 'PreDeal', 'maker_preupdate_rejected_create', 10);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300069, 'PreDeal', 'maker_update_rejected_create', 10);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300070, 'PreDeal', 'maker_calculate_rejected', 10);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300071, 'PreDeal', 'max_cap_breach', 10);                                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300072, 'PreDeal', 'quota_cap_breach', 10);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300073, 'PreDeal', 'quota_cap_breach', 10);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300074, 'PreDeal', 'maker_prepare_close_create', 10);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300075, 'PreDeal', 'maker_close_create', 10);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300076, 'PreDeal', 'maker_prepare_view_concentration', 10);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300077, 'PreDeal', 'maker_prepare_delete', 10);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300078, 'PreDeal', 'maker_prepare_transfer', 10);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300079, 'PreDeal', 'maker_submit_delete', 10);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300080, 'PreDeal', 'maker_submit_transfer', 10);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300081, 'PreDeal', 'maker_prepare_close_delete', 10);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300082, 'PreDeal', 'maker_prepare_view_concentration', 14);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300083, 'PreDeal', 'maker_prepare_view_concentration', 15);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300084, 'PreDeal', 'checker_process_new', 11);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300085, 'PreDeal', 'checker_approve_new', 11);                                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300086, 'PreDeal', 'checker_reject_new', 11);                                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21300087, 'PreDeal', 'checker_process_delete', 11);   
                                             
 

