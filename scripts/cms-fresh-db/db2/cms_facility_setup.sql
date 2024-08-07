
----------------------------------------------------------------------
-- Facility Global
----------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000050, 'FacilityGlobal', 'global_list', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000051, 'FacilityGlobal', 'edit_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000052, 'FacilityGlobal', 'update_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (77700052, 'FacilityGlobal', 'delete_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000053, 'FacilityGlobal', 'create_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000054, 'FacilityGlobal', 'process', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000055, 'FacilityGlobal', 'edit_staging_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000056, 'FacilityGlobal', 'approve_doc', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000057, 'FacilityGlobal', 'reject_doc', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000058, 'FacilityGlobal', 'update_staging_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000059, 'FacilityGlobal', 'close_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000060, 'FacilityGlobal', 'close', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000061, 'FacilityGlobal', 'to_track', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000062, 'FacilityGlobal', 'to_track', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000063, 'FacilityGlobal', 'prepare_create_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000064, 'FacilityGlobal', 'prepare_edit_doc_item', 6);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000016, 'FacilityGlobal', 'global_list', 22);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000017, 'FacilityGlobal', 'global_list', 13);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000018, 'FacilityGlobal', 'global_list', 14);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000019, 'FacilityGlobal', 'global_list', 15);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000020, 'FacilityGlobal', 'global_list', 20);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000065, 'FacilityGlobal', 'global_list', 10);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000022, 'FacilityGlobal', 'global_list', 2);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000023, 'FacilityGlobal', 'global_list', 3);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000066, 'FacilityGlobal', 'global_list', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) VALUES (70000067, 'FacilityGlobal', 'global_list', 7);

insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'global_list', 13 from cms_function_access where action = 'FacilityGlobal' group by action;









Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000150, 'CAMGlobal', 'global_list', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000151, 'CAMGlobal', 'edit_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000152, 'CAMGlobal', 'update_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (77700152, 'CAMGlobal', 'delete_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000153, 'CAMGlobal', 'create_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000154, 'CAMGlobal', 'process', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000155, 'CAMGlobal', 'edit_staging_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000156, 'CAMGlobal', 'approve_doc', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000157, 'CAMGlobal', 'reject_doc', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000158, 'CAMGlobal', 'update_staging_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000159, 'CAMGlobal', 'close_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000160, 'CAMGlobal', 'close', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000161, 'CAMGlobal', 'to_track', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000162, 'CAMGlobal', 'to_track', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000163, 'CAMGlobal', 'prepare_create_doc_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000164, 'CAMGlobal', 'prepare_edit_doc_item', 6);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000016, 'CAMGlobal', 'global_list', 22);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000017, 'CAMGlobal', 'global_list', 13);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000018, 'CAMGlobal', 'global_list', 14);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000019, 'CAMGlobal', 'global_list', 15);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000020, 'CAMGlobal', 'global_list', 20);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000165, 'CAMGlobal', 'global_list', 10);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000022, 'CAMGlobal', 'global_list', 2);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (52000023, 'CAMGlobal', 'global_list', 3);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000166, 'CAMGlobal', 'global_list', 11);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) VALUES (70000167, 'CAMGlobal', 'global_list', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (707000150, 'CAMGlobal', 'view_doc_item', 7);

Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (707000150, 'SecurityMaster', 'refresh_collateral_id', 7);


insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'global_list', 13 from cms_function_access where action = 'CAMGlobal' group by action;

----------------------------------------------------------------------
-- Facility Master
----------------------------------------------------------------------
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000070, 'FacilityMaster', 'prepare_sectype', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000071, 'FacilityMaster', 'show_subtype_list', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000072, 'FacilityMaster', 'create_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000073, 'FacilityMaster', 'edit_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000074, 'FacilityMaster', 'add_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000075, 'FacilityMaster', 'edit_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000076, 'FacilityMaster', 'submit_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000077, 'FacilityMaster', 'approve_template_item', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000078, 'FacilityMaster', 'reject_template_item', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000079, 'FacilityMaster', 'process', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000080, 'FacilityMaster', 'to_track', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000081, 'FacilityMaster', 'to_track', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000082, 'FacilityMaster', 'edit_staging_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000083, 'FacilityMaster', 'update_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000084, 'FacilityMaster', 'close_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000085, 'FacilityMaster', 'view_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000086, 'FacilityMaster', 'close', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000087, 'FacilityMaster', 'prepare_add_template_item', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000088, 'FacilityMaster', 'back', 6);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400020, 'FacilityMaster', 'view_template_item', 22);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400021, 'FacilityMaster', 'view_template_item', 14);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400022, 'FacilityMaster', 'view_template_item', 20);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400023, 'FacilityMaster', 'view_template_item', 13);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400024, 'FacilityMaster', 'view_template_item', 15);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400025, 'FacilityMaster', 'prepare_sectype', 22);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400026, 'FacilityMaster', 'prepare_sectype', 20);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400027, 'FacilityMaster', 'prepare_sectype', 13);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400028, 'FacilityMaster', 'prepare_sectype', 14);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400029, 'FacilityMaster', 'prepare_sectype', 15);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400030, 'FacilityMaster', 'show_subtype_list', 22);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400031, 'FacilityMaster', 'show_subtype_list', 20);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400032, 'FacilityMaster', 'show_subtype_list', 13);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400033, 'FacilityMaster', 'show_subtype_list', 14);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7400034, 'FacilityMaster', 'show_subtype_list', 15);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000089, 'FacilityMaster', 'add_security_master', 6);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000090, 'FacilityMaster', 'remove_item', 6);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) VALUES (70000091, 'FacilityMaster', 'prepare_sectype', 7);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) VALUES (70000092, 'FacilityMaster', 'show_subtype_list', 7);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) VALUES (70000093, 'FacilityMaster', 'view_template_item', 7);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000094, 'FacilityMaster', 'prepare_sectype', 10);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000095, 'FacilityMaster', 'show_subtype_list', 10);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000096, 'FacilityMaster', 'view_template_item', 10);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7403001, 'FacilityMaster', 'prepare_sectype', 2);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7403002, 'FacilityMaster', 'show_subtype_list', 2);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7403016, 'FacilityMaster', 'view_template_item', 2);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7404001, 'FacilityMaster', 'prepare_sectype', 3);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7404002, 'FacilityMaster', 'show_subtype_list', 3);
--Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (7404016, 'FacilityMaster', 'view_template_item', 3);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000097, 'FacilityMaster', 'prepare_sectype', 11);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000098, 'FacilityMaster', 'show_subtype_list', 11);
Insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) Values (70000099, 'FacilityMaster', 'view_template_item', 11);

insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'prepare_sectype', 13 from cms_function_access where action = 'FacilityMaster' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'show_subtype_list', 13 from cms_function_access where action = 'FacilityMaster' group by action;
insert into cms_function_access (id, action, event, role_type)
select max(id) + 1, action, 'view_template_item', 13 from cms_function_access where action = 'FacilityMaster' group by action;





Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'CLOSED', 'Closed', 'Maintain Facility (Global)', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain Facility (Global)', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'ACTIVE', 'Approved', 'Maintain Facility (Global)', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain Facility (Global)', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'REJECTED', 'Rejected', 'Maintain Facility (Global)', 'FAC_GLOBAL_TEMPLATE');






Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'CLOSED', 'Closed', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'PENDING_UPDATE', 'Pending Update', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'ACTIVE', 'Approved', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'PENDING_CREATE', 'Pending Create', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'REJECTED', 'Rejected', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');


Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'PENDING_DELETE', 'Pending Delete', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Facility (Global) ', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'SecurityGlobal.do?event=to_track&docTrxID=', 'PENDING_DELETE', 'Pending Delete', 'Maintain Security (Global) ', 'COL_GLOBAL_TEMPLATE');


Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'CAMGlobal.do?event=to_track&docTrxID=', 'DELETED', ' Deleted', 'Maintain CAM ', 'CAM_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'FacilityGlobal.do?event=to_track&docTrxID=', 'DELETED', ' Deleted', 'Maintain Facility (Global) ', 'FAC_GLOBAL_TEMPLATE');
Insert into cms_trx_totrack (TRANSACTION_TYPE, TOTRACK_URL, CURR_STATE, USER_STATE, USER_TRX_TYPE, TRANSACTION_SUBTYPE) Values ('DOCITEM', 'SecurityGlobal.do?event=to_track&docTrxID=', 'DELETED', ' Deleted', 'Maintain Security (Global) ', 'COL_GLOBAL_TEMPLATE');
