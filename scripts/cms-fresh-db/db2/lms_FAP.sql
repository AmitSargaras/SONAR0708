--**************************************************************************************************    
--********************* Create Function Access  for CCI  *********************
--******************************  C C I   ******************************
--**************************************************************************************************    

INSERT INTO cms_function_access (id, action, event, role_type) VALUES (31300001, 'CounterpartyCCI', 'prepare', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'add', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'save', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'submit', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'cancel', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'listview', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'read', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'remove', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'read', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'edit', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'prepare_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'search_customer', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'cc_customer_list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'customer_list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'prepare_update', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'remove', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'checker_edit_cci', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'checker_approve_edit_cci', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'read', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'view', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'maker_edit_cci_reject', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'maker_close_cci', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'prepare_create', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'checker_reject_edit_cci', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'maker_close_cci_confirm', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'viewLimitProfile', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CounterpartyCCI'), 'CounterpartyCCI', 'viewLimitProfile', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'prepare_delete', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'delete', 28);
-- GEMS AM external customer search
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 29);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 29);
-- SAC external customer search
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 24);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 24);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'first_search', 10);
INSERT INTO cms_function_access (id, action, event, role_type)  VALUES ((SELECT max (id) + 1  FROM cms_function_access WHERE action ='CounterpartyCCI'), 'CounterpartyCCI', 'subsequent_search', 10);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE)  Values ((select max (ID) + 1  from cms_function_access where action = 'CounterpartyCCI'), 'CounterpartyCCI', 'to_track', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE)  Values ((select max (ID) + 1  from cms_function_access where action = 'CounterpartyCCI'), 'CounterpartyCCI', 'to_track', 29);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE)  values ((SELECT max (id) + 1  FROM cms_function_access WHERE action = 'CounterpartyCCI'),'CounterpartyCCI','view_customer_details',28);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE)  values ((SELECT max (id) + 1  FROM cms_function_access WHERE action = 'CounterpartyCCI'),'CounterpartyCCI','view_customer_details',29);

--******************************  End C C I   ******************************


----   FAP For Internal Limit & Customer Group Module
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES(31930001,'MaintainGroupProfile','prepare_edit',10);
INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES(31930002,'MaintainGroupProfile','prepare_view',10);


-- Function access

--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES(31900001,'InternalLimitList','prepare_edit',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','prepare_view',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','prepare_process',7);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','submit',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','add_item',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','add_return',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','save',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','delete',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','approve',7);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','reject',7);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','paginate_edit',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','paginate_view',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','paginate_process',7);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','mk_process',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','prepare_close',7);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitList'),'InternalLimitList','ck_process',7);

--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES(31920001,'InternalLimitItem','prepare_add',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitItem'),'InternalLimitItem','confirm_add',6);
--INSERT INTO CMS_FUNCTION_ACCESS ( ID, ACTION, EVENT, ROLE_TYPE ) VALUES((select max(ID)+1 from cms_function_access where action='InternalLimitItem'),'InternalLimitItem','cancel_add',6);

delete from CMS_FUNCTION_ACCESS where action='InternalLimitList';

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900001, 'InternalLimitList', 'internal_limit_list',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900002, 'InternalLimitList', 'maker_edit_internallimit',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900003, 'InternalLimitList', 'maker_edit_internalLmt_confirm',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900004, 'InternalLimitList', 'checker_process_internalLmt',  33);   

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900005, 'InternalLimitList', 'to_track',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900006, 'InternalLimitList', 'to_track',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900007, 'InternalLimitList', 'checker_approve_internalLmt',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900008, 'InternalLimitList', 'checker_reject_internalLmt',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900009, 'InternalLimitList', 'maker_edit_internalLmt_reject',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900010, 'InternalLimitList', 'maker_prepare_close',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900011, 'InternalLimitList', 'maker_close_internalLmt_confirm',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(31900012, 'InternalLimitList', 'maker_resubmit_edit_internalLmt_confirm',  32);




