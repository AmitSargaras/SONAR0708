------------------------------------------------------------------------------------------------
--ISDA CSA Deal Valuation module
------------------------------------------------------------------------------------------------
-- Create function access for ISDA CSA Deal Valuation module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400001, 'ISDACSADealVal', 'view_isda_deal_detail', 24);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400002, 'ISDACSADealVal', 'process_isda_dealdetails', 24);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400003, 'ISDACSADealVal', 'maker_input_valuation', 24);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400004, 'ISDACSADealVal', 'maker_input_valuation_confirm', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400005, 'ISDACSADealVal', 'checker_edit_input_valuation', 25);                                     
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400006, 'ISDACSADealVal', 'checker_approve_edit_valuation', 25);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400007, 'ISDACSADealVal', 'checker_reject_edit_valuation', 25);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400008, 'ISDACSADealVal', 'maker_close_input_valuation', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400009, 'ISDACSADealVal', 'maker_close_input_valuation_confirm', 24);                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400010, 'ISDACSADealVal', 'maker_edit_valuation_reject', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400011, 'ISDACSADealVal', 'maker_edit_reject_confirm', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400012, 'ISDACSADealVal', 'to_track', 24);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400013, 'ISDACSADealVal', 'to_track', 25);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400014, 'ISDACSADealVal', 'view', 4);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400015, 'ISDACSADealVal', 'view', 5);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400016, 'ISDACSADealVal', 'view', 2);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400017, 'ISDACSADealVal', 'view', 3);                                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400018, 'ISDACSADealVal', 'view', 22);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400019, 'ISDACSADealVal', 'view', 21);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400020, 'ISDACSADealVal', 'view', 13);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400021, 'ISDACSADealVal', 'view', 14);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400022, 'ISDACSADealVal', 'view', 15);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400023, 'ISDACSADealVal', 'view', 20);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400024, 'ISDACSADealVal', 'view', 10);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400025, 'ISDACSADealVal', 'view', 11);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400026, 'ISDACSADealVal', 'view', 24);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400027, 'ISDACSADealVal', 'view', 25);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400028, 'ISDACSADealVal', 'to_track', 24);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400029, 'ISDACSADealVal', 'to_track', 25);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400030, 'ISDACSADealVal', 'view_isda_deal_detail', 25);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400031, 'ISDACSADealVal', 'process_isda_dealdetails', 25);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400032, 'ISDACSADealVal', 'paginate', 24);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21400033, 'ISDACSADealVal', 'paginate', 25);         
 
