--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Credit Risk Parameter - Unit Trust module
-- 2. Credit Risk Paramter - Share module
-- 3. Policy Cap Module
--------------------------------------------------------------------------------------------------------------------------------------------------------------


---========================================================================================================--
-- Credit Risk Parameter: Unit Trust module
---========================================================================================================--

-- Step 1 Create transaction to track for credit risk parameter - unit trust module
insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('CRP_UNIT_TRUST', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=', 'ACTIVE', 'Approved', 'Maintain Credit Risk Parameter - Unit Trust', null, null);
insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('CRP_UNIT_TRUST', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=', 'REJECTED', 'Rejected', 'Maintain Credit Risk Parameter - Unit Trust', null, null);
insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('CRP_UNIT_TRUST', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=', 'CLOSED', 'Closed', 'Maintain Credit Risk Parameter - Unit Trust', null, null);
insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('CRP_UNIT_TRUST', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Credit Risk Parameter - Unit Trust', null, null);



-- Step 2 Create transaction state matrix for credit risk parameter - unit trust module
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4800, 'CRP_UNIT_TRUST', 'CREDIT_RISK_PARAM_MAKER_CLOSE', 'REJECTED', 'ACTIVE', 'ACTIVE', '1', '1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4801, 'CRP_UNIT_TRUST', 'CREDIT_RISK_PARAM_MAKER_UPDATE', 'ACTIVE', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4802, 'CRP_UNIT_TRUST', 'CREDIT_RISK_PARAM_CHECKER_APPROVE', 'PENDING_UPDATE', 'ACTIVE', 'ACTIVE', '1', '1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4803, 'CRP_UNIT_TRUST', 'CREDIT_RISK_PARAM_CHECKER_REJECT', 'PENDING_UPDATE', 'REJECTED', 'REJECTED', '1', '1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (4804, 'CRP_UNIT_TRUST', 'CREDIT_RISK_PARAM_MAKER_UPDATE_REJ', 'REJECTED', 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1');

-- Step 3 Create transaction state matrix action for credit risk parameter - unit trust module
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4802, 7, 'Process' , 'CreditRiskParamUnitTrust.do?event=readCheckerApproveReject&offset=0&length=10&trxId=', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4804, 6, 'Process' , 'CreditRiskParamUnitTrust.do?event=readMakerEdit&offset=0&length=10&trxId=', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=');
insert into CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
values (4800, 6, 'Close' , 'CreditRiskParamUnitTrust.do?event=readMakerClose&offset=0&length=10&trxId=', 'CreditRiskParamUnitTrust.do?event=to_track&trxId=');


-- Step 4 Create FAP for credit risk param - unit trust module 
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400001, 'CreditRiskParamUnitTrust', 'selectMakerEdit', 6);                                         
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400002, 'CreditRiskParamUnitTrust', 'prepare', 6);                                                 
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400003, 'CreditRiskParamUnitTrust', 'paginate', 6);                                                
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400004, 'CreditRiskParamUnitTrust', 'submit', 6);                                                  
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400005, 'CreditRiskParamUnitTrust', 'readCheckerApproveReject', 7);                                
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400006, 'CreditRiskParamUnitTrust', 'approve', 7);                                                 
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400007, 'CreditRiskParamUnitTrust', 'reject', 7);                                                  
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400008, 'CreditRiskParamUnitTrust', 'readMakerClose', 6);                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400009, 'CreditRiskParamUnitTrust', 'close', 6);                                                   
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400010, 'CreditRiskParamUnitTrust', 'listMakerClose', 6);                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400011, 'CreditRiskParamUnitTrust', 'readMakerEdit', 6);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400012, 'CreditRiskParamUnitTrust', 'listCheckerApproveReject', 7);                                
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400013, 'CreditRiskParamUnitTrust', 'to_track', 6);                                                
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400014, 'CreditRiskParamUnitTrust', 'list_to_track', 6);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400015, 'CreditRiskParamUnitTrust', 'to_track', 7);                                                
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400016, 'CreditRiskParamUnitTrust', 'list_to_track', 7);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400017, 'CreditRiskParamUnitTrust', 'selectMakerEdit', 7);                                         
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400018, 'CreditRiskParamUnitTrust', 'list_to_track', 7);                                           
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400019, 'CreditRiskParamUnitTrust', 'selectMakerEdit', 15);                                        
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400020, 'CreditRiskParamUnitTrust', 'to_track', 15);                                               
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400021, 'CreditRiskParamUnitTrust', 'selectMakerEdit', 14);                                        
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400022, 'CreditRiskParamUnitTrust', 'to_track', 14);                                               
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400023, 'CreditRiskParamUnitTrust', 'list_to_track', 14);                                          
 Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20400024, 'CreditRiskParamUnitTrust', 'list_to_track', 15);                                          
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'selectMakerEdit', 10 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'to_track', 10 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'list_to_track', 10 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'selectMakerEdit', 11 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'to_track', 11 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'list_to_track', 11 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'selectMakerEdit', 13 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'to_track', 13 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'list_to_track', 13 from cms_function_access where action = 'CreditRiskParamUnitTrust' group by action;