--CustGrpIdentifier
INSERT INTO cms_function_access (id, action, event, role_type) VALUES (31400001, 'CustGrpIdentifier', 'prepare', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'add', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'save', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'submit', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'cancel', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'listview', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'remove', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'edit', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'search_customer', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'cc_customer_list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'customer_list', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_update', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'remove', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker_edit_cgid', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker_approve_edit_cgid', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'view', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker_edit_cgid_reject', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker_close_cgid', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_create', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker_reject_edit_cgid', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker_close_cgid_confirm', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'viewLimitProfile', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'viewLimitProfile', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'to_track', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'to_track', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'update_return', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'update_return', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'itemDelete', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'itemDelete2', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'itemDelete', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'itemDelete2', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'process_return', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'process_return', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read_return', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read_return', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'process_update', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read_return', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker_edit_cgid', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker_close_cgid', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_delete', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'delete', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'searchMemeber', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'searchGroup', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_search', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'searchGroup', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'list', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'read_return', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker2_edit', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier','to_track', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'view', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_update', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier','maker2_save', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker2_submit', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'cancel', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'process2_update', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare2_update', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker2_close_cgid', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'maker2_close_cgid_confirm', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker2_edit_cgid', 31);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker2_reject_edit_cgid', 31);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'checker2_approve_edit_cgid', 31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker_close_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process2_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','approve',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','reject',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','read',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','read_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','cancel',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','checker2_edit_cgid',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','to_track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_edit_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process2_update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker_close_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process2_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','approve',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','reject',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','read',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','read_return',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','cancel',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','checker2_edit_cgid',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','to_track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_edit_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','process2_update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_edit_cgid_reject',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','to_track',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','track_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_subgroup',28);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_subgroup',29);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_subgroup',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_subgroup',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_edit_cgid_reject',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','maker2_edit_cgid_reject_return',30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare2', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'update_return_sublimit', 30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'update_return_otrlimit', 30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','prepare_rejected_delete',28);

INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'list', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_search', 29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',29);

INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare', 31);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'list', 31);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'CustGrpIdentifier'), 'CustGrpIdentifier', 'prepare_search', 31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'CustGrpIdentifier'),'CustGrpIdentifier','view_return',31);



--GroupCreditGrade

insert into cms_function_access (id, action, event, role_type) values (31500001,'GroupCreditGrade','create',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare_update',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','update_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','close_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','update',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','close',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare_update_sub',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','itemDelete',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare_form',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare_close',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','submit',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','cancel',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','edit',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','process_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','approve',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','reject',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','process',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker_close_cgid',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker_close_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','checker_edit_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','prepare_delete',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','refresh_create',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','refresh_update',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','process2_update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit_cgid_reject',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','to_track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','process2_update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit_cgid_reject',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','process2_update',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_close_cgid',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','read_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','track_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','checker2_edit_cgid',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupCreditGrade'),'GroupCreditGrade','maker2_edit_cgid_reject_return',30);


--GroupSubLimit
insert into cms_function_access (id, action, event, role_type) values (31600001,'GroupSubLimit','create',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare_update',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','update',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','close',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare_update_sub',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','itemDelete',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare_form',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare_close',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','submit',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','read',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','edit',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','cancel',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','process_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','approve',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','reject',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','process',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','read',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','read_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','maker_close_cgid',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','maker_close_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','checker_edit_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupSubLimit'),'GroupSubLimit','prepare_delete',30);

--GroupOtrLimit
insert into cms_function_access (id, action, event, role_type) values (40000001,'GroupOtrLimit','create',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare_update',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','update',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','close',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare_update_sub',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','itemDelete',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare_form',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare_close',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','submit',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','read',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','edit',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','cancel',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','process_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','approve',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','reject',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','process',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','read',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','read_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','maker_close_cgid',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','maker_close_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','checker_edit_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupOtrLimit'),'GroupOtrLimit','prepare_delete',30);


-- GroupMember
insert into cms_function_access (id, action, event, role_type) values (31700001,'GroupMember','create',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_update',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','update_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','close_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track_return',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','update',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','close',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_update_sub',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','itemDelete',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_form',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_close',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','submit',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','edit',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','cancel',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','ext_search_customer',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','ext_customer_list',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','add',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','searchMemeber',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','searchGroup',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_search_group',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','process_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','approve',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','reject',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','process',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read_return',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','cancel',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker_close_cgid',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker_close_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','checker_edit_cgid',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','prepare_delete',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','search_group_list',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','to_track',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','to_track',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','to_track',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','to_track',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_edit_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_close_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','process2_update_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_edit_cgid_reject',30);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','first_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','subsequent_search', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','first_search', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','subsequent_search', 29);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read_return',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_edit',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_edit_return',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','process2_update',30); 
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_close_cgid',30); 
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','read_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','checker2_edit_cgid',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','track_return',31);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','popup_shareholder',28);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','popup_shareholder',29);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','popup_shareholder',30);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','popup_shareholder',31);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','maker2_edit_cgid_reject_return',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1  FROM cms_function_access  WHERE action = 'GroupMember'),'GroupMember','create_customer',28);