-- Create transaction state matrix for ISDA CSA Deal Valuation module
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5101, 'ISDA_DEAL_VAL', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5102, 'ISDA_DEAL_VAL', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5103, 'ISDA_DEAL_VAL', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5104, 'ISDA_DEAL_VAL', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5105, 'ISDA_DEAL_VAL', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5106, 'ISDA_DEAL_VAL', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5107, 'ISDA_DEAL_VAL', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5108, 'ISDA_DEAL_VAL', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5109, 'ISDA_DEAL_VAL', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5110, 'ISDA_DEAL_VAL', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5111, 'ISDA_DEAL_VAL', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5112, 'ISDA_DEAL_VAL', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
 
 
-- Create transaction to track for ISDA CSA Deal Valuation module
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('ISDA_DEAL_VAL', 'ISDACSADealVal.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'ISDA CSA Valuation', null, 'MANUAL');

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('ISDA_DEAL_VAL', 'ISDACSADealVal.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'ISDA CSA Valuation', null, 'MANUAL');

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('ISDA_DEAL_VAL', 'ISDACSADealVal.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'ISDA CSA Valuation', null, 'MANUAL');

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('ISDA_DEAL_VAL', 'ISDACSADealVal.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'ISDA CSA Valuation', null, 'MANUAL');

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('ISDA_DEAL_VAL', 'ISDACSADealVal.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'ISDA CSA Valuation', null, 'MANUAL');


-- Create transaction state matrix action for ISDA CSA Deal Valuation module
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5111, 25, 'Process', 'ISDACSADealVal.do?event=checker_edit_input_valuation&TrxId=', 'ISDACSADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5112, 25, 'Process', 'ISDACSADealVal.do?event=checker_edit_input_valuation&TrxId=', 'ISDACSADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5103, 24, 'Process', 'ISDACSADealVal.do?event=maker_edit_valuation_reject&TrxId=', 'ISDACSADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5109, 24, 'Close', 'ISDACSADealVal.do?event=maker_close_input_valuation&TrxId=');



   
------------------------------------------------------------------------------------------------
-- GMRA module
------------------------------------------------------------------------------------------------   
 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500001, 'GMRADeal', 'view_gmra_deal_detail', 24);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500002, 'GMRADeal', 'maker_add_deal', 24);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500003, 'GMRADeal', 'refresh_maker_add_deal', 24);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500004, 'GMRADeal', 'process_gmra_dealdetails', 24);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500005, 'GMRADeal', 'edit_gmra_dealdetails', 24);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500006, 'GMRADeal', 'refresh_edit_gmra_dealdetails', 24);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500007, 'GMRADeal', 'delete_gmra_dealdetails', 24);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500008, 'GMRADeal', 'refresh_edit_gmra_dealdetails', 24);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500009, 'GMRADeal', 'maker_update_dealdetails_confirm', 24);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500010, 'GMRADeal', 'maker_edit_reject_confirm', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500011, 'GMRADeal', 'checker_edit_dealdetails', 25);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500012, 'GMRADeal', 'maker_close_dealdetails', 24);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500013, 'GMRADeal', 'checker_approve_edit_dealdetails', 25);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500014, 'GMRADeal', 'checker_reject_edit_dealdetails', 25);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500015, 'GMRADeal', 'maker_close_dealdetails_confirm', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500016, 'GMRADeal', 'maker_edit_dealdetails_reject', 24);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500017, 'GMRADeal', 'maker_add_deal_confirm', 24);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500018, 'GMRADeal', 'delete_gmra_dealdetails_confirm', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500019, 'GMRADeal', 'maker_delete_dealdetails_reject', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500020, 'GMRADeal', 'to_track', 24);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500021, 'GMRADeal', 'to_track', 25);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500022, 'GMRADeal', 'view', 4);                                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500023, 'GMRADeal', 'view', 5);                                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500024, 'GMRADeal', 'view', 2);                                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500025, 'GMRADeal', 'view', 3);                                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500026, 'GMRADeal', 'view', 22);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500027, 'GMRADeal', 'view', 21);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500028, 'GMRADeal', 'view', 13);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500029, 'GMRADeal', 'view', 14);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500030, 'GMRADeal', 'view', 15);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500031, 'GMRADeal', 'view', 20);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500032, 'GMRADeal', 'view', 10);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500033, 'GMRADeal', 'view', 11);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500034, 'GMRADeal', 'view', 24);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500035, 'GMRADeal', 'view', 25);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500036, 'GMRADeal', 'to_track', 24);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500037, 'GMRADeal', 'to_track', 25);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500038, 'GMRADeal', 'view_gmra_deal_detail', 25);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500039, 'GMRADeal', 'process_gmra_dealdetails', 25);                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500040, 'GMRADeal', 'paginate', 24);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500041, 'GMRADeal', 'paginate', 25);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21500042, 'GMRADeal', 'refresh_maker_edit_dealdetails_reject', 24);                                  