-- Insert initial transaction records for all countries
insert into TRANSACTION (
	TRANSACTION_ID, TRANSACTION_TYPE, FROM_STATE, USER_ID, REFERENCE_ID, 
	STATUS, STAGING_REFERENCE_ID, TEAM_ID, TRX_REFERENCE_ID, TEAM_TYPE_ID, 
	TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID)
select CHAR(20070201000000 + NEXT VALUE FOR TRX_SEQ), 'CRP_UNIT_TRUST', trx.FROM_STATE, trx.USER_ID, trx.REFERENCE_ID, 
	trx.STATUS, trx.STAGING_REFERENCE_ID, trx.TEAM_ID, trx.TRX_REFERENCE_ID, trx.TEAM_TYPE_ID, 
	trx.TO_GROUP_TYPE_ID, trx.TO_GROUP_ID, trx.TO_USER_ID, trx.LEGAL_ID, trx.CUSTOMER_ID, trx.LIMIT_PROFILE_ID 
from TRANSACTION trx 
where trx.TRANSACTION_TYPE = 'UNITTRUST_FEED_GROUP'
and trx.REFERENCE_ID in  
(	select grp.FEED_GROUP_ID from CMS_FEED_GROUP grp 
	where grp.GROUP_TYPE = 'UNIT_TRUST'	
);



---========================================================================================================--
-- Credit Risk Parameter: Share Counter Module
---========================================================================================================--
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4700, 'CRP_SHARE_COUNTER', 'CREDIT_RISK_PARAM_MAKER_UPDATE'     , 'ACTIVE'        , 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4701, 'CRP_SHARE_COUNTER', 'CREDIT_RISK_PARAM_MAKER_UPDATE_REJ' , 'REJECTED'      , 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4702, 'CRP_SHARE_COUNTER', 'CREDIT_RISK_PARAM_MAKER_CLOSE'      , 'REJECTED'      , 'ACTIVE'        , 'ACTIVE'        , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4703, 'CRP_SHARE_COUNTER', 'CREDIT_RISK_PARAM_CHECKER_APPROVE'  , 'PENDING_UPDATE', 'ACTIVE'        , 'ACTIVE'        , '1', '1'); 
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) VALUES ( 4704, 'CRP_SHARE_COUNTER', 'CREDIT_RISK_PARAM_CHECKER_REJECT'   , 'PENDING_UPDATE', 'REJECTED'      , 'REJECTED'      , '1', '1');     

INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'CRP_SHARE_COUNTER', 'MaintainShareCounter.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Marketable Securities - Share Counters', NULL, NULL); 
INSERT INTO CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) VALUES ( 'CRP_SHARE_COUNTER', 'MaintainShareCounter.do?event=to_track&TrxId=', 'REJECTED'      , 'Rejected'      , 'Marketable Securities - Share Counters', NULL, NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4703, 7, 'Process', 'MaintainShareCounter.do?event=checker_process&TrxId='                            , NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4701, 6, 'Process', 'MaintainShareCounter.do?event=maker_share_counter_prepare_update_rejected&TrxId=', NULL); 
INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) VALUES ( 4702, 6, 'Close'  , 'MaintainShareCounter.do?event=maker_share_counter_prepare_close&TrxId='          , NULL); 


INSERT INTO TRANSACTION ( TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, REFERENCE_ID, STATUS, OPSDESC, TEAM_ID, TRX_REFERENCE_ID, LEGAL_ID, CUSTOMER_ID, LIMIT_PROFILE_ID, TEAM_TYPE_ID, TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID )
SELECT CHAR(20070201000000 + NEXT VALUE FOR TRX_SEQ), 'ND' , -999999999 , 'CRP_SHARE_COUNTER' , FEED_GROUP_ID , 'ACTIVE' , 'SYSTEM_CREATE', -999999999 , -999999999,'-999999999', -999999999,-999999999,2, CHAR(-999999999),-999999999,-999999999
FROM CMS_FEED_GROUP WHERE GROUP_TYPE = 'STOCK';