--   CUSTOMER SEARCH

---  Create function access matrix for cust relationship ui access for gems am maker and gems am checker
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (32010000, 'CRCustomerSearch', 'prepare', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'customer_add', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'search_customer', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'first_search', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'subsequent_search', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'view_cust_details', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_customer_search_select', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_customer_search', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'cust_shareholder_add', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_cus_sh_search', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_cust_search_sh_select', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'first_search', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'subsequent_search', 29);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'customer_add_frame', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_customer_search_frame', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'cust_shareholder_add_frame', 28);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRCustomerSearch'), 'CRCustomerSearch', 'add_cus_sh_search_frame', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'return', 28);


--   CUSTOMER SEARCH

---  Create function access matrix for cust relationship ui access for am maker
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'prepare', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'search_customer', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'return', 30);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'prepare', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'search_customer', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'return', 29);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'prepare', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'search_customer', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRCustomerSearch'), 'CRCustomerSearch', 'return', 31);


--  Create function access matrix for cust relationship ui access
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (32000001, 'CustRelationship', 'prepare', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'list', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'read', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'readMakerEdit', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'add', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'add_new', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'remove', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'submit', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'view', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'readCheckerApproveReject', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'readMakerClose', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'approve', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'reject', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'view', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'close', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'to_track', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'to_track', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'viewLimitProfile', 28); 
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'cancel', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'add_frame', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'paginate', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'listView', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'listCheckerApproveReject', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'listRead', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustRelationship'), 'CustRelationship', 'listRead', 29);


-- Share Holder
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (31000001, 'CRShareHolder', 'prepare', 28);

INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'list', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'read', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'readMakerEdit', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'add', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'add_new', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'remove', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'submit', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'view', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'readCheckerApproveReject', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'readMakerClose', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'approve', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'reject', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'view', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'close', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'to_track', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CRShareHolder'), 'CRShareHolder', 'to_track', 29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','cancel',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','add_frame',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','paginate',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','listView',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','listCheckerApproveReject',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','listRead',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max(id) + 1 FROM cms_function_access WHERE action = 'CRShareHolder'), 'CRShareHolder','listRead',29);


-- Customer Process
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustomerProcess'), 'CustomerProcess', 'viewLimitProfile', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'CustomerProcess'), 'CustomerProcess', 'processcusdetails', 28);


--  Create function access matrix for exempted inst customer search ui access
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (31110001, 'EICustomerSearch', 'prepare', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'EICustomerSearch'), 'EICustomerSearch', 'customer_add', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'EICustomerSearch'), 'EICustomerSearch', 'add_customer_search', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'EICustomerSearch'), 'EICustomerSearch', 'add_customer_search_select', 32);

--  Create function access matrix for exempted inst ui access
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (31100001, 'ExemptInst', 'prepare', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'list', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'read', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'readMakerEdit', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'add', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'add_new', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'remove', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'submit', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'view', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'readCheckerApproveReject', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'readMakerClose', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'approve', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'reject', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'view', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'close', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'to_track', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'to_track', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ExemptInst'), 'ExemptInst', 'cancel', 32); 


-- EXEMPT_FACILITY
INSERT INTO cms_function_access (id, action, event, role_type) VALUES (31800001, 'ExemptFacility', 'list', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'prepare_add', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'add', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'refresh', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'remove', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'prepare_edit', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'edit', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'view', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'submit', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'maker_close', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'read_maker_edit', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'to_track', 32);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'to_track', 33);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'checker_process', 33);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'checker_approve', 33);
INSERT INTO cms_function_access (id, action, event, role_type) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'checker_reject', 33);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'read', 32);
insert into cms_function_access (ID, ACTION, EVENT, ROLE_TYPE) VALUES ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ExemptFacility'), 'ExemptFacility', 'maker_close_confirm', 32);
	

