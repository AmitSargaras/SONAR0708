----------------------------
-- CMS_STATEMATRIX_ACTION
----------------------------

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3602, 6, 'Process', 'feed_bond_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3603, 6, 'Close', 'feed_bond_list.do?event=readMakerClose&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3604, 7, 'Process', 'feed_bond_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3606, 6, 'Process', 'feed_bond_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3609, 6, 'Close', 'feed_bond_list.do?event=readMakerClose&offset=0&length=10&trxId=');


INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES(104, 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES(104, 10, 'Close', 'CollateralRedirect.do?event=prepare_close&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES(102, 11, 'Process', 'CollateralRedirect.do?event=process&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES(117, 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=');
 
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES(117, 10, 'Close', 'CollateralRedirect.do?event=prepare_close&trxID=');
   
INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(132, 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=', 'CollateralRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(132, 10, 'Close', 'CollateralRedirect.do?event=prepare_close&trxID=', 'CollateralRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(133, 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=', 'CollateralRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(133, 10, 'Close', 'CollateralRedirect.do?event=prepare_close&trxID=', 'CollateralRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(139, 11, 'Process', 'CollateralRedirect.do?event=process&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(146,11,'Process','CollateralRedirect.do?event=process&trxID=',null);

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
values ((select stateid from tr_state_matrix 
	where stateins = 'COL' 
	and operation = 'CHECKER_APPROVE_UPDATE' 
	and fromstate = 'PENDING_CREATE' 
	and tostate = 'ACTIVE'), 11, 'Process', 'CollateralRedirect.do?event=process&trxID=');

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
values ((select stateid from tr_state_matrix 
	where stateins = 'COL' 
	and operation = 'MAKER_SAVE' 
	and fromstate = 'REJECTED_CREATE' 
	and tostate = 'DRAFT'), 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=');

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
values ((select stateid from tr_state_matrix 
	where stateins = 'COL' 
	and operation = 'MAKER_CANCEL' 
	and fromstate = 'REJECTED_CREATE' 
	and tostate = 'CLOSED'), 10, 'Close', 'CollateralRedirect.do?event=prepare_close&trxID=');

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
values ((select stateid from tr_state_matrix 
	where stateins = 'COL' 
	and operation = 'MAKER_CREATE' 
	and fromstate = 'REJECTED_CREATE' 
	and tostate = 'PENDING_CREATE'), 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=');
	
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
(select max(stateid), 10, 'Process', 'CollateralRedirect.do?event=process_update&trxID=' from tr_state_matrix where stateins = 'COL' and fromstate = 'PENDING_PERFECTION');
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
(select max(stateid), 11, 'Process', 'CollateralRedirect.do?event=process&trxID=' from tr_state_matrix where stateins = 'COL' and fromstate = 'PENDING_RETRY');	
   
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1806, 7, 'Process', 'SRPCountry.do?event=checker_edit_read&TrxId=', 'SRPCountry?event=checker_view');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1807, 7, 'Process', 'SRPCountry.do?event=checker_edit_read&TrxId=', 'SRPCountry?event=checker_view');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1808, 6, 'Close', 'SRPCountry.do?event=srpcountry_maker_close&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1810, 6, 'Process', 'SRPCountry.do?event=maker_edit_srpcountry_read_rejected&TrxId=', 'SRPCountry.do?event=maker_view');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (707, 6, 'Process', 'SRPGlobal.do?event=maker_edit_srpglobal_read_rejected&TrxId=', 'SRPCountry.do?event=maker_view');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (708, 6, 'Close', 'SRPGlobal.do?event=srpglobal_maker_close&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (710, 7, 'Process', 'SRPGlobal.do?event=checker_edit_read&TrxId=', 'SRPGlobal?event=checker_view');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (711, 7, 'Process', 'SRPGlobal.do?event=checker_edit_read&TrxId=', 'SRPGlobal?event=checker_view');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4002, 6, 'Process', 'feed_exchange_rate_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4002, 6, 'Process', 'feed_exchange_rate_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4003, 6, 'Close', 'feed_exchange_rate_list.do?event=readMakerClose&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4004, 7, 'Process', 'feed_exchange_rate_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4006, 6, 'Process', 'feed_exchange_rate_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (4009, 6, 'Close', 'feed_exchange_rate_list.do?event=readMakerClose&offset=0&length=10&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (7502, 6, 'Process', 'feed_gold_list.do?event=readMakerEdit&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (7503, 6, 'Close', 'feed_gold_list.do?event=readMakerClose&offset=0&length=10&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (7504, 7, 'Process', 'feed_gold_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (7506, 6, 'Process', 'feed_gold_list.do?event=readMakerEdit&offset=0&length=10&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES (7509, 6, 'Close', 'feed_gold_list.do?event=readMakerClose&offset=0&length=10&trxId=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 24, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 24, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');


INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 24, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 24, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');


INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(429, 25, 'Process', 'LimitRedirect.do?event=process&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 10, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 10, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 10, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 10, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(429, 11, 'Process', 'LimitRedirect.do?event=process&trxID=', null);



INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(433, 25, 'Process', 'LimitRedirect.do?event=process&isDelete=true&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(433, 11, 'Process', 'LimitRedirect.do?event=process&isDelete=true&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 24, 'Process', 'LimitRedirect.do?event=process_delete&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 24, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 10, 'Process', 'LimitRedirect.do?event=process_delete&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 10, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');


INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 26, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(421, 26, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 26, 'Process', 'LimitRedirect.do?event=process_update&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(422, 26, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(429, 27, 'Process', 'LimitRedirect.do?event=process&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(433, 27, 'Process', 'LimitRedirect.do?event=process&isDelete=true&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 26, 'Process', 'LimitRedirect.do?event=process_delete&trxID=', null);

INSERT INTO CMS_STATEMATRIX_ACTION(STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES(435, 26, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=', 'LimitRedirect.do?event=track&trxID=');


Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3504, 11, 'Process', 'Limits.do?event=checker_read_co_borrower_limits&trxID=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3508, 10, 'Process', 'Limits.do?event=re_process_co_borrower_limits&trxID=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3509, 10, 'Close', 'Limits.do?event=prepare_close_co_borrower_limits&trxID=');

   
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (406, 11, 'Process', 'LimitRedirect.do?event=process&trxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (409, 10, 'Process', 'LimitRedirect.do?event=process_update&trxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (410, 10, 'Close', 'LimitRedirect.do?event=prepare_close&trxID=');      

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3902, 10, 'Process', 'feed_property_index_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3902, 10, 'Process', 'feed_property_index_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3903, 10, 'Close', 'feed_property_index_list.do?event=readMakerClose&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3904, 11, 'Process', 'feed_property_index_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3906, 10, 'Process', 'feed_property_index_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3909, 10, 'Close', 'feed_property_index_list.do?event=readMakerClose&offset=0&length=10&trxId=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3802, 6, 'Process', 'feed_stock_index_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3803, 6, 'Close', 'feed_stock_index_list.do?event=readMakerClose&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3804, 7, 'Process', 'feed_stock_index_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3806, 6, 'Process', 'feed_stock_index_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3809, 6, 'Close', 'feed_stock_index_list.do?event=readMakerClose&offset=0&length=10&trxId=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (802, 6, 'Process', 'feed_stock_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (803, 6, 'Close', 'feed_stock_list.do?event=readMakerClose&offset=10&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (804, 7, 'Process', 'feed_stock_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (806, 6, 'Process', 'feed_stock_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (809, 6, 'Close', 'feed_stock_list.do?event=readMakerClose&offset=10&length=10&trxId=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1103, 9, 'Process', 'bizstructure.do?event=checker_add_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1104, 8, 'Process', 'bizstructure.do?event=rejected_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1107, 8, 'Close', 'bizstructure.do?event=rejected_read&Cncl=cncl&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1111, 9, 'Process', 'bizstructure.do?event=checker_edit_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1113, 9, 'Process', 'bizstructure.do?event=checker_delete_read&TrxId=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3702, 6, 'Process', 'feed_unit_trust_list.do?event=readMakerEdit&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3703, 6, 'Close', 'feed_unit_trust_list.do?event=readMakerClose&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3704, 7, 'Process', 'feed_unit_trust_list.do?event=readCheckerApproveReject&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3706, 6, 'Process', 'feed_unit_trust_list.do?event=readMakerEdit&offset=0&length=10&trxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (3709, 6, 'Close', 'feed_unit_trust_list.do?event=readMakerClose&offset=0&length=10&trxId=');

Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1002, 9, 'Process', 'user.do?event=checker_add_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1004, 8, 'Process', 'user.do?event=rejected_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1007, 8, 'Close', 'user.do?event=rejected_read&Cncl=cncl&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1011, 9, 'Process', 'user.do?event=checker_edit_read&TrxId=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
 Values
   (1013, 9, 'Process', 'user.do?event=checker_delete_read&TrxId=');   
   
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (545, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (546, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (512, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (542, 10, 'Process', 'LimitProfileRedirect.do?event=process_update&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (544, 10, 'Process', 'LimitProfileRedirect.do?event=process_update&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (554, 10, 'Process', 'LimitProfileRedirect.do?event=process_delete&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (550, 10, 'Close', 'LimitProfileRedirect.do?event=close&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (517, 10, 'Close', 'LimitProfileRedirect.do?event=close&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (552, 10, 'Close', 'LimitProfileRedirect.do?event=close&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (547, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (548, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (513, 11, 'Process', 'LimitProfileRedirect.do?event=process&TrxId=');   
   
   
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5803, 6, 'Process', 'MaintainMFTemplate.do?event=process_update&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5806, 6, 'Process', 'MaintainMFTemplate.do?event=process_update&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5808, 6, 'Process', 'MaintainMFTemplate.do?event=process_delete&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5814, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5815, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5816, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5817, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5818, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5819, 7, 'Process', 'MaintainMFTemplate.do?event=process&trxID=', 'MaintainMFTemplate.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5810, 6, 'Close', 'MaintainMFTemplate.do?event=prepare_close&trxID=');
   
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5812, 6, 'Close', 'MaintainMFTemplate.do?event=prepare_close&trxID=');
  
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5813, 6, 'Close', 'MaintainMFTemplate.do?event=prepare_close&trxID=');
   
   
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1501, 5, 'Process', 'CheckListReceipt.do?event=process&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1501, 11, 'Process', 'CheckListReceipt.do?event=process&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1503, 4, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1503, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1504, 4, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1504, 10, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1506, 5, 'Process', 'CheckListReceipt.do?event=process&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1506, 11, 'Process', 'CheckListReceipt.do?event=process&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1519, 10, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1519, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1519, 4, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1519, 10, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1521, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1521, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1521, 4, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1526, 4, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1526, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1526, 4, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1526, 10, 'Process', 'CheckListReceipt.do?event=edit_staging_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1527, 4, 'Close', 'CheckListReceipt.do?event=close_checklist_itemInsert into CMS_STATEMATRIX_ACTION=', 'CheckListReceipt.do?event=to_track   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1527, 4, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1527, 10, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1527, 10, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');
Insert into cms_statematrix_action
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
 Values
   (1527, 4, 'Close', 'CheckListReceipt.do?event=close_checklist_item&custTypeTrxID=', 'CheckListReceipt.do?event=to_track&custTypeTrxID=');      

   
   

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5911, 11, 'Process', 'MarketabilityFactor.do?event=process&trxID=', 'MarketabilityFactor.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5912, 11, 'Process', 'MarketabilityFactor.do?event=process&trxID=', 'MarketabilityFactor.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5913, 11, 'Process', 'MarketabilityFactor.do?event=process&trxID=', 'MarketabilityFactor.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5914, 11, 'Process', 'MarketabilityFactor.do?event=process&trxID=', 'MarketabilityFactor.do?event=track&trxID=');
 
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5908, 10, 'Close', 'MarketabilityFactor.do?event=maker_close_mfchecklist&trxID=');
   
INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL)
VALUES
   (5910, 10, 'Close', 'MarketabilityFactor.do?event=maker_close_mfchecklist&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5906, 10, 'Process', 'MarketabilityFactor.do?event=process_update&trxID=', 'MarketabilityFactor.do?event=track&trxID=');

INSERT INTO CMS_STATEMATRIX_ACTION
   (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL, TOTRACK_URL)
VALUES
   (5903, 10, 'Process', 'MarketabilityFactor.do?event=process_update&trxID=', 'MarketabilityFactor.do?event=track&trxID=');
         
------------------------------
-- CMS_TRX_TOTRACK
------------------------------

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Bond Feed', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Bond Feed');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Bond Feed', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Bond Feed', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Bond Feed');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
	('BOND_FEED_GROUP', 'feed_bond_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Bond Feed');


Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COBORROWER_LIMIT', 'Limits.do?event=to_track_coborrower&trxID=', 'REJECTED', 'Rejected', 'Co-borrower Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COBORROWER_LIMIT', 'Limits.do?event=to_track_coborrower&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Co-borrower Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COBORROWER_LIMIT', 'Limits.do?event=to_track_coborrower&trxID=', 'CLOSED', 'Closed', 'Co-borrower Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COBORROWER_LIMIT', 'Limits.do?event=to_track_coborrower&trxID=', 'ACTIVE', 'Approved', 'Co-borrower Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'ACTIVE', 'Approved', 'Update Security Details', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'DELETED', 'Deleted', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'PENDING_DELETE', 'Pending Delete', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'ACTIVE', 'Closed', 'Update Security Details', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'REJECTED', 'Rejected', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'ACTIVE', 'Closed', 'Update Security Details', 'REJECTED');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COL', 'CollateralRedirect.do?event=track&trxID=', 'DRAFT', 'Draft', 'Update Security Details');
   
insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type) values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Update Security Details');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type) values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'REJECTED_CREATE', 'Rejected', 'Update Security Details');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'LOADING', 'Loading', 'Update Security Details');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'PENDING_RETRY', 'Pending Retry', 'Update Security Details');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type, from_state)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'ACTIVE', 'Approved', 'Update Security Details', 'PENDING_CREATE');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'PENDING_PERFECTION', 'Pending Perfection', 'Update Security Details');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type, from_state)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'ACTIVE', 'Implemented', 'Update Security Details', 'LOADING');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('COL', 'CollateralRedirect.do?event=track&trxID=', 'LOADING_DELETE', 'Loading Delete', 'Update Security Details');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLPARAM', 'SRPCountry.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain CRP - Country');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLPARAM', 'SRPCountry.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain CRP - Country');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLPARAM', 'SRPCountry.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Maintain CRP - Country');
INSERT INTO CMS_TRX_TOTRACK 
	( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE ) 
VALUES 
	( 'COLPARAM', 'SRPCountry.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain CRP - Country', NULL, NULL);     
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLSUBTYPE', 'SRPGlobal.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain CRP - Global');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLSUBTYPE', 'SRPGlobal.do?event=to_track&TrxId=', 'DRAFT', 'Draft', 'Maintain CRP - Global');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('COLSUBTYPE', 'SRPGlobal.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Maintain CRP - Global');
insert into cms_trx_totrack
	(transaction_type, totrack_url, curr_state, user_state, user_trx_type)
 values
	('COLSUBTYPE', 'SRPGlobal.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Maintain CRP - Global');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Forex feed', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Forex feed', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Forex feed', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Forex feed');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Forex feed');
insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
	('FOREX_FEED_GROUP', 'feed_exchange_rate_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Forex Feed');
 
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Gold Feed', 'PENDING_UPDATE');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Gold Feed', 'REJECTED');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Gold Feed', 'DRAFT');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Gold Feed');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Gold Feed');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES ('GOLD_FEED_GROUP', 'feed_gold_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Gold Feed');
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('LIMIT', 'Limits.do?event=to_track&trxID=', 'REJECTED', 'Rejected', 'Update Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMIT', 'Limits.do?event=to_track&trxID=', 'ACTIVE', 'Approved', 'Update Limit', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('LIMIT', 'Limits.do?event=to_track&trxID=', 'CLOSED', 'Closed', 'Update Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('LIMIT', 'Limits.do?event=to_track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Update Limit');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMIT', 'Limits.do?event=to_track&trxID=', 'ACTIVE', 'Closed', 'Update Limit', 'REJECTED');
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Update Customer Details', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Update Customer Details', 'ACTIVE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'CLOSED', 'Closed', 'Update Customer Details', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Update Customer Details', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'ACTIVE', 'Approved', 'Update Customer Details', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'CLOSED', 'Closed', 'Update Customer Details', 'ACTIVE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Update Customer Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('LIMITPROFILE', 'CustomerProcess.do?event=to_track&TrxId=', 'REJECTED', 'Rejected', 'Update Customer Details', 'REJECTED');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Property index feed', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Property index feed', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Property index feed');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Property index feed');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Property index feed', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('PROPIDX_FEED_GROUP', 'feed_property_index_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Property index feed');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Stock index group');   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Stock index group', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Stock index group', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Stock index group');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Stock index group', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
	('STOCKIDX_FEED_GROUP', 'feed_stock_index_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Stock index group');
 
   
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Stock feed group', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Stock feed group');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Stock feed group', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Stock feed group', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Stock feed group');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
	('STOCK_FEED_GROUP', 'feed_stock_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Stock feed group');
 

   
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Team');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('TEAM', 'bizstructure.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'Maintain Team');

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'DRAFT', 'Draft', 'Unit trust');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Unit trust');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Unit trust', 'PENDING_UPDATE');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Unit trust', 'DRAFT');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE)
 Values
   ('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'ACTIVE', 'Closed', 'Unit trust', 'REJECTED');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
	('UNITTRUST_FEED_GROUP', 'feed_unit_trust_list.do?event=view&trxId=', 'REJECTED', 'Rejected', 'Unit trust');
 
   
   
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'ACTIVE', 'Approved', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'CLOSED', 'Closed', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'REJECTED', 'Rejected', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'DELETED', 'Deleted', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('USER', 'user.do?event=rejected_delete_read&toTrack=yes&TrxId=', 'PENDING_DELETE', 'Pending Delete', 'Maintain User');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('VAL', 'CANCELLED', 'Cancelled', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('VAL', 'ACTIVE', 'Approved', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('VAL', 'CLOSED', 'Closed', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('VAL', 'PENDING_CREATE', 'Pending Create', 'Update Security Details');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, CURR_STATE, USER_STATE, USER_TRX_TYPE)
 Values
   ('VAL', 'PENDING_UPDATE', 'Pending Update', 'Update Security Details');
   
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'ACTIVE', 'Approved', 'Maintain Marketability Factor Template', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'DRAFT', 'Draft', 'Maintain Marketability Factor Template', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Marketability Factor Template', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Marketability Factor Template', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Marketability Factor Template', null, null);
  
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Marketability Factor Template', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Marketability Factor Template', null, null);
 
INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_TEMPLATE', 'MaintainMFTemplate.do?event=track&trxID=', 'REJECTED_DELETE', 'Rejected Delete', 'Maintain Marketability Factor Template', null, null);   

Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'DRAFT', 'Draft', 'Update Recurrent Document', 'REC_CHECKLIST_REC');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'DRAFT', 'Draft', 'Maintain Recurrent Checklist', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'ACTIVE', 'Approved', 'Update Recurrent Checklist', 'REJECTED', 'REC_CHECKLIST_REC');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'CLOSED', 'Closed', 'Update Recurrent Checklist', 'REC_CHECKLIST_REC');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'ACTIVE', 'Approved', 'Update Recurrent Checklist', 'PENDING_UPDATE', 'REC_CHECKLIST_REC');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'PENDING_UPDATE', 'Pending Update', 'Update Recurrent Checklist', 'REC_CHECKLIST_REC');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'ACTIVE', 'Approved', 'Maintain Recurrent Checklist', 'REJECTED', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'ACTIVE', 'Approved', 'Maintain Recurrent Checklist', 'PENDING_CREATE', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Recurrent Checklist', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, FROM_STATE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'ACTIVE', 'Approved', 'Maintain Recurrent Checklist', 'PENDING_UPDATE', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'CLOSED', 'Closed', 'Maintain Recurrent Checklist', 'REC_CHECKLIST');
Insert into cms_trx_totrack
   (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
 Values
   ('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Recurrent Checklist', 'REC_CHECKLIST');   	
Insert into cms_trx_totrack
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
Values
('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'REJECTED', 'Rejected', 'Update Recurrent Checklist', 'REC_CHECKLIST_REC');
 
Insert into cms_trx_totrack
(TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE)
Values
('RECURRENT_CHECKLIST', 'CheckListReceipt.do?event=to_track&custTypeTrxID=', 'REJECTED', 'Rejected', 'Maintain Recurrent Checklist', 'REC_CHECKLIST'); 	
	

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_CHECKLIST', 'MarketabilityFactor.do?event=track&trxID=', 'ACTIVE', 'Approved', 'Maintain Marketability Factor Checklist', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_CHECKLIST', 'MarketabilityFactor.do?event=track&trxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Marketability Factor Checklist', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_CHECKLIST', 'MarketabilityFactor.do?event=track&trxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Marketability Factor Checklist', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_CHECKLIST', 'MarketabilityFactor.do?event=track&trxID=', 'REJECTED_CREATE', 'Rejected Create', 'Maintain Marketability Factor Checklist', null, null);

INSERT INTO CMS_TRX_TOTRACK
    ( TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE,FROM_STATE, TRANSACTION_SUBTYPE )
VALUES
    ('MF_CHECKLIST', 'MarketabilityFactor.do?event=track&trxID=', 'REJECTED_UPDATE', 'Rejected Update', 'Maintain Marketability Factor Checklist', null, null);


INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8002, 9, 'Process', 'MaintainFunction.do?event=read_checker_approve_reject&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8003, 9, 'Process', 'MaintainFunction.do?event=read_checker_approve_reject&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8006, 8, 'Close', 'MaintainFunction.do?event=read_checker_close&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8008, 8, 'Process', 'MaintainFunction.do?event=submit&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES
(8007, 8, 'Process', 'MaintainFunction.do?event=read_maker_process&trxId='); 

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Function');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'PENDING_CREATE', 'Pending Create', 'Maintain Function');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'DRAFT', 'Draft', 'Maintain Function');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'REJECTED', 'Rejected', 'Maintain Function');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, FROM_STATE,USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'ACTIVE', 'PENDING_UPDATE', 'Approved', 'Maintain Function');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, FROM_STATE,USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'ACTIVE', 'PENDING_CREATE', 'Approved', 'Maintain Function');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, FROM_STATE,USER_STATE, USER_TRX_TYPE) VALUES 
('TEAM_FUNCTION_GRP', 'MaintainFunction.do?event=view&isTrack=Y&trxId=', 'ACTIVE', 'REJECTED', 'Closed', 'Maintain Function');


COMMIT WORK;