-- Create transaction state matrix for GMRA Deal module 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5301, 'GMRA_DEAL', 'CHECKER_APPROVE', 'PENDING_CREATE', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5302, 'GMRA_DEAL', 'CHECKER_APPROVE', 'PENDING_DELETE', 'CLOSED', 'CLOSED', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5303, 'GMRA_DEAL', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5304, 'GMRA_DEAL', 'CHECKER_REJECT', 'PENDING_CREATE', 'REJECTED_CREATE', 'REJECTED_CREATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5305, 'GMRA_DEAL', 'CHECKER_REJECT', 'PENDING_DELETE', 'REJECTED_DELETE', 'REJECTED_DELETE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5306, 'GMRA_DEAL', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED_UPDATE', 'REJECTED_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5307, 'GMRA_DEAL', 'MAKER_CLOSE', 'DRAFT', 'CLOSED', 'CLOSED', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5308, 'GMRA_DEAL', 'MAKER_CLOSE', 'REJECTED_CREATE', 'CLOSED', 'CLOSED', '1', '1');
  
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5309, 'GMRA_DEAL', 'MAKER_CLOSE_UPDATE', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5310, 'GMRA_DEAL', 'MAKER_CLOSE_UPDATE', 'REJECTED_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5311, 'GMRA_DEAL', 'MAKER_CLOSE_UPDATE', 'REJECTED_DELETE', 'ACTIVE', 'ACTIVE', '1', '1');
  
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5312, 'GMRA_DEAL', 'MAKER_CREATE', 'DRAFT', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5313, 'GMRA_DEAL', 'MAKER_CREATE', 'ND', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5314, 'GMRA_DEAL', 'MAKER_CREATE', 'REJECTED_CREATE', 'PENDING_CREATE', 'PENDING_CREATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5315, 'GMRA_DEAL', 'MAKER_DELETE', 'ACTIVE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5316, 'GMRA_DEAL', 'MAKER_DELETE', 'REJECTED_DELETE', 'PENDING_DELETE', 'PENDING_DELETE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5317, 'GMRA_DEAL', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5318, 'GMRA_DEAL', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5319, 'GMRA_DEAL', 'MAKER_UPDATE', 'REJECTED_UPDATE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

-- Create transaction to track for GMRA Deal module
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'REJECTED_UPDATE', 'Rejected Update', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'REJECTED_CREATE', 'Rejected Create', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'REJECTED_DELETE', 'Rejected Delete', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'GMRA Deal', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL', 'GMRADeal.do?event=to_track&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'GMRA Deal', null, null);
 
-- Create transaction state matrix action for GMRA Deal module
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5301, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5302, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5303, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5304, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5305, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5306, 25, 'Process', 'GMRADeal.do?event=checker_edit_dealdetails&TrxId=', 'GMRADeal.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5314, 24, 'Process', 'GMRADeal.do?event=maker_edit_dealdetails_reject&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5319, 24, 'Process', 'GMRADeal.do?event=maker_edit_dealdetails_reject&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5316, 24, 'Process', 'GMRADeal.do?event=maker_delete_dealdetails_reject&TrxId=', 'GMRADeal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5308, 24, 'Close', 'GMRADeal.do?event=maker_close_dealdetails&TrxId=');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5310, 24, 'Close', 'GMRADeal.do?event=maker_close_dealdetails&TrxId=');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5311, 24, 'Close', 'GMRADeal.do?event=maker_close_dealdetails&TrxId=');
 