--customerView	
insert into cms_function_access (id, action, event, role_type) values (31200001,'customerView','view_customer_details',28);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'customerView'),'customerView','view_customer_details',29);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'customerView'),'customerView','view_customer_details',30);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'customerView'),'customerView','view_customer_details',31);

--bankEntityBranchParam
insert into cms_function_access (id, action, event, role_type) values (34000001,'bankEntityBranchParam','maker_prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_prepare_resubmit', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_prepare_close', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_prepare_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_delete_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_submit', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_close', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_to_track',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','checker_to_track',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','checker_prepare',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','checker_approve',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','checker_reject',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','to_track', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','to_track', 33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParam','maker_return_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 2 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParamItem','maker_add_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 3 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParamItem','maker_edit_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 4 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParamItem','maker_prepare_item', 32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 5 FROM cms_function_access WHERE action = 'bankEntityBranchParam'),'bankEntityBranchParamItem','maker_return_item', 32);

-- Entity Limit Customer View
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (35000001, 'ELCustomerSearch', 'prepare', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ELCustomerSearch'), 'ELCustomerSearch', 'customer_add', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ELCustomerSearch'), 'ELCustomerSearch', 'add_customer_search', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 'ELCustomerSearch'), 'ELCustomerSearch', 'add_customer_search_select', 32);

--  Entity Limit
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values (35100001, 'EntityLimit', 'prepare', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'list', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'read', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'readMakerEdit', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'add', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'add_new', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'remove', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'submit', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'view', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'readCheckerApproveReject', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'readMakerClose', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'approve', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'reject', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'view', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'close', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'to_track', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'to_track', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'cancel', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'edit', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'update', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'paginate', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'listRead', 32);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'listRead', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'listCheckerApproveReject', 33);
INSERT INTO CMS_FUNCTION_ACCESS (ID, ACTION, EVENT, ROLE_TYPE) Values ((select max(ID) + 1 from cms_function_access where action = 
'EntityLimit'), 'EntityLimit', 'listMakerClose', 32);

--delete from CMS_FUNCTION_ACCESS where ACTION = 'CountryLimitParam';
--delete from CMS_FUNCTION_ACCESS where ACTION = 'CountryLimitItemParam';
--delete from CMS_FUNCTION_ACCESS where ACTION = 'CountryRatingParam';

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000001, 'CountryLimitParam', 'read',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000002, 'CountryLimitParam', 'read',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000003, 'CountryLimitParam', 'prepare_update',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000004, 'CountryLimitParam', 'process_update',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000005, 'CountryLimitParam', 'close',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000006, 'CountryLimitParam', 'process',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000007, 'CountryLimitParam', 'track',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000008, 'CountryLimitParam', 'track',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000009, 'CountryLimitParam', 'create_item',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000010, 'CountryLimitParam', 'update_item',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000011, 'CountryLimitParam', 'delete_item',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000012, 'CountryLimitParam', 'edit_rating',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000013, 'CountryLimitParam', 'create',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000014, 'CountryLimitParam', 'submit',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000015, 'CountryLimitParam', 'approve',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000016, 'CountryLimitParam', 'reject',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000017, 'CountryLimitParam', 'read_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000018, 'CountryLimitParam', 'read_return',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000019, 'CountryLimitParam', 'update_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000020, 'CountryLimitParam', 'close_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000021, 'CountryLimitParam', 'process_return',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000022, 'CountryLimitParam', 'track_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000023, 'CountryLimitParam', 'track_return',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33000024, 'CountryLimitParam', 'prepare_close',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100001, 'CountryLimitItemParam', 'read',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100002, 'CountryLimitItemParam', 'read',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100003, 'CountryLimitItemParam', 'prepare_create',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100004, 'CountryLimitItemParam', 'prepare_update',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100005, 'CountryLimitItemParam', 'create',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100006, 'CountryLimitItemParam', 'submit',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100007, 'CountryLimitItemParam', 'cancel',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100008, 'CountryLimitItemParam', 'read_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33100009, 'CountryLimitItemParam', 'read_return',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200001, 'CountryRatingParam', 'read',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200002, 'CountryRatingParam', 'read',  33);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200003, 'CountryRatingParam', 'prepare_update',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200004, 'CountryRatingParam', 'submit',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200005, 'CountryRatingParam', 'cancel',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200006, 'CountryRatingParam', 'read_return',  32);
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(33200007, 'CountryRatingParam', 'read_return',  33);	

