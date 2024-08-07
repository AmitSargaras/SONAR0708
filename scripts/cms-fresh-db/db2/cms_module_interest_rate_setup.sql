----------------------------------------------------------------------
-- Create FAP for Interest Rate module
----------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500001, 'MaintainInterestRate', 'prepare', 24);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500002, 'MaintainInterestRate', 'list', 24);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500003, 'MaintainInterestRate', 'maker_edit_interestrate_confirm', 24);                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500004, 'MaintainInterestRate', 'maker_close_interestrate', 24);                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500005, 'MaintainInterestRate', 'checker_edit_interestrate', 25);                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500006, 'MaintainInterestRate', 'checker_approve_edit_interestrate', 25);                          
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500007, 'MaintainInterestRate', 'checker_reject_edit_interestrate', 25);                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500008, 'MaintainInterestRate', 'maker_close_interestrate_confirm', 24);                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500009, 'MaintainInterestRate', 'maker_edit_interestrate_reject', 24);                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500010, 'MaintainInterestRate', 'to_track', 24);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500011, 'MaintainInterestRate', 'to_track', 25);                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500012, 'MaintainInterestRate', 'view', 24);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500013, 'MaintainInterestRate', 'view', 25);                                                       
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500014, 'MaintainInterestRate', 'prepare', 25);                                                    
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500015, 'MaintainInterestRate', 'maker_edit_reject_confirm', 24);                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19500016, 'MaintainInterestRate', 'checker_view', 25);                                               

----------------------------------------------------------------------
-- Create transaction state matrix for interest rate module
----------------------------------------------------------------------
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4601, 'INT_RATE', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4602, 'INT_RATE', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4603, 'INT_RATE', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4604, 'INT_RATE', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4605, 'INT_RATE', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4606, 'INT_RATE', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4607, 'INT_RATE', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4608, 'INT_RATE', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4609, 'INT_RATE', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4610, 'INT_RATE', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4611, 'INT_RATE', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4612, 'INT_RATE', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');

	
----------------------------------------------------------------------
-- Create  to track for interest rate module
----------------------------------------------------------------------
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('INT_RATE', 'MaintainInterestRate.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Interest Rate', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('INT_RATE', 'MaintainInterestRate.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Maintain Interest Rate', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('INT_RATE', 'MaintainInterestRate.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Interest Rate', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('INT_RATE', 'MaintainInterestRate.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain Interest Rate', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('INT_RATE', 'MaintainInterestRate.do?event=to_track&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Interest Rate', null, null);


----------------------------------------------------------------------
-- Create  state matrix action for Interest Rate module
----------------------------------------------------------------------
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4611, 25, 'Process', 'MaintainInterestRate.do?event=checker_edit_interestrate&TrxId=', 'MaintainInterestRate.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4612, 25, 'Process', 'MaintainInterestRate.do?event=checker_edit_interestrate&TrxId=', 'MaintainInterestRate.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4603, 24, 'Process', 'MaintainInterestRate.do?event=maker_edit_interestrate_reject&TrxId=', 'MaintainInterestRate.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (4609, 24, 'Close', 'MaintainInterestRate.do?event=maker_close_interestrate&TrxId=');