------------------------------------------------------------------------------------------------
-- GMRA Deal Valuation module
------------------------------------------------------------------------------------------------   
-- Create function access for GMRA Deal Valuation module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600001, 'GMRADealVal', 'maker_update_valuation', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600002, 'GMRADealVal', 'maker_update_valuation_confirm', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600003, 'GMRADealVal', 'maker_edit_reject_confirm', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600004, 'GMRADealVal', 'checker_approve_edit_valuation', 25);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600005, 'GMRADealVal', 'checker_reject_edit_valuation', 25);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600006, 'GMRADealVal', 'maker_close_input_valuation', 24);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600007, 'GMRADealVal', 'maker_close_input_valuation_confirm', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600008, 'GMRADealVal', 'maker_edit_valuation_reject', 24);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600009, 'GMRADealVal', 'return_update', 24);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600010, 'GMRADealVal', 'checker_edit_input_valuation', 25);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600011, 'GMRADealVal', 'to_track', 24);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600012, 'GMRADealVal', 'to_track', 25);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600013, 'GMRADealVal', 'view', 4);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600014, 'GMRADealVal', 'view', 5);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600015, 'GMRADealVal', 'view', 2);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600016, 'GMRADealVal', 'view', 3);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600017, 'GMRADealVal', 'view', 22);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600018, 'GMRADealVal', 'view', 21);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600019, 'GMRADealVal', 'view', 13);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600020, 'GMRADealVal', 'view', 14);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600021, 'GMRADealVal', 'view', 15);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600022, 'GMRADealVal', 'view', 20);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600023, 'GMRADealVal', 'view', 10);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600024, 'GMRADealVal', 'view', 11);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600025, 'GMRADealVal', 'view', 24);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600026, 'GMRADealVal', 'view', 25);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600027, 'GMRADealVal', 'to_track', 24);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600028, 'GMRADealVal', 'to_track', 25);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600029, 'GMRADealVal', 'paginate', 24);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21600030, 'GMRADealVal', 'paginate', 25);                                                            

-- Create transaction state matrix for GMRA Deal Valuation module
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5201, 'GMRA_DEAL_VAL', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5202, 'GMRA_DEAL_VAL', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5203, 'GMRA_DEAL_VAL', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5204, 'GMRA_DEAL_VAL', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5205, 'GMRA_DEAL_VAL', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5206, 'GMRA_DEAL_VAL', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5207, 'GMRA_DEAL_VAL', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5208, 'GMRA_DEAL_VAL', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5209, 'GMRA_DEAL_VAL', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5210, 'GMRA_DEAL_VAL', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5211, 'GMRA_DEAL_VAL', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5212, 'GMRA_DEAL_VAL', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
 
-- Create transaction to track for GMRA Deal Valuation module
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL_VAL', 'GMRADealVal.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'GMRA Deal Valuation', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL_VAL', 'GMRADealVal.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'GMRA Deal Valuation', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL_VAL', 'GMRADealVal.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'GMRA Deal Valuation', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL_VAL', 'GMRADealVal.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'GMRA Deal Valuation', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('GMRA_DEAL_VAL', 'GMRADealVal.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'GMRA Deal Valuation', null, null);
 
-- Create transaction state matrix action for GMRA Deal Valuation module
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5211, 25, 'Process', 'GMRADealVal.do?event=checker_edit_input_valuation&TrxId=', 'GMRADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5212, 25, 'Process', 'GMRADealVal.do?event=checker_edit_input_valuation&TrxId=', 'GMRADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5203, 24, 'Process', 'GMRADealVal.do?event=maker_edit_valuation_reject&TrxId=', 'GMRADealVal.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5209, 24, 'Close', 'GMRADealVal.do?event=maker_close_input_valuation&TrxId=');
 

 
------------------------------------------------------------------------------------------------
--Cash Margin module
------------------------------------------------------------------------------------------------
-- Create function access for Cash Margin module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900001, 'CashMargin', 'maker_view_cashmargin_isdacsa', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900002, 'CashMargin', 'maker_view_cashmargin_gmra', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900003, 'CashMargin', 'maker_update_allcashmargin_confirm', 24);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900004, 'CashMargin', 'maker_edit_reject_confirm', 24);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900005, 'CashMargin', 'checker_edit_allcashmargin', 25);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900006, 'CashMargin', 'checker_approve_edit_allcashmargin', 25);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900007, 'CashMargin', 'checker_reject_edit_allcashmargin', 25);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900008, 'CashMargin', 'maker_close_allcashmargin', 24);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900009, 'CashMargin', 'maker_close_allcashmargin_confirm', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900010, 'CashMargin', 'maker_edit_allcashmargin_reject', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900011, 'CashMargin', 'maker_update_cashmargin', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900012, 'CashMargin', 'maker_create_cashmargin_confirm', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900013, 'CashMargin', 'maker_update_cashmargin_confirm', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900014, 'CashMargin', 'return_update_gmra', 24);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900015, 'CashMargin', 'return_update_isdacsa', 24);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900016, 'CashMargin', 'maker_create_cashmargin', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900017, 'CashMargin', 'maker_delete_cashmargin', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900018, 'CashMargin', 'maker_create_editreject', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900019, 'CashMargin', 'maker_create_editreject_confirm', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900020, 'CashMargin', 'maker_delete_editreject', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900021, 'CashMargin', 'maker_update_editreject', 24);                                              
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900022, 'CashMargin', 'maker_update_editreject_confirm', 24);                                      
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900023, 'CashMargin', 'to_track', 24);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900024, 'CashMargin', 'to_track', 25);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900025, 'CashMargin', 'view', 4);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900026, 'CashMargin', 'view', 5);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900027, 'CashMargin', 'view', 2);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900028, 'CashMargin', 'view', 3);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900029, 'CashMargin', 'view', 22);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900030, 'CashMargin', 'view', 21);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900031, 'CashMargin', 'view', 13);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900032, 'CashMargin', 'view', 14);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900033, 'CashMargin', 'view', 15);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900034, 'CashMargin', 'view', 20);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900035, 'CashMargin', 'view', 10);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900036, 'CashMargin', 'view', 11);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900037, 'CashMargin', 'view', 24);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900038, 'CashMargin', 'view', 25);                                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900039, 'CashMargin', 'to_track', 24);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900040, 'CashMargin', 'to_track', 25);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900041, 'CashMargin', 'maker_view_cashmargin_isdacsa', 25);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (21900042, 'CashMargin', 'maker_view_cashmargin_gmra', 25);                                           