-- SectorLimitParam
--insert into cms_function_access (id, action, event, role_type) values (36000001,'SectorLimitParam','list',32);
--insert into cms_function_access (id, action, event, role_type) values (36000002,'SectorLimitParam','prepare_create',32);
--insert into cms_function_access (id, action, event, role_type) values (36000003,'SectorLimitParam','create',32);
--insert into cms_function_access (id, action, event, role_type) values (36000004,'SectorLimitParam','prepare_add',32);
--insert into cms_function_access (id, action, event, role_type) values (36000005,'SectorLimitParam','add',32);
--insert into cms_function_access (id, action, event, role_type) values (36000006,'SectorLimitParam','remove',32);
--insert into cms_function_access (id, action, event, role_type) values (36000007,'SectorLimitParam','prepare_update',32);
--insert into cms_function_access (id, action, event, role_type) values (36000008,'SectorLimitParam','update',32);
--insert into cms_function_access (id, action, event, role_type) values (36000009,'SectorLimitParam','submit',32);
--insert into cms_function_access (id, action, event, role_type) values (36000010,'SectorLimitParam','read_checker_approve_reject',33);
--insert into cms_function_access (id, action, event, role_type) values (36000011,'SectorLimitParam','approve',33);
--insert into cms_function_access (id, action, event, role_type) values (36000012,'SectorLimitParam','reject',33);
--insert into cms_function_access (id, action, event, role_type) values (36000013,'SectorLimitParam','track',32);
--insert into cms_function_access (id, action, event, role_type) values (36000014,'SectorLimitParam','track',33);
--insert into cms_function_access (id, action, event, role_type) values (36000015,'SectorLimitParam','read_maker_edit',32);
--insert into cms_function_access (id, action, event, role_type) values (36000016,'SectorLimitParam','read_maker_close',32);
--insert into cms_function_access (id, action, event, role_type) values (36000017,'SectorLimitParam','close',32);
--insert into cms_function_access (id, action, event, role_type) values (36000018,'SectorLimitParam','return',32);