---========================================================================================================--
-- Credit Risk Parameter: Policy Cap Module
---========================================================================================================--
-------------------------------------------------------------------------------
-- 1. Insert into function access
-------------------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100001, 'PolicyCap', 'prepare', 6);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100002, 'PolicyCap', 'read', 6);                                                                   
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100003, 'PolicyCap', 'maker_edit', 6);                                                             
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100004, 'PolicyCap', 'maker_update', 6);                                                           
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100005, 'PolicyCap', 'checker_process', 7);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100006, 'PolicyCap', 'checker_approve', 7);                                                        
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100007, 'PolicyCap', 'checker_reject', 7);                                                         
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100008, 'PolicyCap', 'maker_close', 6);                                                            
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100009, 'PolicyCap', 'to_track', 6);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100010, 'PolicyCap', 'to_track', 7);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100011, 'PolicyCap', 'prepare', 15);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100012, 'PolicyCap', 'read', 15);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100013, 'PolicyCap', 'prepare', 14);                                                               
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100014, 'PolicyCap', 'read', 14);                                                                  
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100015, 'PolicyCap', 'prepare', 7);                                                                
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (20100016, 'PolicyCap', 'read', 7);                                                                   
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'prepare', 10 from cms_function_access where action = 'PolicyCap' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'read', 10 from cms_function_access where action = 'PolicyCap' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'prepare', 11 from cms_function_access where action = 'PolicyCap' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'read', 11 from cms_function_access where action = 'PolicyCap' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'prepare', 13 from cms_function_access where action = 'PolicyCap' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'read', 13 from cms_function_access where action = 'PolicyCap' group by action;

-------------------------------------------------------------------------------
-- 2. Insert into transaction state matrix
-------------------------------------------------------------------------------
INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) 
VALUES ( 4900, 'POLICY_CAP', 'MAKER_UPDATE' , 'ACTIVE' , 'PENDING_UPDATE', 'PENDING_UPDATE', '1', '1'); 

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) 
VALUES ( 4901, 'POLICY_CAP', 'CHECKER_APPROVE' , 'PENDING_UPDATE', 'ACTIVE' , 'ACTIVE', '1', '1'); 

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) 
VALUES ( 4902, 'POLICY_CAP', 'CHECKER_REJECT' , 'PENDING_UPDATE', 'REJECTED' , 'REJECTED', '1', '1'); 

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) 
VALUES ( 4903, 'POLICY_CAP', 'MAKER_UPDATE' , 'REJECTED', 'PENDING_UPDATE' , 'PENDING_UPDATE', '1', '1'); 

INSERT INTO TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP ) 
VALUES ( 4904, 'POLICY_CAP', 'MAKER_CLOSE' , 'REJECTED', 'ACTIVE' , 'ACTIVE', '1', '1'); 


-------------------------------------------------------------------------------
-- 3. CMS Trx To Track
-------------------------------------------------------------------------------
--DELETE FROM CMS_TRX_TOTRACK WHERE TRANSACTION_TYPE = 'POLICY_CAP' ;

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('POLICY_CAP', 'PolicyCap.do?event=to_track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Credit Risk Parameter - Policy Cap', null, null);

insert into CMS_TRX_TOTRACK ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
values ('POLICY_CAP', 'PolicyCap.do?event=to_track&trxID=', 'REJECTED', 'Rejected', 'Maintain Credit Risk Parameter - Policy Cap', null, null);


-------------------------------------------------------------------------------
-- 4. CMS State matrix action
-------------------------------------------------------------------------------
-- delete old data if any
--DELETE FROM CMS_STATEMATRIX_ACTION WHERE URL LIKE 'PolicyCap.do?event=%' ;

INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 4901, 7, 'Process', 'PolicyCap.do?event=checker_process&trxID=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 4903, 6, 'Process', 'PolicyCap.do?event=maker_edit&isRejected=Y&trxID=', NULL); 

INSERT INTO CMS_STATEMATRIX_ACTION ( STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL ) 
VALUES ( 4903, 6, 'Close', 'PolicyCap.do?event=read&isRejected=Y&trxID=', NULL); 


-------------------------------------------------------------------------------
-- 5. Setup data
-------------------------------------------------------------------------------
-- remove any existing data
-- delete from cms_policy_cap;
-- delete from cms_stage_policy_cap;
-- delete from transaction where transaction_type='POLICY_CAP';