-- Create transaction state matrix for cash margin module
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5401, 'CASH_MARGIN', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5402, 'CASH_MARGIN', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5403, 'CASH_MARGIN', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5404, 'CASH_MARGIN', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5405, 'CASH_MARGIN', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5406, 'CASH_MARGIN', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5407, 'CASH_MARGIN', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5408, 'CASH_MARGIN', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5409, 'CASH_MARGIN', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5410, 'CASH_MARGIN', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5411, 'CASH_MARGIN', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
 
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (5412, 'CASH_MARGIN', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
 
-- Create transaction to track for cash margin module
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('CASH_MARGIN', 'CashMargin.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Cash Margin', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('CASH_MARGIN', 'CashMargin.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Cash Margin', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('CASH_MARGIN', 'CashMargin.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Cash Margin', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('CASH_MARGIN', 'CashMargin.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Cash Margin', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('CASH_MARGIN', 'CashMargin.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Cash Margin', null, null);
 
-- Create transaction state matrix action for cash margin module
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5411, 25, 'Process', 'CashMargin.do?event=checker_edit_allcashmargin&TrxId=', 'CashMargin.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5412, 25, 'Process', 'CashMargin.do?event=checker_edit_allcashmargin&TrxId=', 'CashMargin.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5403, 24, 'Process', 'CashMargin.do?event=maker_edit_allcashmargin_reject&TrxId=', 'CashMargin.do?event=view');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5409, 24, 'Close', 'CashMargin.do?event=maker_close_allcashmargin&TrxId=');
 

 
------------------------------------------------------------------------------------------------
--Trading Agreement module
------------------------------------------------------------------------------------------------

-- Create function access for Trading Agreemnt module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600001, 'TradingAgreement', 'maker_view_agreement', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600002, 'TradingAgreement', 'maker_add_agreement', 24);                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600003, 'TradingAgreement', 'maker_add_editreject', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600004, 'TradingAgreement', 'maker_update_agreement', 24);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600005, 'TradingAgreement', 'maker_update_editreject', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600006, 'TradingAgreement', 'maker_delete_agreement', 24);                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600007, 'TradingAgreement', 'maker_delete_editreject', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600008, 'TradingAgreement', 'maker_add_agreement_confirm', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600009, 'TradingAgreement', 'maker_add_editreject_confirm', 24);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600010, 'TradingAgreement', 'maker_update_agreement_confirm', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600011, 'TradingAgreement', 'maker_update_editreject_confirm', 24);                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600012, 'TradingAgreement', 'prepare_add_threshold', 24);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600013, 'TradingAgreement', 'prepare_update_threshold', 24);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600014, 'TradingAgreement', 'view_threshold', 24);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600015, 'TradingAgreement', 'view_threshold', 25);                                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600016, 'TradingAgreement', 'view', 24);                                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600017, 'TradingAgreement', 'view', 25);                                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600018, 'TradingAgreement', 'refresh_maker_add_agreement', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600019, 'TradingAgreement', 'refresh_maker_update_agreement', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600020, 'TradingAgreement', 'cancel', 24);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600021, 'TradingAgreement', 'to_track', 24);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600022, 'TradingAgreement', 'to_track', 25);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22600023, 'TradingAgreement', 'checker_view_agreement', 25);                                         