/**for sector limit**/
insert into cms_function_access (id, action, event, role_type) values (36000001,'SectorLimitParam','list',32);
insert into cms_function_access (id, action, event, role_type) values (36000002,'SectorLimitParam','prepare',32);
insert into cms_function_access (id, action, event, role_type) values (36000003,'SectorLimitParam','prepare_delete',32);
insert into cms_function_access (id, action, event, role_type) values (36000004,'SectorLimitParam','prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values (36000005,'SectorLimitParam','submit',32);
insert into cms_function_access (id, action, event, role_type) values (36000006,'SectorLimitParam','delete',32);
insert into cms_function_access (id, action, event, role_type) values (36000007,'SectorLimitParam','approve',33);
insert into cms_function_access (id, action, event, role_type) values (36000008,'SectorLimitParam','reject',33);
insert into cms_function_access (id, action, event, role_type) values (36000009,'SectorLimitParam','track',33);
insert into cms_function_access (id, action, event, role_type) values (36000010,'SectorLimitParam','close',32);
insert into cms_function_access (id, action, event, role_type) values (36000011,'SectorLimitParam','maker_process',32);
insert into cms_function_access (id, action, event, role_type) values (36000012,'SectorLimitParam','maker_process_delete',32);
insert into cms_function_access (id, action, event, role_type) values (36000013,'SectorLimitParam','add_item',32);
insert into cms_function_access (id, action, event, role_type) values (36000014,'SectorLimitParam','edit_item',32);
insert into cms_function_access (id, action, event, role_type) values (36000015,'SectorLimitParam','return',32);
insert into cms_function_access (id, action, event, role_type) values (36000016,'SectorLimitParam','delete_item',32);
insert into cms_function_access (id, action, event, role_type) values (36000017,'SectorLimitParam','prepare_close',32);
insert into cms_function_access (id, action, event, role_type) values (36000018,'SectorLimitParam','checker_process',33);
insert into cms_function_access (id, action, event, role_type) values (36000019,'SectorLimitParam','track',32);
insert into cms_function_access (id, action, event, role_type) values (36000020,'SectorLimitParam','view_subitem',32);
insert into cms_function_access (id, action, event, role_type) values (36000021,'SectorLimitParam','view_subitem',33);
insert into cms_function_access (id, action, event, role_type) values (36000022,'SectorLimitParam','view',32);
insert into cms_function_access (id, action, event, role_type) values (36000023,'SectorLimitParam','prepare_edit_sector',32);
insert into cms_function_access (id, action, event, role_type) values (36000024,'SectorLimitParam','checker_process_subitem',33);

/**for sub sector limit**/
insert into cms_function_access (id, action, event, role_type) values (44000001,'SubSectorLimitParam','prepare',32);
insert into cms_function_access (id, action, event, role_type) values (44000002,'SubSectorLimitParam','prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values (44000003,'SubSectorLimitParam','create',32);
insert into cms_function_access (id, action, event, role_type) values (44000004,'SubSectorLimitParam','update',32);
insert into cms_function_access (id, action, event, role_type) values (44000005,'SubSectorLimitParam','return',32);
insert into cms_function_access (id, action, event, role_type) values (44000006,'SubSectorLimitParam','add_item',32);
insert into cms_function_access (id, action, event, role_type) values (44000007,'SubSectorLimitParam','edit_item',32);
insert into cms_function_access (id, action, event, role_type) values (44000008,'SubSectorLimitParam','return_frm_ecoSector',32);
insert into cms_function_access (id, action, event, role_type) values (44000009,'SubSectorLimitParam','delete_eco_item',32);
insert into cms_function_access (id, action, event, role_type) values (44000010,'SubSectorLimitParam','read_subitem',32);
insert into cms_function_access (id, action, event, role_type) values (44000011,'SubSectorLimitParam','read_subitem',33);
insert into cms_function_access (id, action, event, role_type) values (44000012,'SubSectorLimitParam','add_eco_items',32);
insert into cms_function_access (id, action, event, role_type) values (44000013,'SubSectorLimitParam','checker_view_subitem',33);

/**for economic sector limit**/
insert into cms_function_access (id, action, event, role_type) values (45000001,'EconSectorLimitParam','prepare',32);
insert into cms_function_access (id, action, event, role_type) values (45000002,'EconSectorLimitParam','prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values (45000003,'EconSectorLimitParam','create',32);
insert into cms_function_access (id, action, event, role_type) values (45000004,'EconSectorLimitParam','update',32);
insert into cms_function_access (id, action, event, role_type) values (45000005,'EconSectorLimitParam','return',32);


/**************************************************************************
 Requestor : Grace Teh Mooi Eng
 Desc :  Script for Internal CRedit Rating Parameter module.
 Task :  Function Access setup 
 Date :  10/06/2008
*************************************************************************/
--delete from CMS_FUNCTION_ACCESS where action='InternalCreditRatingParam';

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000001, 'InternalCreditRatingParam', 'credit_rating_list',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000002, 'InternalCreditRatingParam', 'maker_create_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000003, 'InternalCreditRatingParam', 'maker_create_item_confirm',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000004, 'InternalCreditRatingParam', 'maker_return_add_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000005, 'InternalCreditRatingParam', 'maker_edit_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000006, 'InternalCreditRatingParam', 'maker_submit_internalCreditrating',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000007, 'InternalCreditRatingParam', 'checker_prepare_process',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000008, 'InternalCreditRatingParam', 'maker_prepare_close',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000009, 'InternalCreditRatingParam', 'checker_approve_internalCreditrating',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000010, 'InternalCreditRatingParam', 'checker_reject_internalCreditrating',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000011, 'InternalCreditRatingParam', 'maker_close_internalCreditrating_confirm',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000012, 'InternalCreditRatingParam', 'to_track',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000013, 'InternalCreditRatingParam', 'to_track',  33);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000014, 'InternalCreditRatingParam', 'maker_delete_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37000015, 'InternalCreditRatingParam', 'maker_prepare_update',  32);

--delete from CMS_FUNCTION_ACCESS where action='InternalCreditRatingItem';

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37100001, 'InternalCreditRatingItem', 'maker_create_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37100002, 'InternalCreditRatingItem', 'maker_edit_internallimit',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37100003, 'InternalCreditRatingItem', 'maker_create_item_confirm',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37100004, 'InternalCreditRatingItem', 'maker_edit_item',  32);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES(37100005, 'InternalCreditRatingItem', 'maker_submit',  32);


/*********************************************************************
   Date  :   Wednesday, July 2, 2008
   Owner :   SK
   Patch :   DB Code patch for LMS - Customer Exposure
*********************************************************************/
insert into cms_function_access("ID","ACTION","EVENT","ROLE_TYPE") values (38000001,'CustExposure','view_cust_exposure',28);
insert into cms_function_access("ID","ACTION","EVENT","ROLE_TYPE") values (38000002,'CustExposure','view_grp_exposure',28);
insert into cms_function_access("ID","ACTION","EVENT","ROLE_TYPE") values (38000003,'CustExposure','view_cust_back_sys_exposure',28);
INSERT INTO CMS_FUNCTION_ACCESS(ID,ACTION, EVENT, ROLE_TYPE) Values (38000004, 'CustExposure', 'view_cust_exposure_frm_grp', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (38000005, 'CustExposure', 'view_grp_to_otr_grp_exposure', 28);

insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38100001,'CustExposure','view_cust_exposure',30);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38100002,'CustExposure','view_cust_back_sys_exposure',30);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38100003,'CustExposure','view_grp_exposure',30);
INSERT INTO CMS_FUNCTION_ACCESS(ID,ACTION, EVENT, ROLE_TYPE) Values (38100004, 'CustExposure', 'view_cust_exposure_frm_grp', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (38100005, 'CustExposure', 'view_grp_to_otr_grp_exposure', 30);

insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38200001,'CustExposure','view_cust_exposure',29);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38200002,'CustExposure','view_cust_back_sys_exposure',29);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38200003,'CustExposure','view_grp_exposure',29);
INSERT INTO CMS_FUNCTION_ACCESS(ID,ACTION, EVENT, ROLE_TYPE) Values (38200004, 'CustExposure', 'view_cust_exposure_frm_grp', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (38200005, 'CustExposure', 'view_grp_to_otr_grp_exposure', 29);

insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38300001,'CustExposure','view_cust_exposure',31);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38300002,'CustExposure','view_cust_back_sys_exposure',31);
insert into cms_function_access(ID, ACTION, EVENT, ROLE_TYPE) values (38300003,'CustExposure','view_grp_exposure',31);
INSERT INTO CMS_FUNCTION_ACCESS(ID,ACTION, EVENT, ROLE_TYPE) Values (38300004, 'CustExposure', 'view_cust_exposure_frm_grp', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (38300005, 'CustExposure', 'view_grp_to_otr_grp_exposure', 31);


/**************************************************************************
 Requestor : Priya
 Desc :  Script for Limit Booking module.
 Task :  Function Access setup 
 Date :  11/07/2008
*************************************************************************/

--delete from CMS_FUNCTION_ACCESS where ACTION='LimitBooking';


INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) VALUES(39000001, 'LimitBooking', 'prepare_add_booking',  28);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'add_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_search_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'search_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_edit_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'edit_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_delete_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'delete_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_successful_booking',  28);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'successful_booking',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_add_pol_add',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_add_pol_edit',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'add_pol',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_edit_pol_add',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_edit_pol_edit',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'edit_pol',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_search_group_add',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'prepare_search_group_edit',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'search_group',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'add_group',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'view_result_add',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'view_result_edit',  28);

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'view_cancel_result',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'remove_pol_add',  28);
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'remove_pol_edit',  28);	
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'remove_group_add',  28);	
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'remove_group_edit',  28);	

INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'retrieve_bgel_add',  28);	
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'retrieve_bgel_edit',  28);	
	
INSERT INTO CMS_FUNCTION_ACCESS(ID, ACTION, EVENT, ROLE_TYPE) 
	VALUES((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'LimitBooking'), 'LimitBooking', 'limit_booking_popup',  28);

/**************************
Concentration Report 
***************************/
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'conc_report_new'), 'conc_report_new', '*', 28);
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'conc_report_new'), 'conc_report_new', '*', 29);
   
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'conc_report_new'), 'conc_report_new', '*', 30);
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'conc_report_new'), 'conc_report_new', '*', 31);

Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'ConcentrationReportSearch'), 
   'ConcentrationReportSearch', '*', 28);
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'ConcentrationReportSearch'), 
   'ConcentrationReportSearch', '*', 29);

Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'ConcentrationReportSearch'), 
   'ConcentrationReportSearch', '*', 30);
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'ConcentrationReportSearch'), 
   'ConcentrationReportSearch', '*', 31);
   
   
/**************************
 Requestor : Grace Teh
 Desc :  Script for Group SVC module.
 Task :  Function Access setup 
 Date :  12/07/2008
***************************/   
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41000001, 'GrpExposure', 'view_grp_exposure', 28); 
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41000002, 'GrpExposure', 'view_all_group_exposures', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41000003, 'GrpExposure', 'grp_exposure_rpt', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41000004, 'GrpExposure', 'view_single_grp_exposure', 28);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41000005, 'GrpExposure', 'view_otr_grp_exposure', 28);

INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41100001, 'GrpExposure', 'view_grp_exposure', 30); 
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41100002, 'GrpExposure', 'view_all_group_exposures', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41100003, 'GrpExposure', 'grp_exposure_rpt', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41100004, 'GrpExposure', 'view_single_grp_exposure', 30);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41100005, 'GrpExposure', 'view_otr_grp_exposure', 30);

INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41200001, 'GrpExposure', 'view_grp_exposure', 29); 
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41200002, 'GrpExposure', 'view_all_group_exposures', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41200003, 'GrpExposure', 'grp_exposure_rpt', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41200004, 'GrpExposure', 'view_single_grp_exposure', 29);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41200005, 'GrpExposure', 'view_otr_grp_exposure', 29);

INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41300001, 'GrpExposure', 'view_grp_exposure', 31); 
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41300002, 'GrpExposure', 'view_all_group_exposures', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41300003, 'GrpExposure', 'grp_exposure_rpt', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41300004, 'GrpExposure', 'view_single_grp_exposure', 31);
INSERT INTO CMS_FUNCTION_ACCESS (ID,ACTION, EVENT, ROLE_TYPE) Values (41300005, 'GrpExposure', 'view_otr_grp_exposure', 31);

/****************************
Change Role
****************************/  
insert into cms_function_access values (17100009, 'ChangeRole', '*', 28);

insert into cms_function_access values (17100010, 'ChangeRole', '*', 29);

insert into cms_function_access values (17100011, 'ChangeRole', '*', 30);

insert into cms_function_access values (17100012, 'ChangeRole', '*', 31);

insert into cms_function_access values (17100013, 'ChangeRole', '*', 32);

insert into cms_function_access values (17100014, 'ChangeRole', '*', 33);

/**************************
CCI Report Search
***************************/
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   (42000001, 'CCIReportSearch', '*', 28);
Insert into cms_function_access
   (ID, ACTION, EVENT, ROLE_TYPE)
 Values
   ((select max(ID) + 1 from cms_function_access where action = 'CCIReportSearch'),
   'CCIReportSearch', '*', 29);
 
/**for product program limit**/   
insert into cms_function_access (id, action, event, role_type) values (57000001,'ProductProgramLimitParam','list',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','prepare',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','prepare_delete',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','submit',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','delete',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','approve',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','reject',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','track',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','close',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','maker_process',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','maker_process_delete',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','add_item',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','edit_item',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','return',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','delete_item',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','prepare_close',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','checker_process',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','track',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','view_subitem',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','view_subitem',33);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','view',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductProgramLimitParam'),'ProductProgramLimitParam','prepare_edit_product',32);

/**for product type limit**/
insert into cms_function_access (id, action, event, role_type) values (58000001,'ProductTypeLimitParam','prepare',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductTypeLimitParam'),'ProductTypeLimitParam','prepare_update',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductTypeLimitParam'),'ProductTypeLimitParam','create',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductTypeLimitParam'),'ProductTypeLimitParam','update',32);
insert into cms_function_access (id, action, event, role_type) values ((SELECT max (id) + 1 FROM cms_function_access WHERE action = 'ProductTypeLimitParam'),'ProductTypeLimitParam','return',32);


/** for GenerateLI ****/
insert into CMS_FUNCTION_ACCESS(ID,ACTION,EVENT,ROLE_TYPE) values ( 60000001,'GenerateLI','generate_li',10);
insert into CMS_FUNCTION_ACCESS(ID,ACTION,EVENT,ROLE_TYPE) values ( (SELECT max (id) + 1 FROM cms_function_access WHERE action = 'GenerateLI'),'GenerateLI','list',10);

COMMIT WORK; 



