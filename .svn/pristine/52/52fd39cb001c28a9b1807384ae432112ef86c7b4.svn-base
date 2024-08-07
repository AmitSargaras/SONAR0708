-----------------------------------------------------------------------------
-- Step 1: Identify those securities in asset life module
-----------------------------------------------------------------------------
UPDATE CMS_SECURITY_SUB_TYPE SET IS_TANGIBLE_ASSET = '1' WHERE SECURITY_SUB_TYPE_ID in ('AB101', 'AB102', 'AB109', 'AB111');


-----------------------------------------------------------------------------
-- Step 2: Insert setup values for asset life module
-----------------------------------------------------------------------------
INSERT INTO CMS_SECURITY_ASSET_LIFE ( SECURITY_SUB_TYPE_ID, LIFESPAN, GROUP_ID, VERSION_TIME, STATUS ) VALUES (
'AB101', 0, 1, 1063366457637, 'ACTIVE');

INSERT INTO CMS_SECURITY_ASSET_LIFE ( SECURITY_SUB_TYPE_ID, LIFESPAN, GROUP_ID, VERSION_TIME, STATUS ) VALUES (
'AB102', 0, 1, 1063366457647, 'ACTIVE');

INSERT INTO CMS_SECURITY_ASSET_LIFE ( SECURITY_SUB_TYPE_ID, LIFESPAN, GROUP_ID, VERSION_TIME, STATUS ) VALUES (
'AB109', 0, 1, 1063366457607, 'ACTIVE');

INSERT INTO CMS_SECURITY_ASSET_LIFE ( SECURITY_SUB_TYPE_ID, LIFESPAN, GROUP_ID, VERSION_TIME, STATUS ) VALUES (
'AB111', 0, 1, 1063366457607, 'ACTIVE');


-----------------------------------------------------------------------------
-- Step 3: Create transaction record for asset life table
-----------------------------------------------------------------------------
INSERT INTO TRANSACTION
              (TRANSACTION_ID, FROM_STATE, TRANSACTION_TYPE, REFERENCE_ID, STATUS, CREATION_DATE, OPSDESC,
               TO_GROUP_TYPE_ID, LEGAL_ID, TO_GROUP_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TO_USER_ID )
              VALUES
              (('20070201'||REPEAT('0',6-length(RTRIM(CHAR(NEXT VALUE FOR TRX_SEQ))))||RTRIM(CHAR(PREVIOUS VALUE FOR TRX_SEQ+1))) ,'ND', 'COLASSETLIFE', 1, 'ACTIVE', '2007-02-06-10.32.27.000000', 'SYSTEM_CREATE',
              '-999999999', '-999999999', -999999999, -999999999, -999999999, -999999999 );

-----------------------------------------------------------------------------
-- Step 4: Create FAP for asset life module
-----------------------------------------------------------------------------
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400001, 'MaintainAssetLife', 'maker_view_assetlife', 6);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400002, 'MaintainAssetLife', 'maker_edit_assetlife', 6);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400003, 'MaintainAssetLife', 'maker_edit_assetlife_confirm', 6);                                   
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400004, 'MaintainAssetLife', 'maker_close_assetlife', 6);                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400005, 'MaintainAssetLife', 'checker_edit_assetlife', 7);                                         
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400006, 'MaintainAssetLife', 'checker_approve_edit_assetlife', 7);                                 
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400007, 'MaintainAssetLife', 'checker_reject_edit_assetlife', 7);                                  
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400008, 'MaintainAssetLife', 'maker_close_assetlife_confirm', 6);                                  
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400009, 'MaintainAssetLife', 'maker_edit_assetlife_reject', 6);                                    
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400010, 'MaintainAssetLife', 'to_track', 6);                                                       
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400011, 'MaintainAssetLife', 'to_track', 7);                                                       
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400012, 'MaintainAssetLife', 'view', 26);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400013, 'MaintainAssetLife', 'view', 27);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400014, 'MaintainAssetLife', 'view', 14);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400015, 'MaintainAssetLife', 'view', 15);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400016, 'MaintainAssetLife', 'view', 10);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400017, 'MaintainAssetLife', 'view', 11);                                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400018, 'MaintainAssetLife', 'view', 6);                                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (19400019, 'MaintainAssetLife', 'view', 7);                                                           


-----------------------------------------------------------------------------
-- Step 5: Create transaction state matrix for asset life module
-----------------------------------------------------------------------------
INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4401, 'COLASSETLIFE', 'MAKER_UPDATE', 'ND', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4402, 'COLASSETLIFE', 'MAKER_UPDATE', 'DRAFT', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4403, 'COLASSETLIFE', 'MAKER_UPDATE', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4404, 'COLASSETLIFE', 'MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4405, 'COLASSETLIFE', 'MAKER_SAVE', 'ND', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4406, 'COLASSETLIFE', 'MAKER_SAVE', 'DRAFT', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4407, 'COLASSETLIFE', 'MAKER_SAVE', 'REJECTED', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4408, 'COLASSETLIFE', 'MAKER_SAVE', 'ACTIVE', 'DRAFT', 'DRAFT', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4409, 'COLASSETLIFE', 'MAKER_CANCEL', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4410, 'COLASSETLIFE', 'MAKER_CANCEL', 'DRAFT', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4411, 'COLASSETLIFE', 'CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');

INSERT INTO TR_STATE_MATRIX
    ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
VALUES
    (4412, 'COLASSETLIFE', 'CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');

	
-----------------------------------------------------------------------------
-- Step 6: Create transaction to track for asset life module
-----------------------------------------------------------------------------
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('COLASSETLIFE', 'MaintainAssetLife.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain Asset Life', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('COLASSETLIFE', 'MaintainAssetLife.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Maintain Asset Life', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('COLASSETLIFE', 'MaintainAssetLife.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Asset Life', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('COLASSETLIFE', 'MaintainAssetLife.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain Asset Life', null, null);

	
-----------------------------------------------------------------------------
-- Step 7: Create transaction state matrix action for asset life module
-----------------------------------------------------------------------------
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4411, 7, 'Process', 'MaintainAssetLife.do?event=checker_edit_assetlife&TrxId=', 'MaintainAssetLife.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4412, 7, 'Process', 'MaintainAssetLife.do?event=checker_edit_assetlife&TrxId=', 'MaintainAssetLife.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (4403, 6, 'Process', 'MaintainAssetLife.do?event=maker_edit_assetlife_reject&TrxId=', 'MaintainAssetLife.do?event=view');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (4409, 6, 'Close', 'MaintainAssetLife.do?event=maker_close_assetlife&TrxId=');