------------------------------------------------------------------------------------------------
--Threshold Rating Module
------------------------------------------------------------------------------------------------ 

-- Create function access for Threshold Rating module
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700001, 'ThresholdRating', 'prepare_add_threshold', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700002, 'ThresholdRating', 'prepare_update_threshold', 24);                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700003, 'ThresholdRating', 'view_threshold', 24);                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700004, 'ThresholdRating', 'prepare_add_threshold_new_confirm', 24);                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700005, 'ThresholdRating', 'prepare_update_threshold_new_confirm', 24);                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700006, 'ThresholdRating', 'prepare_add_threshold_update_confirm', 24);                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700007, 'ThresholdRating', 'prepare_update_threshold_update_confirm', 24);                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700008, 'ThresholdRating', 'prepare_add_threshold_delete', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700009, 'ThresholdRating', 'prepare_update_threshold_delete', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700010, 'ThresholdRating', 'prepare_add_threshold_new', 24);                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700011, 'ThresholdRating', 'prepare_update_threshold_new', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700012, 'ThresholdRating', 'prepare_add_threshold_update', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700013, 'ThresholdRating', 'prepare_update_threshold_update', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700014, 'ThresholdRating', 'prepare_add_threshold_confirm', 24);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700015, 'ThresholdRating', 'prepare_add_editreject_confirm', 24);                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700016, 'ThresholdRating', 'return_prepare_add_threshold', 24);                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700017, 'ThresholdRating', 'prepare_update_threshold_confirm', 24);                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700018, 'ThresholdRating', 'prepare_update_editreject_confirm', 24);                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700019, 'ThresholdRating', 'return_prepare_update_threshold', 24);                                 
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700020, 'ThresholdRating', 'prepare_add_editreject_confirm', 24);                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700021, 'ThresholdRating', 'return_view_threshold', 24);                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700022, 'ThresholdRating', 'view', 24);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700023, 'ThresholdRating', 'view', 25);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700024, 'ThresholdRating', 'refresh_prepare_add_threshold_new', 24);                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700025, 'ThresholdRating', 'refresh_prepare_update_threshold_new', 24);                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700026, 'ThresholdRating', 'to_track', 24);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700027, 'ThresholdRating', 'to_track', 25);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700028, 'ThresholdRating', 'refresh_prepare_add_threshold_update', 24);                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700029, 'ThresholdRating', 'refresh_prepare_update_threshold_update', 24);                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700030, 'ThresholdRating', 'checker_view_threshold', 25);                                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (22700031, 'ThresholdRating', 'return_view', 24);                                                     


------------------------------------------------------------------------------------------------
--Trading Book Report Module
------------------------------------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (29600001, 'TradingBookReport', 'gmra_report', 24);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (29600002, 'TradingBookReport', 'isdacsa_report', 24);                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (29600003, 'TradingBookReport', 'gmra_report', 25);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (29600004, 'TradingBookReport', 'isdacsa_report', 25);                                                
 