CREATE PROCEDURE SETUP_POLICY_CAP 
LANGUAGE SQL
SPECIFIC POLICYCAP_SETUP
BEGIN

	DECLARE ref_id BIGINT;--
	DECLARE group_id BIGINT;--
  DECLARE policycap_id BIGINT;--
	
    for rec AS select stkex.STOCK_EXCHANGE, stkex.COUNTRY_ISO_CODE country, curr.CUR_CRRNCY_ISO_CODE CURRENCY
                 from cms_stock_exchange stkex, sci_currency curr
                 where stkex.COUNTRY_ISO_CODE = curr.CUR_CNTRY_ISO_CODE
    DO
	for bank As select ccce.ENTRY_CODE ENTRY_CODE
			from COMMON_CODE_CATEGORY_ENTRY ccce
			where (ccce.CATEGORY_CODE = 'BANK_ENTITY_GROUP' OR ccce.CATEGORY_CODE = 'BANK_ENTITY')
			order by ccce.ENTRY_CODE
	DO
		SET group_id = format_key(current timestamp, next value for POLICY_CAP_GRP_SEQ);--
		
		insert into CMS_POLICY_CAP_GROUP (POLICY_CAP_GROUP_ID, STOCK_EXCHANGE, BANK_ENTITY, VERSION_TIME)
		values (group_id, rec.STOCK_EXCHANGE, bank.ENTRY_CODE, 0);--
		
		insert into CMS_STAGE_POLICY_CAP_GROUP (POLICY_CAP_GROUP_ID, STOCK_EXCHANGE, BANK_ENTITY, VERSION_TIME)
		values (group_id, rec.STOCK_EXCHANGE, bank.ENTRY_CODE, 0);--
			
		for board AS select cce.entry_code boardcode 
				from COMMON_CODE_CATEGORY_ENTRY cce 
				where cce.category_code = 'BOARD_TYPE'
				and cce.ref_entry_code = rec.STOCK_EXCHANGE
		DO
			SET policycap_id = format_key(current timestamp, next value for POLICY_CAP_SEQ);--

			insert into CMS_POLICY_CAP (POLICY_CAP_ID, BOARD, 
					MAX_TRADE_CAP_NON_FI, MAX_COLLATERAL_CAP_NON_FI, QUOTA_COLLATERAL_CAP_NON_FI, 
					MAX_COLLATERAL_CAP_FI, QUOTA_COLLATERAL_CAP_FI, LIQUID_MOA,ILLIQUID_MOA,
					MAX_CAP_PRICE, CURRENCY, GROUP_ID,CMS_REF_ID,VERSION_TIME, POLICY_CAP_GROUP_ID)
			values( policycap_id, board.boardcode, 
			-1, -1, -1, -1, -1, -1, -1,
			-1, rec.CURRENCY, -1, policycap_id, 0, group_id);--

			insert into CMS_STAGE_POLICY_CAP (POLICY_CAP_ID, BOARD, 
					MAX_TRADE_CAP_NON_FI, MAX_COLLATERAL_CAP_NON_FI, QUOTA_COLLATERAL_CAP_NON_FI, 
					MAX_COLLATERAL_CAP_FI, QUOTA_COLLATERAL_CAP_FI, LIQUID_MOA,ILLIQUID_MOA,
					MAX_CAP_PRICE, CURRENCY, GROUP_ID,CMS_REF_ID,VERSION_TIME, POLICY_CAP_GROUP_ID)
			values( policycap_id, board.boardcode, 
			-1, -1, -1, -1, -1, -1, -1,
			-1, rec.CURRENCY, -1, policycap_id, 0, group_id);--
				
				
		end FOR;--

		--update transaction for each group
		insert into transaction (TRANSACTION_ID, FROM_STATE, USER_ID, TRANSACTION_TYPE, CREATION_DATE, 
				TRANSACTION_DATE, REFERENCE_ID, STATUS, STAGING_REFERENCE_ID, TEAM_ID, VERSION, REMARKS, TRX_REFERENCE_ID, 
				OPSDESC, LEGAL_NAME, LEGAL_ID, CUSTOMER_NAME, CUSTOMER_ID, TRX_ORIGIN_COUNTRY, TRX_ORIGIN_ORGANISATION, 
				LIMIT_PROFILE_ID, TRX_SEGMENT, USER_INFO, CUR_TRX_HISTORY_ID, TEAM_TYPE_ID, TRANSACTION_SUBTYPE, 
				TO_GROUP_TYPE_ID, TO_GROUP_ID, TO_USER_ID, DEAL_NO) 
		values (CHAR(format_key(current timestamp, next value for trx_seq)), 'ND', -999999999, 'POLICY_CAP', current timestamp, 
				current timestamp, group_id, 'ACTIVE', group_id, -999999999, null, 'PolicyCap SetUp', -999999999, 
				'SYSTEM_UPDATE',  null,  null, null, -999999999, null, null,
				-999999999, null, null,  '-999999999', -999999999, null,  
				'-999999999', -999999999, -999999999, null);--                
						
	end FOR;--
		
    end FOR;--
end;

CALL SETUP_POLICY_CAP;

DROP PROCEDURE SETUP_POLICY_CAP;