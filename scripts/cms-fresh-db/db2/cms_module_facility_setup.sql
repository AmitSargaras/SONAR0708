
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8603, 10, 'Process', 'FacilityMaster.do?event=process&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8603, 10, 'Close', 'FacilityMaster.do?event=prepare_close&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8602, 10, 'Process', 'FacilityMaster.do?event=process&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8602, 10, 'Close', 'FacilityMaster.do?event=prepare_close&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8616, 11, 'Process', 'FacilityMaster.do?event=master_checker_process&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8617, 11, 'Process', 'FacilityMaster.do?event=master_checker_process&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8606, 10, 'Process', 'FacilityMaster.do?event=process&trxId=');
INSERT INTO CMS_STATEMATRIX_ACTION (STATE_ID, TEAM_MEMBERSHIP_TYPE_ID, USER_ACTION, URL) VALUES 
(8606, 10, 'Close', 'FacilityMaster.do?event=prepare_close&trxId=');

insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
(select max(stateid), 10, 'Process', 'FacilityMaster.do?event=process&trxId=' from tr_state_matrix where stateins = 'FACILITY' and fromstate = 'PENDING_PERFECTION');
insert into cms_statematrix_action (state_id, team_membership_type_id, user_action, url)
(select max(stateid), 11, 'Process', 'FacilityMaster.do?event=master_checker_process&trxId=' from tr_state_matrix where stateins = 'FACILITY' and fromstate = 'PENDING_RETRY');

INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'PENDING_CREATE', 'Pending Create', 'Facility');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'REJECTED_CREATE', 'Rejected', 'Facility');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'REJECTED_UPDATE', 'Rejected', 'Facility');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'DRAFT', 'Draft', 'Facility');
INSERT INTO CMS_TRX_TOTRACK (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE) VALUES 
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'PENDING_UPDATE', 'Pending Update', 'Facility');
insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'LOADING', 'Loading', 'Facility');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'PENDING_RETRY', 'Pending Retry', 'Facility');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type)
values
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'PENDING_PERFECTION', 'Pending Perfection', 'Facility');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type, from_state)
values
('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'ACTIVE', 'Implemented', 'Facility', 'LOADING');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type,from_state)
 values('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Facility','PENDING_UPDATE');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type,from_state)
 values('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Facility','PENDING_CREATE');

insert into cms_trx_totrack (transaction_type, totrack_url, curr_state, user_state, user_trx_type,from_state)
 values('FACILITY', 'FacilityMaster.do?event=view&trxId=', 'ACTIVE', 'Approved', 'Facility','PENDING_PERFECTION');

